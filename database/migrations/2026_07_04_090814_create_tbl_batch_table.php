<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tblBatch', function (Blueprint $table) {

            $table->id('BatchID');

            $table->string('BatchName', 100);

            $table->string('Session', 30);

            $table->unsignedTinyInteger('Semester');

            $table->boolean('Status')->default(1);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tblBatch');
    }
};
