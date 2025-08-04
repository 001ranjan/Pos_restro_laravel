<?php

namespace App\Livewire\Menu;

use Livewire\Component;
use Livewire\Attributes\On;
use Livewire\WithPagination;
use App\Models\ItemCategory;
use Livewire\WithoutUrlPagination;
use Jantinnerezo\LivewireAlert\LivewireAlert;

class ItemCategories extends Component
{
    use WithPagination, WithoutUrlPagination, LivewireAlert;

    public $showMenuCategoryModal = false;
    public $showEditItemCategory = false;
    public $itemCategory;
    public $confirmDeleteCategory = false;
    public $search;

    public function showEditCategory($id)
    {
        $this->showEditItemCategory = true;
        $this->itemCategory = ItemCategory::findOrFail($id);
    }

    public function showDeleteCategory($id)
    {
        $this->confirmDeleteCategory = true;
        $this->itemCategory = ItemCategory::findOrFail($id);
    }

    public function deleteItemCategory($id)
    {
        ItemCategory::destroy($id);
        $this->confirmDeleteCategory = false;

        $this->itemCategory = null;

        $this->alert('success', __('messages.menuItemCategoryDeleted'), [
            'toast' => true,
            'position' => 'top-end',
            'showCancelButton' => false,
            'cancelButtonText' => __('app.close')
        ]);
    }

    #[On('hideCategoryModal')]
    public function hideCategoryModal()
    {
        $this->showMenuCategoryModal = false;
        $this->showEditItemCategory = false;
    }

    public function render()
    {
        return view('livewire.menu.item-categories', [
            'categories' => ItemCategory::withCount('items')->search('category_name', $this->search)->paginate(15)
        ]);
    }

}
