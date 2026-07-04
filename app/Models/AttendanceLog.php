<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AttendanceLog extends Model
{
    protected $table = 'tblAttendanceLog';

    protected $primaryKey = 'AttendanceLogID';

    public $timestamps = true;

    protected $fillable = [
        'EmployeeID',
        'DeviceID',
        'DeviceSerialNo',
        'PunchTime',
        'PunchState',
        'VerifyMode',
        'WorkCode',
        'Temperature',
        'Mask',
        'UploadSource',
        'SyncTime',
        'IsProcessed',
    ];
}
