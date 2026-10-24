<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Allow a course to be entered once per section, such as Sec A and Sec B.
     */
    public function up(): void
    {
        Schema::table('tblSubject', function (Blueprint $table) {
            $table->dropUnique(['Code']);
        });
    }

    public function down(): void
    {
        Schema::table('tblSubject', function (Blueprint $table) {
            $table->unique('Code');
        });
    }
};
