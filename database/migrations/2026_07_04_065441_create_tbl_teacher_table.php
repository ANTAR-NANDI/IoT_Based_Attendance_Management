<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tblTeacher', function (Blueprint $table) {

            $table->id('TeacherID');

            $table->string('EmployeeID');
            $table->string('TeacherName', 100);

            $table->unsignedBigInteger('DepartmentID');
            $table->unsignedBigInteger('DesignationID');

            $table->string('Mobile', 20)->nullable();
            $table->string('Email', 100)->nullable();

            $table->integer('ZKUserID')->nullable();

            $table->timestamps();

            // Foreign Keys

            $table->foreign('DepartmentID')
                ->references('DepartmentID')
                ->on('tblDepartment')
                ->cascadeOnUpdate();

            $table->foreign('DesignationID')
                ->references('DesignationID')
                ->on('tblDesignation')
                ->cascadeOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tblTeacher');
    }
};
