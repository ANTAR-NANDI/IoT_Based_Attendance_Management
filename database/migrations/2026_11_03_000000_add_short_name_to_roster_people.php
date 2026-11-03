<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('tblRosterPerson', function (Blueprint $table) {
            $table->string('ShortName', 30)->nullable()->index()->after('PersonName');
        });
    }

    public function down(): void
    {
        Schema::table('tblRosterPerson', function (Blueprint $table) {
            $table->dropIndex(['ShortName']);
            $table->dropColumn('ShortName');
        });
    }
};
