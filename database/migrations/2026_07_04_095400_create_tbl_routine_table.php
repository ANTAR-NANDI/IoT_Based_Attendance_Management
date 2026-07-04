<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tblRoutine', function (Blueprint $table) {

            $table->id('RoutineID');

            $table->date('RoutineDate');

            $table->unsignedBigInteger('TeacherID');

            $table->unsignedBigInteger('SubjectID');

            $table->unsignedBigInteger('BatchID');

            $table->unsignedBigInteger('RoomID');

            $table->unsignedBigInteger('DeviceID');

            $table->time('StartTime');

            $table->time('EndTime');

            $table->integer('GraceMinute')->default(0);
            $table->string('DayName', 20);      // Saturday, Sunday, Monday...
            $table->string('ClassType', 30)->nullable(); // Theory, Lab, Viva
            $table->text('Remarks')->nullable();
            $table->boolean('Status')->default(1);

            $table->timestamps();

            // Foreign Keys
            $table->foreign('TeacherID')
                ->references('TeacherID')
                ->on('tblTeacher');

            $table->foreign('SubjectID')
                ->references('SubjectID')
                ->on('tblSubject');

            $table->foreign('BatchID')
                ->references('BatchID')
                ->on('tblBatch');

            $table->foreign('RoomID')
                ->references('RoomID')
                ->on('tblRoom');

            $table->foreign('DeviceID')
                ->references('DeviceID')
                ->on('tblDevice');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tblRoutine');
    }
};
