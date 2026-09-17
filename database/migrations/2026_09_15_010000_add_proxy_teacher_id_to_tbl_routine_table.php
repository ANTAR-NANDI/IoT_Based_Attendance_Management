<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tblRoutine', function (Blueprint $table) {
            $table->unsignedBigInteger('ProxyTeacherID')->nullable()->after('TeacherID');
            $table->foreign('ProxyTeacherID')->references('TeacherID')->on('tblTeacher');
        });
    }

    public function down(): void
    {
        Schema::table('tblRoutine', function (Blueprint $table) {
            $table->dropForeign(['ProxyTeacherID']);
            $table->dropColumn('ProxyTeacherID');
        });
    }
};
