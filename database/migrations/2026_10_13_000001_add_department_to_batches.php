<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tblBatch', function (Blueprint $table) {
            $table->unsignedBigInteger('DepartmentID')->nullable()->after('BatchID');
            $table->foreign('DepartmentID')->references('DepartmentID')->on('tblDepartment');
        });
    }

    public function down(): void
    {
        Schema::table('tblBatch', function (Blueprint $table) {
            $table->dropForeign(['DepartmentID']);
            $table->dropColumn('DepartmentID');
        });
    }
};
