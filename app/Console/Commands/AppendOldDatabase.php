<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class AppendOldDatabase extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'db:append-old';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Append data from old DB into new DB tables, handling extra columns automatically';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $oldConnection = DB::connection('mysql_old');
        $newConnection = DB::connection('mysql_new');
        $oldDbName = $oldConnection->getDatabaseName();

        // Disable foreign key checks temporarily to prevent FK constraint errors
        $newConnection->statement('SET FOREIGN_KEY_CHECKS=0');

        // Get all tables from old DB
        $tables = $oldConnection->select('SHOW TABLES');
        $tableKey = 'Tables_in_' . $oldDbName;

        foreach ($tables as $tableObj) {
            $table = $tableObj->$tableKey;

            // Skip migrations table
            if ($table === 'migrations') {
                $this->warn("⏩ Skipping migrations table");
                continue;
            }

            // Check if table exists in new DB
            if (!Schema::connection('mysql_new')->hasTable($table)) {
                $this->warn("❌ Skipping table '$table' (not found in new DB)");
                continue;
            }

            $this->info("➡️ Appending table: $table");

            $oldColumns = Schema::connection('mysql_old')->getColumnListing($table);
            $newColumns = Schema::connection('mysql_new')->getColumnListing($table);

            $commonColumns = array_intersect($oldColumns, $newColumns);
            $missingColumns = array_diff($newColumns, $oldColumns);

            // Detect primary key dynamically
            $primaryKey = $this->getPrimaryKey($table, 'mysql_new');

            // Append data in chunks
            $oldConnection->table($table)->orderBy($primaryKey)->chunk(100, function ($rows) use (
                $table, $commonColumns, $missingColumns, $newConnection, $primaryKey
            ) {
                $insertBatch = [];

                foreach ($rows as $row) {
                    $insertData = [];

                    // Copy matching columns
                    foreach ($commonColumns as $col) {
                        $insertData[$col] = $row->$col ?? null;
                    }

                    // Fill missing columns with NULL
                    foreach ($missingColumns as $col) {
                        $insertData[$col] = null;
                    }

                    // Skip if primary key already exists in new DB
                    if ($newConnection->table($table)->where($primaryKey, $row->$primaryKey)->exists()) {
                        continue;
                    }

                    $insertBatch[] = $insertData;
                }

                // Insert into new DB
                if (!empty($insertBatch)) {
                    try {
                        $newConnection->table($table)->insert($insertBatch);
                    } catch (\Exception $e) {
                        $this->error("⚠️ Failed inserting batch into $table: " . $e->getMessage());
                    }
                }
            });
        }

        // Re-enable foreign key checks
        $newConnection->statement('SET FOREIGN_KEY_CHECKS=1');

        $this->info('✅ Append completed for all tables.');
    }


    /**
     * Get the primary key for a table
     */
    private function getPrimaryKey($table, $connectionName)
    {
        $result = DB::connection($connectionName)->select("SHOW KEYS FROM `$table` WHERE Key_name = 'PRIMARY'");
        return $result[0]->Column_name ?? 'id';
    }
}
