<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tblRosterPerson', function (Blueprint $table) {
            $table->string('ShortName', 30)->nullable()->unique()->after('PersonName');
        });
    }

    public function down(): void
    {
        Schema::table('tblRosterPerson', function (Blueprint $table) {
            $table->dropUnique(['ShortName']);
            $table->dropColumn('ShortName');
        });
    }
};
