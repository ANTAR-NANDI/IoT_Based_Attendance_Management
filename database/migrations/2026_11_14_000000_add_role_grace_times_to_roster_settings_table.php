<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tblRosterSetting', function (Blueprint $table) {
            $table->unsignedSmallInteger('StudentGraceMinutes')->default(10)->after('EntryLateMinutes');
            $table->unsignedSmallInteger('TeacherGraceMinutes')->default(15)->after('StudentGraceMinutes');
        });
    }

    public function down(): void
    {
        Schema::table('tblRosterSetting', function (Blueprint $table) {
            $table->dropColumn(['StudentGraceMinutes', 'TeacherGraceMinutes']);
        });
    }
};
