<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class SyncZktAttendance extends Command
{
    protected $signature = 'attendance:sync-zkt {--from-id= : Import source records with this ID or later}';

    protected $description = 'Copy new ZKT iclock_transaction punches into tblAttendanceLog without changing ZKT data';

    public function handle(): int
    {
        $imported = 0;
        $skipped = 0;
        $backfilledDeviceMappings = 0;
        $unmatchedSerials = [];

        $deviceIdsBySerial = DB::table('tblDevice')
            ->whereNotNull('SerialNo')
            ->pluck('DeviceID', 'SerialNo')
            ->mapWithKeys(fn ($id, $serial) => [trim((string) $serial) => $id]);

        // A device may be added or corrected after its punches were imported.
        // Repair only our copied rows; the ZKT source tables are never written to.
        $deviceIdsBySerial->each(function ($deviceId, $serial) use (&$backfilledDeviceMappings) {
            $backfilledDeviceMappings += DB::table('tblAttendanceLog')
                ->whereNull('DeviceID')
                ->where('DeviceSerialNo', $serial)
                ->update(['DeviceID' => $deviceId, 'updated_at' => now()]);
        });

        $transactions = DB::table('iclock_transaction as transaction')
            ->leftJoin('tblAttendanceLog as attendance', 'attendance.ZKTTransactionID', '=', 'transaction.id')
            ->whereNull('attendance.AttendanceLogID')
            ->select('transaction.*')
            ->orderBy('transaction.id');

        if ($this->option('from-id') !== null) {
            $transactions->where('transaction.id', '>=', (int) $this->option('from-id'));
        }

        $transactions->chunkById(250, function ($rows) use (&$imported, &$skipped, &$unmatchedSerials, $deviceIdsBySerial) {
            foreach ($rows as $transaction) {
                $employeeId = trim((string) $transaction->emp_code);

                // tblAttendanceLog currently uses an unsigned numeric employee ID.
                if (!ctype_digit($employeeId)) {
                    $skipped++;
                    $this->warn("Skipped ZKT transaction {$transaction->id}: emp_code '{$employeeId}' is not numeric.");
                    continue;
                }

                $serial = trim((string) ($transaction->terminal_sn ?? ''));
                $deviceId = $serial !== '' ? $deviceIdsBySerial->get($serial) : null;

                if ($serial !== '' && $deviceId === null) {
                    $unmatchedSerials[$serial] = true;
                }

                DB::table('tblAttendanceLog')->updateOrInsert(
                    ['ZKTTransactionID' => $transaction->id],
                    [
                        'EmployeeID' => (int) $employeeId,
                        'DeviceID' => $deviceId,
                        'DeviceSerialNo' => $serial ?: null,
                        'PunchTime' => $transaction->punch_time,
                        'PunchState' => is_numeric($transaction->punch_state) ? (int) $transaction->punch_state : null,
                        'VerifyMode' => $transaction->verify_type,
                        'WorkCode' => $transaction->work_code,
                        'Temperature' => $transaction->temperature,
                        // ZKT uses 255 for an unknown mask state; retain that as NULL.
                        'Mask' => in_array((int) $transaction->is_mask, [0, 1], true) ? (int) $transaction->is_mask : null,
                        'UploadSource' => 'ZKTeco',
                        'SyncTime' => now(),
                        'IsProcessed' => false,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]
                );

                $imported++;
            }
        }, 'transaction.id', 'id');

        $this->info("ZKT sync complete: {$imported} imported, {$skipped} skipped, {$backfilledDeviceMappings} device mappings repaired.");

        foreach (array_keys($unmatchedSerials) as $serial) {
            $this->warn("No tblDevice matches ZKT terminal serial {$serial}; its punches were imported with DeviceID NULL.");
        }

        return self::SUCCESS;
    }
}
