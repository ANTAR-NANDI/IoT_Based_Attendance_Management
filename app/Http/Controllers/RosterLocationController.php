<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class RosterLocationController extends Controller
{
    public function index()
    {
        $locations = DB::table('tblRosterLocation as l')
            ->leftJoin('tblDevice as d', 'l.DeviceID', '=', 'd.DeviceID')
            ->select('l.*', 'd.DeviceName', 'd.IPAddress', 'd.SerialNo', 'd.Status as DeviceStatus')
            ->orderBy('l.LocationName')
            ->paginate(20);
        return view('roster.locations.index', compact('locations'));
    }
    public function create() { return view('roster.locations.form', ['location' => null]); }
    public function store(Request $request)
    {
        $data = $this->validated($request);

        DB::transaction(function () use ($data) {
            $locationId = DB::table('tblRosterLocation')->insertGetId([
                'LocationName' => $data['LocationName'],
                'LocationType' => $data['LocationType'],
                'Description' => $data['Description'],
                'Status' => $data['Status'],
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            if ($deviceId = $this->saveDevice($data)) {
                DB::table('tblRosterLocation')->where('RosterLocationID', $locationId)->update(['DeviceID' => $deviceId]);
            }
        });

        return redirect()->route('roster.locations.index')->with('success', 'Room added. Its ZKT device mapping has been saved.');
    }

    public function edit(int $id)
    {
        $location = DB::table('tblRosterLocation as l')
            ->leftJoin('tblDevice as d', 'l.DeviceID', '=', 'd.DeviceID')
            ->select('l.*', 'd.DeviceName', 'd.IPAddress', 'd.SerialNo', 'd.Status as DeviceStatus')
            ->where('l.RosterLocationID', $id)
            ->firstOrFail();

        return view('roster.locations.form', compact('location'));
    }

    public function update(Request $request, int $id)
    {
        $location = DB::table('tblRosterLocation')->where('RosterLocationID', $id)->firstOrFail();
        $device = $location->DeviceID ? DB::table('tblDevice')->where('DeviceID', $location->DeviceID)->first() : null;
        $data = $this->validated($request, $id, $device?->DeviceID);

        DB::transaction(function () use ($data, $location, $device) {
            DB::table('tblRosterLocation')->where('RosterLocationID', $location->RosterLocationID)->update([
                'LocationName' => $data['LocationName'],
                'LocationType' => $data['LocationType'],
                'Description' => $data['Description'],
                'Status' => $data['Status'],
                'updated_at' => now(),
            ]);

            if ($deviceId = $this->saveDevice($data, $device?->DeviceID)) {
                DB::table('tblRosterLocation')->where('RosterLocationID', $location->RosterLocationID)->update(['DeviceID' => $deviceId]);
            }
        });

        return redirect()->route('roster.locations.index')->with('success', 'Room and ZKT device mapping updated.');
    }

    private function validated(Request $request, ?int $id = null, ?int $deviceId = null): array
    {
        $data = $request->validate([
            'LocationName' => ['required', 'max:120', Rule::unique('tblRosterLocation', 'LocationName')->ignore($id, 'RosterLocationID')],
            'LocationType' => ['nullable', 'max:50'],
            'Description' => ['nullable', 'max:255'],
            'Status' => ['required', 'boolean'],
            'DeviceName' => ['nullable', 'max:100'],
            'IPAddress' => ['nullable', 'ip'],
            'SerialNo' => ['nullable', 'max:100', Rule::unique('tblDevice', 'SerialNo')->ignore($deviceId, 'DeviceID')],
            'DeviceStatus' => ['nullable', 'boolean'],
        ]);

        $hasDeviceDetails = filled($data['DeviceName'] ?? null) || filled($data['IPAddress'] ?? null) || filled($data['SerialNo'] ?? null);
        if ($hasDeviceDetails && !filled($data['DeviceName'] ?? null)) {
            throw \Illuminate\Validation\ValidationException::withMessages(['DeviceName' => 'Enter the ZKT device name.']);
        }
        if ($hasDeviceDetails && !filled($data['IPAddress'] ?? null)) {
            throw \Illuminate\Validation\ValidationException::withMessages(['IPAddress' => 'Enter the ZKT device IP address.']);
        }

        return $data;
    }

    private function saveDevice(array $data, ?int $deviceId = null): ?int
    {
        if (!filled($data['DeviceName'] ?? null)) {
            return null;
        }

        $values = [
            'DeviceName' => $data['DeviceName'],
            'IPAddress' => $data['IPAddress'],
            'SerialNo' => $data['SerialNo'] ?: null,
            'Status' => $data['DeviceStatus'] ?? true,
            'updated_at' => now(),
        ];

        if ($deviceId) {
            DB::table('tblDevice')->where('DeviceID', $deviceId)->update($values);
            return $deviceId;
        }

        return DB::table('tblDevice')->insertGetId($values + [
            'RoomID' => null,
            'created_at' => now(),
        ]);
    }
}
