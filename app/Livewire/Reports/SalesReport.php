<?php

namespace App\Livewire\Reports;

use Carbon\Carbon;
use App\Models\Tax;
use App\Models\Order;
use Livewire\Component;
use Livewire\Attributes\On;
use App\Models\RestaurantCharge;
use App\Exports\SalesReportExport;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;
use App\Models\PaymentGatewayCredential;
use App\Models\User;

class SalesReport extends Component
{
    public $dateRangeType = 'currentWeek';
    public $startDate;
    public $endDate;
    public $startTime = '00:00'; // Default start time
    public $endTime = '23:59';  // Default end time
    public $currencyId;
    public $filterByWaiter = '';
    public $waiters = [];
    public $selectedWaiter = '';

    public function mount()
    {
        abort_unless(in_array('Report', restaurant_modules()), 403);
        abort_unless(user_can('Show Reports'), 403);

        // Centralize currency ID
        $this->currencyId = restaurant()->currency_id;

        // Load date range type from cookie
        $this->dateRangeType = request()->cookie('sales_report_date_range_type', 'currentWeek');
        $this->setDateRange();
        // Populate waiters
        $this->waiters = User::whereHas('roles', function($query) {
            $query->where('name', 'Waiter_'.restaurant()->id);
        })->get();

        $this->selectedWaiter = '';
    }

    public function setDateRange()
    {
        $ranges = [
            'today' => [now()->startOfDay(), now()->endOfDay()],
            'lastWeek' => [now()->subWeek()->startOfWeek(), now()->subWeek()->endOfWeek()],
            'last7Days' => [now()->subDays(7), now()->endOfDay()],
            'currentMonth' => [now()->startOfMonth(), now()->endOfDay()],
            'lastMonth' => [now()->subMonth()->startOfMonth(), now()->subMonth()->endOfMonth()],
            'currentYear' => [now()->startOfYear(), now()->endOfDay()],
            'lastYear' => [now()->subYear()->startOfYear(), now()->subYear()->endOfYear()],
            'currentWeek' => [now()->startOfWeek(), now()->endOfWeek()],
        ];

        [$start, $end] = $ranges[$this->dateRangeType] ?? $ranges['currentWeek'];
        $this->startDate = $start->format('m/d/Y');
        $this->endDate = $end->format('m/d/Y');
        $this->filterByWaiter = '';
    }

    #[On('setStartDate')]
    public function setStartDate($start)
    {
        $this->startDate = $start;
    }

    #[On('setEndDate')]
    public function setEndDate($end)
    {
        $this->endDate = $end;
    }

    private function prepareDateTimeData()
    {
        $timezone = timezone();
        $offset = Carbon::now($timezone)->format('P');

        $startDateTime = Carbon::createFromFormat('m/d/Y H:i', $this->startDate . ' ' . $this->startTime, $timezone)
            ->setTimezone('UTC')->toDateTimeString();

        $endDateTime = Carbon::createFromFormat('m/d/Y H:i', $this->endDate . ' ' . $this->endTime, $timezone)
            ->setTimezone('UTC')->toDateTimeString();

        $startTime = Carbon::parse($this->startTime, $timezone)->setTimezone('UTC')->format('H:i');
        $endTime = Carbon::parse($this->endTime, $timezone)->setTimezone('UTC')->format('H:i');

        return compact('timezone', 'offset', 'startDateTime', 'endDateTime', 'startTime', 'endTime');
    }

    public function exportReport()
    {
        if (!in_array('Export Report', restaurant_modules())) {
            $this->dispatch('showUpgradeLicense');
            return;
        }

        $dateTimeData = $this->prepareDateTimeData();

        return Excel::download(
            new SalesReportExport(
                $dateTimeData['startDateTime'],
                $dateTimeData['endDateTime'],
                $dateTimeData['startTime'],
                $dateTimeData['endTime'],
                $dateTimeData['timezone'],
                $dateTimeData['offset']
            ),
            'sales-report-' . now()->format('Y-m-d_His') . '.xlsx'
        );
    }

    public function updatedDateRangeType($value)
    {
        cookie()->queue(cookie('sales_report_date_range_type', $value, 60 * 24 * 30)); // 30 days
    }

    public function filterWaiter()
    {
        $this->filterByWaiter = $this->selectedWaiter;
    }

