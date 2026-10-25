<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tblRosterLocation', function (Blueprint $table) {
            $table->unsignedBigInteger('DeviceID')->nullable()->unique()->after('Description');
            $table->foreign('DeviceID')->references('DeviceID')->on('tblDevice')->nullOnDelete();
        });
    }

    public function down(): void
    {
        Schema::table('tblRosterLocation', function (Blueprint $table) {
            $table->dropForeign(['DeviceID']);
            $table->dropUnique(['DeviceID']);
            $table->dropColumn('DeviceID');
        });
    }
};
