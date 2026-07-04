<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DeviceController extends Controller
{
    /**
     * Display Device List
     */
    public function index(Request $request)
    {
        $query = DB::table('tblDevice as d')
            ->join('tblRoom as r', 'd.RoomID', '=', 'r.RoomID')
            ->select(
                'd.*',
                'r.RoomNo'
            );

        if ($request->filled('search')) {

            $query->where(function ($q) use ($request) {

                $q->where('d.DeviceName', 'like', "%{$request->search}%")
                    ->orWhere('d.IPAddress', 'like', "%{$request->search}%")
                    ->orWhere('d.SerialNo', 'like', "%{$request->search}%")
                    ->orWhere('r.RoomNo', 'like', "%{$request->search}%");
            });
        }

        $devices = $query
            ->orderByDesc('DeviceID')
            ->paginate(20);

        return view('devices.index', compact('devices'));
    }

    /**
     * Show Create Form
     */
    public function create()
    {
        $rooms = DB::table('tblRoom')
            ->orderBy('RoomNo')
            ->get();

        return view('devices.create', compact('rooms'));
    }

    /**
     * Store Device
     */
    public function store(Request $request)
    {
        $request->validate([

            'DeviceName' => 'required|max:100',

            'RoomID' => 'required|exists:tblRoom,RoomID',

            'IPAddress' => 'required|ip',

            'SerialNo' => 'nullable|max:100',

            'Status' => 'required|boolean',

        ]);

        try {

            DB::table('tblDevice')->insert([

                'DeviceName' => $request->DeviceName,

                'RoomID' => $request->RoomID,

                'IPAddress' => $request->IPAddress,

                'SerialNo' => $request->SerialNo,

                'Status' => $request->Status,

                'created_at' => now(),

                'updated_at' => now(),

            ]);

            return redirect()
                ->route('devices.index')
                ->with('success', 'Device Added Successfully');
        } catch (Exception $e) {

            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    /**
     * Show Edit Form
     */
    public function edit($id)
    {
        $device = DB::table('tblDevice')
            ->where('DeviceID', $id)
            ->first();

        if (!$device) {
            abort(404);
        }

        $rooms = DB::table('tblRoom')
            ->orderBy('RoomNo')
            ->get();

        return view('devices.edit', compact(
            'device',
            'rooms'
        ));
    }

    /**
     * Update Device
     */
    public function update(Request $request, $id)
    {
        $request->validate([

            'DeviceName' => 'required|max:100',

            'RoomID' => 'required|exists:tblRoom,RoomID',

            'IPAddress' => 'required|ip',

            'SerialNo' => 'nullable|max:100',

            'Status' => 'required|boolean',

        ]);

        try {

            DB::table('tblDevice')
                ->where('DeviceID', $id)
                ->update([

                    'DeviceName' => $request->DeviceName,

                    'RoomID' => $request->RoomID,

                    'IPAddress' => $request->IPAddress,

                    'SerialNo' => $request->SerialNo,

                    'Status' => $request->Status,

                    'updated_at' => now(),

                ]);

            return redirect()
                ->route('devices.index')
                ->with('success', 'Device Updated Successfully');
        } catch (Exception $e) {

            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    /**
     * Delete Device
     */
    public function destroy($id)
    {
        try {

            DB::table('tblDevice')
                ->where('DeviceID', $id)
                ->delete();

            return redirect()
                ->route('devices.index')
                ->with('success', 'Device Deleted Successfully');
        } catch (Exception $e) {

            return redirect()
                ->route('devices.index')
                ->with('error', $e->getMessage());
        }
    }
}
