<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tblRoutine', function (Blueprint $table) {
            $table->date('SemesterStartDate')->nullable()->after('RoutineDate');
            $table->date('SemesterEndDate')->nullable()->after('SemesterStartDate');
            $table->index(['SemesterStartDate', 'SemesterEndDate'], 'routine_semester_dates_index');
        });

        // Keep existing one-day routines valid after the upgrade.
        DB::table('tblRoutine')->whereNull('SemesterStartDate')->update([
            'SemesterStartDate' => DB::raw('RoutineDate'),
            'SemesterEndDate' => DB::raw('RoutineDate'),
        ]);
    }

    public function down(): void
    {
        Schema::table('tblRoutine', function (Blueprint $table) {
            $table->dropIndex('routine_semester_dates_index');
            $table->dropColumn(['SemesterStartDate', 'SemesterEndDate']);
        });
    }
};
