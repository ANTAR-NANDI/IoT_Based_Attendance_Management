<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RoomController extends Controller
{
    /**
     * Display Room List
     */
    public function index(Request $request)
    {
        $query = DB::table('tblRoom');

        if ($request->filled('search')) {

            $query->where(function ($q) use ($request) {

                $q->where('RoomNo', 'like', "%{$request->search}%")
                    ->orWhere('Floor', 'like', "%{$request->search}%");
            });
        }

        $rooms = $query
            ->orderByDesc('RoomID')
            ->paginate(20);

        return view('rooms.index', compact('rooms'));
    }

    /**
     * Show Create Form
     */
    public function create()
    {
        return view('rooms.create');
    }

    /**
     * Store Room
     */
    public function store(Request $request)
    {
        $request->validate([

            'RoomNo' => 'required|max:30|unique:tblRoom,RoomNo',

            'Floor' => 'required|max:30',

        ]);

        try {

            DB::table('tblRoom')->insert([

                'RoomNo' => $request->RoomNo,

                'Floor' => $request->Floor,

                'created_at' => now(),

                'updated_at' => now(),

            ]);

            return redirect()
                ->route('rooms.index')
                ->with('success', 'Room Added Successfully');
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
        $room = DB::table('tblRoom')
            ->where('RoomID', $id)
            ->first();

        if (!$room) {

            abort(404);
        }

        return view('rooms.edit', compact('room'));
    }

    /**
     * Update Room
     */
    public function update(Request $request, $id)
    {
        $request->validate([

            'RoomNo' => 'required|max:30|unique:tblRoom,RoomNo,' . $id . ',RoomID',

            'Floor' => 'required|max:30',

        ]);

        try {

            DB::table('tblRoom')
                ->where('RoomID', $id)
                ->update([

                    'RoomNo' => $request->RoomNo,

                    'Floor' => $request->Floor,

                    'updated_at' => now(),

                ]);

            return redirect()
                ->route('rooms.index')
                ->with('success', 'Room Updated Successfully');
        } catch (Exception $e) {

            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    /**
     * Delete Room
     */
    public function destroy($id)
    {
        try {

            DB::table('tblRoom')
                ->where('RoomID', $id)
                ->delete();

            return redirect()
                ->route('rooms.index')
                ->with('success', 'Room Deleted Successfully');
        } catch (Exception $e) {

            return redirect()
                ->route('rooms.index')
                ->with('error', $e->getMessage());
        }
    }
}
