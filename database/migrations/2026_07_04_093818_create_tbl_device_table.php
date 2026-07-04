<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tblDevice', function (Blueprint $table) {

            $table->id('DeviceID');

            $table->string('DeviceName', 100);

            $table->unsignedBigInteger('RoomID');

            $table->string('IPAddress', 50);

            $table->string('SerialNo', 100)->nullable();

            $table->boolean('Status')->default(1);

            $table->timestamps();

            $table->foreign('RoomID')
                ->references('RoomID')
                ->on('tblRoom')
                ->cascadeOnUpdate()
                ->noActionOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tblDevice');
    }
};
