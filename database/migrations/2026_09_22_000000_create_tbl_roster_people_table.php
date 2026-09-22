<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tblRosterPerson', function (Blueprint $table) {
            $table->id('RosterPersonID');
            $table->unsignedBigInteger('SourceTeacherID')->nullable()->unique();
            $table->string('EmployeeCode', 50)->nullable()->unique();
            $table->string('PersonName', 150);
            $table->string('RoleName', 50); // Teacher, Security, Technician, Electrician, Other
            $table->string('DepartmentName', 100)->nullable();
            $table->string('ZKUserID', 50)->nullable()->unique();
            $table->boolean('Status')->default(true);
            $table->timestamps();
        });

        // Existing teachers become roster people. This copies no ZKT records.
        if (Schema::hasTable('tblTeacher')) {
            DB::table('tblTeacher')->orderBy('TeacherID')->get()->each(function ($teacher) {
                DB::table('tblRosterPerson')->updateOrInsert(
                    ['SourceTeacherID' => $teacher->TeacherID],
                    [
                        'EmployeeCode' => $teacher->EmployeeID ?: null,
                        'PersonName' => $teacher->TeacherName,
                        'RoleName' => 'Teacher',
                        'ZKUserID' => $teacher->ZKUserID ?: null,
                        'Status' => (bool) ($teacher->Status ?? true),
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]
                );
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('tblRosterPerson');
    }
};
