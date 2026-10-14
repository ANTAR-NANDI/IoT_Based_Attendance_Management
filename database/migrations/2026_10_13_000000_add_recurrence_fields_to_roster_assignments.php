<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tblRosterAssignment', function (Blueprint $table) {
            $table->uuid('RosterSeriesID')->nullable()->after('RosterAssignmentID');
            $table->date('SeriesStartDate')->nullable()->after('RosterDate');
            $table->date('SeriesEndDate')->nullable()->after('SeriesStartDate');
            $table->string('RepeatMode', 20)->default('Once')->after('SeriesEndDate');
            $table->json('Weekdays')->nullable()->after('RepeatMode');
            $table->index('RosterSeriesID');
        });
    }

    public function down(): void
    {
        Schema::table('tblRosterAssignment', function (Blueprint $table) {
            $table->dropIndex(['RosterSeriesID']);
            $table->dropColumn(['RosterSeriesID', 'SeriesStartDate', 'SeriesEndDate', 'RepeatMode', 'Weekdays']);
        });
    }
};
