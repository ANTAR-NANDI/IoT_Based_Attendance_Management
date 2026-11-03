<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        $indexes = collect(DB::select("SHOW INDEX FROM `tblRosterPerson` WHERE Column_name = 'ShortName'"));
        $uniqueIndex = $indexes->first(fn ($index) => (int) $index->Non_unique === 0);
        if ($uniqueIndex) DB::statement('ALTER TABLE `tblRosterPerson` DROP INDEX `'.$uniqueIndex->Key_name.'`');

        $hasIndex = $indexes->contains(fn ($index) => (int) $index->Non_unique === 1);
        if (!$hasIndex) Schema::table('tblRosterPerson', fn (Blueprint $table) => $table->index('ShortName'));
    }

    public function down(): void
    {
        Schema::table('tblRosterPerson', function (Blueprint $table) {
            $table->dropIndex(['ShortName']);
            $table->unique('ShortName');
        });
    }
};
