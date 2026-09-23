<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration { public function up(): void { Schema::table('tblRosterPerson', fn (Blueprint $table) => $table->string('WorkMode', 10)->default('Normal')->after('RunsRoster')); } public function down(): void { Schema::table('tblRosterPerson', fn (Blueprint $table) => $table->dropColumn('WorkMode')); } };
