<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('role', 20)->default('admin')->after('password');
            $table->unsignedBigInteger('RosterPersonID')->nullable()->unique()->after('role');
            $table->foreign('RosterPersonID')->references('RosterPersonID')->on('tblRosterPerson')->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropForeign(['RosterPersonID']);
            $table->dropUnique(['RosterPersonID']);
            $table->dropColumn(['role', 'RosterPersonID']);
        });
    }
};
