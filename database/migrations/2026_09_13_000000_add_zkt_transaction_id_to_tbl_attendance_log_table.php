<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /** Store the immutable ZKT source row ID so each punch is imported once. */
    public function up(): void
    {
        Schema::table('tblAttendanceLog', function (Blueprint $table) {
            $table->unsignedBigInteger('ZKTTransactionID')
                ->nullable()
                ->unique('UQ_AttendanceLog_ZKTTransaction')
                ->after('AttendanceLogID');
        });
    }

    public function down(): void
    {
        Schema::table('tblAttendanceLog', function (Blueprint $table) {
            $table->dropUnique('UQ_AttendanceLog_ZKTTransaction');
            $table->dropColumn('ZKTTransactionID');
        });
    }
};
