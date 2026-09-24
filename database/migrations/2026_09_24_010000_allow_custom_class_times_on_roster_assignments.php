<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        DB::statement('ALTER TABLE tblRosterAssignment MODIFY RosterShiftID BIGINT UNSIGNED NULL');
    }

    public function down(): void
    {
        DB::statement('ALTER TABLE tblRosterAssignment MODIFY RosterShiftID BIGINT UNSIGNED NOT NULL');
    }
};
