<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if (!Schema::hasTable('tblDepartment')) {
            Schema::create('tblDepartment', function (Blueprint $table) {
                $table->id('DepartmentID');
                $table->string('DepartmentCode', 20)->unique();
                $table->string('DepartmentName', 100);
                $table->boolean('Status')->default(true);
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('tblDepartment');
    }
};
