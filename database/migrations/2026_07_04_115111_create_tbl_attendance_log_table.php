<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tblAttendanceLog', function (Blueprint $table) {

            $table->bigIncrements('AttendanceLogID');

            $table->unsignedBigInteger('EmployeeID');

            $table->unsignedBigInteger('DeviceID')->nullable();

            $table->string('DeviceSerialNo', 100)->nullable();

            $table->dateTime('PunchTime');

            $table->tinyInteger('PunchState')->nullable();

            $table->integer('VerifyMode')->nullable();

            $table->string('WorkCode', 30)->nullable();

            $table->decimal('Temperature', 5, 2)->nullable();

            $table->boolean('Mask')->nullable();

            $table->string('UploadSource', 30)->default('ZKTeco');

            $table->dateTime('SyncTime')->useCurrent();

            $table->boolean('IsProcessed')->default(false);

            $table->timestamps();

            $table->unique([
                'EmployeeID',
                'PunchTime',
                'DeviceSerialNo'
            ], 'UQ_AttendanceLog');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tblAttendanceLog');
    }
};
