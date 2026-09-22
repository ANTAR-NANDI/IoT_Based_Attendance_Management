<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tblRosterLocation', function (Blueprint $table) {
            $table->id('RosterLocationID');
            $table->string('LocationName', 120)->unique();
            $table->string('LocationType', 50)->nullable();
            $table->string('Description', 255)->nullable();
            $table->boolean('Status')->default(true);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tblRosterLocation');
    }
};
