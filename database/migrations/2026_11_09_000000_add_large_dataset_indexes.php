<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * These indexes support existing attendance reconciliation and roster-report
     * queries. They do not alter columns, constraints, or application data.
     */
    public function up(): void
    {
        Schema::table('tblAttendanceLog', function (Blueprint $table) {
            $table->index(['DeviceID', 'PunchTime'], 'idx_attendance_device_punch');
            $table->index(['DeviceID', 'DeviceSerialNo', 'AttendanceLogID'], 'idx_attendance_unmapped_device');
        });

        Schema::table('tblRosterAssignment', function (Blueprint $table) {
            $table->index(['Status', 'RosterDate', 'StartTime'], 'idx_roster_status_date_start');
            $table->index(['RosterPersonID', 'Status', 'RosterDate', 'StartTime'], 'idx_roster_person_status_date');
            $table->index(['RosterLocationID', 'Status', 'RosterDate', 'StartTime'], 'idx_roster_location_status_date');
        });
    }

    public function down(): void
    {
        Schema::table('tblRosterAssignment', function (Blueprint $table) {
            $table->dropIndex('idx_roster_status_date_start');
            $table->dropIndex('idx_roster_person_status_date');
            $table->dropIndex('idx_roster_location_status_date');
        });

        Schema::table('tblAttendanceLog', function (Blueprint $table) {
            $table->dropIndex('idx_attendance_device_punch');
            $table->dropIndex('idx_attendance_unmapped_device');
        });
    }
};
