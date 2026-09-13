<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Schedule;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

// Run with `php artisan schedule:work` locally, or with a one-minute cron job on cPanel.
Schedule::command('attendance:sync-zkt')->everyMinute()->withoutOverlapping();
