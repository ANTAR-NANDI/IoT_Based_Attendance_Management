<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tblSubject', function (Blueprint $table) {

            $table->id('SubjectID');

            $table->string('Code', 20)->unique();

            $table->string('SubjectName', 150);

            $table->unsignedBigInteger('DepartmentID');

            $table->timestamps();

            $table->foreign('DepartmentID')
                ->references('DepartmentID')
                ->on('tblDepartment');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tblSubject');
    }
};
