<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('tblDesignation')) {
            Schema::create('tblDesignation', function (Blueprint $table) {
                $table->id('DesignationID');
                $table->string('DesignationName', 150);
                $table->boolean('Status')->default(true);
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('tblDesignationOrder');
    }
};