    public function render()
    {
        $dateTimeData = $this->prepareDateTimeData();

        // Retrieve all taxes and charges
        $charges = RestaurantCharge::all();
        $taxes = Tax::all();
        $restaurant = restaurant();
        $taxMode = $restaurant->tax_mode ?? 'order';

        // Get sales report with charges grouped
        $query = Order::join('payments', 'orders.id', '=', 'payments.order_id')
            ->whereBetween('orders.date_time', [$dateTimeData['startDateTime'], $dateTimeData['endDateTime']])
            ->where('orders.status', 'paid')
            ->where(function ($q) use ($dateTimeData) {
                if ($dateTimeData['startTime'] < $dateTimeData['endTime']) {
                    $q->whereRaw('TIME(orders.date_time) BETWEEN ? AND ?', [$dateTimeData['startTime'], $dateTimeData['endTime']]);
                }
                else
                 {
                    $q->where(function ($sub) use ($dateTimeData) {
                        $sub->whereRaw('TIME(orders.date_time) >= ?', [$dateTimeData['startTime']])
                            ->orWhereRaw('TIME(orders.date_time) <= ?', [$dateTimeData['endTime']]);
                    });
                }
            });

        // Filter by waiter if selected
        if ($this->filterByWaiter) {
            $query->where('orders.waiter_id', $this->filterByWaiter);
        }

        $query = $query->select(
            DB::raw('DATE(CONVERT_TZ(orders.date_time, "+00:00", "' . $dateTimeData['offset'] . '")) as date'),
            DB::raw('COUNT(DISTINCT orders.id) as total_orders'),
            DB::raw('SUM(payments.amount) as total_amount'),
            DB::raw('SUM(orders.discount_amount) as discount_amount'),
            DB::raw('SUM(orders.tip_amount) as tip_amount'),
            DB::raw('SUM(orders.delivery_fee) as delivery_fee'),
            DB::raw('SUM(CASE WHEN payments.payment_method = "cash" THEN payments.amount ELSE 0 END) as cash_amount'),
            DB::raw('SUM(CASE WHEN payments.payment_method = "card" THEN payments.amount ELSE 0 END) as card_amount'),
            DB::raw('SUM(CASE WHEN payments.payment_method = "upi" THEN payments.amount ELSE 0 END) as upi_amount'),
            DB::raw('SUM(CASE WHEN payments.payment_method = "razorpay" THEN payments.amount ELSE 0 END) as razorpay_amount'),
            DB::raw('SUM(CASE WHEN payments.payment_method = "stripe" THEN payments.amount ELSE 0 END) as stripe_amount'),
            DB::raw('SUM(CASE WHEN payments.payment_method = "flutterwave" THEN payments.amount ELSE 0 END) as flutterwave_amount'),
        )
        ->groupBy('date')
        ->orderBy('date')
        ->get();

        // Process taxes and charges dynamically using actual tax breakdown data
        $groupedData = $query->map(function ($item) use ($charges, $taxes, $taxMode) {
            $chargeAmounts = [];
            foreach ($charges as $charge) {
                $chargeAmounts[$charge->charge_name] = DB::table('order_charges')
                    ->join('orders', 'order_charges.order_id', '=', 'orders.id')
                    ->join('restaurant_charges', 'order_charges.charge_id', '=', 'restaurant_charges.id')
                    ->where('order_charges.charge_id', $charge->id)
                    ->where('orders.status', 'paid')
                    ->whereDate('orders.date_time', $item->date)
                    ->where('orders.branch_id', branch()->id)
                    ->sum(DB::raw('CASE WHEN restaurant_charges.charge_type = "percent"
                THEN (restaurant_charges.charge_value / 100) * orders.sub_total
                ELSE restaurant_charges.charge_value END')) ?? 0;
            }

            // Get tax breakdown - first try tax_breakup from order_items, then fallback to stored total_tax_amount
            $taxAmounts = [];
            $totalTaxAmount = 0;
            $taxDetails = [];

            // Initialize tax amounts for all taxes
            foreach ($taxes as $tax) {
                $taxAmounts[$tax->tax_name] = 0;
                $taxDetails[$tax->tax_name] = [
                    'name' => $tax->tax_name,
                    'percent' => $tax->tax_percent,
                    'total_amount' => 0,
                    'items_count' => 0
                ];
            }

            // First, try to get tax breakdown from order_items tax_breakup
            $itemTaxBreakup = DB::table('order_items')
                ->join('orders', 'order_items.order_id', '=', 'orders.id')
                ->where('orders.status', 'paid')
                ->where('orders.branch_id', branch()->id)
                ->whereDate('orders.date_time', $item->date)
                ->whereNotNull('order_items.tax_breakup')
                ->select('order_items.tax_breakup', 'order_items.quantity')
                ->get();

            if ($itemTaxBreakup->isNotEmpty()) {
                // Use tax_breakup from order_items
                foreach ($itemTaxBreakup as $itemBreakup) {
                    $breakup = json_decode($itemBreakup->tax_breakup, true);
                    if ($breakup && is_array($breakup)) {
                        foreach ($breakup as $taxName => $taxData) {
                            if (isset($taxAmounts[$taxName])) {
                                // Handle both array structure (new format) and numeric value (old format)
                                if (is_array($taxData)) {
                                    $amount = ($taxData['amount'] ?? 0) * $itemBreakup->quantity;
                                } else {
                                    // Backward compatibility: if it's a number, use it directly
                                    $amount = (float)$taxData * $itemBreakup->quantity;
                                }

                                $taxAmounts[$taxName] += $amount;
                                $taxDetails[$taxName]['total_amount'] += $amount;
                                $taxDetails[$taxName]['items_count'] += $itemBreakup->quantity;

                                // Update percent if we have it from the breakup
                                if (is_array($taxData) && isset($taxData['percent'])) {
                                    $taxDetails[$taxName]['percent'] = $taxData['percent'];
                                }
                            }
                        }
                    }
                }
                $totalTaxAmount = array_sum($taxAmounts);
            } else {
                // Fallback: Use stored total_tax_amount and distribute proportionally
                $storedTotalTax = DB::table('orders')
                    ->where('orders.status', 'paid')
                    ->where('orders.branch_id', branch()->id)
                    ->whereDate('orders.date_time', $item->date)
                    ->sum('orders.total_tax_amount') ?? 0;

                $ordersCount = DB::table('orders')
                    ->where('orders.status', 'paid')
                    ->where('orders.branch_id', branch()->id)
                    ->whereDate('orders.date_time', $item->date)
                    ->where('orders.total_tax_amount', '>', 0)
                    ->count();

                if ($storedTotalTax > 0) {
                    // Group taxes by name and sum their percentages
                    $taxGroups = $taxes->groupBy('tax_name');
                    $totalTaxPercent = 0;
                    foreach ($taxGroups as $taxName => $taxGroup) {
                        $totalTaxPercent += $taxGroup->sum('tax_percent');
                    }

                    if ($totalTaxPercent > 0) {
                        foreach ($taxGroups as $taxName => $taxGroup) {
                            $taxPercent = $taxGroup->sum('tax_percent');
                            $proportionalAmount = ($storedTotalTax * $taxPercent) / $totalTaxPercent;
                            $taxAmounts[$taxName] = $proportionalAmount;
                            $taxDetails[$taxName]['total_amount'] = $proportionalAmount;
                            $taxDetails[$taxName]['items_count'] = $ordersCount;
                            $taxDetails[$taxName]['percent'] = $taxGroup->first()->tax_percent;
                        }
                    }
                }
                $totalTaxAmount = $storedTotalTax;
            }

            return [
                'date' => $item->date,
                'total_orders' => $item->total_orders,
                'total_amount' => $item->total_amount ?? 0,
                'discount_amount' => $item->discount_amount ?? 0,
                'tip_amount' => $item->tip_amount ?? 0,
                'delivery_fee' => $item->delivery_fee ?? 0,
                'cash_amount' => $item->cash_amount ?? 0,
                'card_amount' => $item->card_amount ?? 0,
                'upi_amount' => $item->upi_amount ?? 0,
                'razorpay_amount' => $item->razorpay_amount ?? 0,
                'stripe_amount' => $item->stripe_amount ?? 0,
                'flutterwave_amount' => $item->flutterwave_amount ?? 0,
                'charges' => $chargeAmounts,
                'taxes' => $taxAmounts,
                'tax_details' => $taxDetails,
                'total_tax_amount' => $totalTaxAmount,
            ];
        });

        // Aggregate all taxes across all dates
        $allTaxes = [];
        foreach ($groupedData as $item) {
            if (isset($item['tax_details']) && is_array($item['tax_details'])) {
                foreach ($item['tax_details'] as $taxName => $taxDetail) {
                    if (!isset($allTaxes[$taxName])) {
                        $allTaxes[$taxName] = [
                            'name' => $taxName,
                            'percent' => $taxDetail['percent'] ?? 0,
                            'total_amount' => 0,
                            'items_count' => 0
                        ];
                    }
                    $allTaxes[$taxName]['total_amount'] += $taxDetail['total_amount'] ?? 0;
                    $allTaxes[$taxName]['items_count'] += $taxDetail['items_count'] ?? 0;
                }
            } elseif (isset($item['taxes']) && is_array($item['taxes'])) {
                // Fallback for older tax structure
                foreach ($item['taxes'] as $taxName => $taxAmount) {
                    if (!isset($allTaxes[$taxName])) {
                        // Find tax percentage from the taxes collection
                        $taxPercent = $taxes->where('tax_name', $taxName)->first()->tax_percent ?? 0;
                        $allTaxes[$taxName] = [
                            'name' => $taxName,
                            'percent' => $taxPercent,
                            'total_amount' => 0,
                            'items_count' => 1
                        ];
                    }
                    $allTaxes[$taxName]['total_amount'] += $taxAmount;
                }
            }
        }

        $paymentGateway = PaymentGatewayCredential::select('stripe_status', 'razorpay_status', 'flutterwave_status')
            ->where('restaurant_id', restaurant()->id)
            ->first();

        return view('livewire.reports.sales-report', [
            'menuItems' => $groupedData,
            'charges' => $charges,
            'taxes' => $taxes,
            'paymentGateway' => $paymentGateway,
            'taxMode' => $taxMode,
            'allTaxes' => $allTaxes,
            'currencyId' => $this->currencyId,
            'waiters' => $this->waiters,
            'filterByWaiter' => $this->filterByWaiter,
        ]);
    }

}

