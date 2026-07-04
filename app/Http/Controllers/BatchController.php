<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BatchController extends Controller
{
    /**
     * Display Batch List
     */
    public function index(Request $request)
    {
        $query = DB::table('tblBatch');

        if ($request->filled('search')) {

            $query->where(function ($q) use ($request) {

                $q->where('BatchName', 'like', "%{$request->search}%")
                    ->orWhere('Session', 'like', "%{$request->search}%")
                    ->orWhere('Semester', 'like', "%{$request->search}%");
            });
        }

        $batches = $query
            ->orderByDesc('BatchID')
            ->paginate(20);

        return view('batches.index', compact('batches'));
    }

    /**
     * Show Create Form
     */
    public function create()
    {
        return view('batches.create');
    }

    /**
     * Store Batch
     */
    public function store(Request $request)
    {
        $request->validate([

            'BatchName' => 'required|max:100',

            'Session' => 'required|max:30',

            'Semester' => 'required|integer|min:1|max:12',

        ]);

        try {

            DB::table('tblBatch')->insert([

                'BatchName' => $request->BatchName,

                'Session' => $request->Session,

                'Semester' => $request->Semester,

                'Status' => $request->Status ?? 1,

                'created_at' => now(),

                'updated_at' => now(),

            ]);

            return redirect()
                ->route('batches.index')
                ->with('success', 'Batch Added Successfully');
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
        $batch = DB::table('tblBatch')
            ->where('BatchID', $id)
            ->first();

        if (!$batch) {

            abort(404);
        }

        return view('batches.edit', compact('batch'));
    }

    /**
     * Update Batch
     */
    public function update(Request $request, $id)
    {
        $request->validate([

            'BatchName' => 'required|max:100',

            'Session' => 'required|max:30',

            'Semester' => 'required|integer|min:1|max:12',

        ]);

        try {

            DB::table('tblBatch')
                ->where('BatchID', $id)
                ->update([

                    'BatchName' => $request->BatchName,

                    'Session' => $request->Session,

                    'Semester' => $request->Semester,

                    'Status' => $request->Status,

                    'updated_at' => now(),

                ]);

            return redirect()
                ->route('batches.index')
                ->with('success', 'Batch Updated Successfully');
        } catch (Exception $e) {

            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    /**
     * Delete Batch
     */
    public function destroy($id)
    {
        try {

            DB::table('tblBatch')
                ->where('BatchID', $id)
                ->delete();

            return redirect()
                ->route('batches.index')
                ->with('success', 'Batch Deleted Successfully');
        } catch (Exception $e) {

            return redirect()
                ->route('batches.index')
                ->with('error', $e->getMessage());
        }
    }
}
