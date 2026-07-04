<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tblRoom', function (Blueprint $table) {

            $table->id('RoomID');

            $table->string('RoomNo', 30)->unique();

            $table->string('Floor', 30);

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tblRoom');
    }
};
