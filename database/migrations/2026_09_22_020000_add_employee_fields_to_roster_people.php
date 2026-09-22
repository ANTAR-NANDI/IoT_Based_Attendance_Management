<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration {
    public function up(): void { Schema::table('tblRosterPerson', function (Blueprint $table) { $table->unsignedBigInteger('DepartmentID')->nullable()->after('DepartmentName'); $table->unsignedBigInteger('DesignationID')->nullable()->after('DepartmentID'); $table->boolean('RunsRoster')->default(true)->after('DesignationID'); }); }
    public function down(): void { Schema::table('tblRosterPerson', function (Blueprint $table) { $table->dropColumn(['DepartmentID','DesignationID','RunsRoster']); }); }
};
