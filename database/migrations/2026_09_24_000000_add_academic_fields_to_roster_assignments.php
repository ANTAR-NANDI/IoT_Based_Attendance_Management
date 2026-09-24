<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tblRosterAssignment', function (Blueprint $table) {
            // Only Class Duty uses these optional academic references.
            $table->unsignedBigInteger('DepartmentID')->nullable()->after('AssignmentType');
            $table->unsignedBigInteger('BatchID')->nullable()->after('DepartmentID');
            $table->unsignedBigInteger('SubjectID')->nullable()->after('BatchID');
            $table->foreign('DepartmentID')->references('DepartmentID')->on('tblDepartment');
            $table->foreign('BatchID')->references('BatchID')->on('tblBatch');
            $table->foreign('SubjectID')->references('SubjectID')->on('tblSubject');
            $table->index(['RosterDate', 'DepartmentID']);
        });
    }

    public function down(): void
    {
        Schema::table('tblRosterAssignment', function (Blueprint $table) {
            $table->dropForeign(['DepartmentID']);
            $table->dropForeign(['BatchID']);
            $table->dropForeign(['SubjectID']);
            $table->dropIndex(['RosterDate', 'DepartmentID']);
            $table->dropColumn(['DepartmentID', 'BatchID', 'SubjectID']);
        });
    }
};
