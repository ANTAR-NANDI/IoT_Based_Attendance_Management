<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tblRosterAssignment', function (Blueprint $table) {
            $table->id('RosterAssignmentID');
            $table->date('RosterDate');
            $table->unsignedBigInteger('RosterPersonID');
            $table->unsignedBigInteger('ProxyPersonID')->nullable();
            $table->unsignedBigInteger('RosterShiftID');
            $table->unsignedBigInteger('RosterLocationID')->nullable();
            $table->unsignedBigInteger('DeviceID')->nullable();
            $table->string('AssignmentType', 30)->default('General Duty');
            // Times are copied from the shift template to preserve historical rosters.
            $table->time('StartTime');
            $table->time('EndTime');
            $table->boolean('CrossesMidnight')->default(false);
            $table->unsignedSmallInteger('EntryEarlyMinutes')->default(15);
            $table->unsignedSmallInteger('EntryLateMinutes')->default(10);
            $table->unsignedSmallInteger('ExitEarlyMinutes')->default(10);
            $table->unsignedSmallInteger('ExitLateMinutes')->default(15);
            $table->string('Status', 20)->default('Active');
            $table->string('Remarks', 255)->nullable();
            $table->timestamps();

            $table->foreign('RosterPersonID')->references('RosterPersonID')->on('tblRosterPerson');
            $table->foreign('ProxyPersonID')->references('RosterPersonID')->on('tblRosterPerson');
            $table->foreign('RosterShiftID')->references('RosterShiftID')->on('tblRosterShift');
            $table->foreign('RosterLocationID')->references('RosterLocationID')->on('tblRosterLocation');
            $table->foreign('DeviceID')->references('DeviceID')->on('tblDevice');
            $table->index(['RosterDate', 'RosterPersonID']);
            $table->index(['RosterDate', 'DeviceID']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tblRosterAssignment');
    }
};
