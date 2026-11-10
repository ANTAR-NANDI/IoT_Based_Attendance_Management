<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tblHolidaySetting', function (Blueprint $table) {
            $table->id();
            $table->json('WeeklyHolidayDays');
            $table->timestamps();
        });

        DB::table('tblHolidaySetting')->insert([
            'WeeklyHolidayDays' => json_encode([5, 6]), // Friday and Saturday
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        Schema::table('tblHolidaySetup', function (Blueprint $table) {
            $table->index('holidaydate', 'idx_holiday_date');
        });
    }

    public function down(): void
    {
        Schema::table('tblHolidaySetup', function (Blueprint $table) {
            $table->dropIndex('idx_holiday_date');
        });

        Schema::dropIfExists('tblHolidaySetting');
    }
};
