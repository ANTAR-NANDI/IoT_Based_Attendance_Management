<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Preserve existing Admin accounts while giving the original system
        // administrator a complete Super Admin role after this upgrade.
        $administrator = DB::table('users')->where('role', 'admin')->orderBy('id')->first();
        if ($administrator) {
            DB::table('users')->where('id', $administrator->id)->update(['role' => 'superadmin', 'updated_at' => now()]);
        }
    }

    public function down(): void
    {
        DB::table('users')->where('role', 'superadmin')->update(['role' => 'admin', 'updated_at' => now()]);
    }
};
