<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tblAttendanceSetting', function (Blueprint $table) {
            $table->tinyInteger('id')->primary();
            $table->unsignedSmallInteger('EntryEarlyMinutes')->default(15);
            $table->unsignedSmallInteger('EntryLateMinutes')->default(10);
            $table->unsignedSmallInteger('ExitEarlyMinutes')->default(10);
            $table->unsignedSmallInteger('ExitLateMinutes')->default(15);
            $table->timestamps();
        });

        DB::table('tblAttendanceSetting')->insert([
            'id' => 1,
            'EntryEarlyMinutes' => 15,
            'EntryLateMinutes' => 10,
            'ExitEarlyMinutes' => 10,
            'ExitLateMinutes' => 15,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }

    public function down(): void
    {
        Schema::dropIfExists('tblAttendanceSetting');
    }
};
