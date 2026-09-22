<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tblRosterShift', function (Blueprint $table) {
            $table->id('RosterShiftID');
            $table->string('ShiftName', 100)->unique();
            $table->time('StartTime');
            $table->time('EndTime');
            $table->boolean('CrossesMidnight')->default(false);
            $table->unsignedSmallInteger('EntryEarlyMinutes')->default(15);
            $table->unsignedSmallInteger('EntryLateMinutes')->default(10);
            $table->unsignedSmallInteger('ExitEarlyMinutes')->default(10);
            $table->unsignedSmallInteger('ExitLateMinutes')->default(15);
            $table->unsignedSmallInteger('RequiredPeople')->default(1);
            $table->boolean('Status')->default(true);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tblRosterShift');
    }
};
