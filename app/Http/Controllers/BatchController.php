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
        $query = DB::table('tblBatch as b')
            ->leftJoin('tblDepartment as d', 'b.DepartmentID', '=', 'd.DepartmentID')
            ->select('b.*', 'd.DepartmentName');

        if ($request->filled('search')) {

            $query->where(function ($q) use ($request) {

                $q->where('b.BatchName', 'like', "%{$request->search}%")
                    ->orWhere('b.Session', 'like', "%{$request->search}%")
                    ->orWhere('b.Semester', 'like', "%{$request->search}%")
                    ->orWhere('d.DepartmentName', 'like', "%{$request->search}%");
            });
        }

        $batches = $query
            ->orderByDesc('b.BatchID')
            ->paginate(20);

        return view('batches.index', compact('batches'));
    }

    /**
     * Show Create Form
     */
    public function create()
    {
        $departments = DB::table('tblDepartment')->orderBy('DepartmentName')->get();
        return view('batches.create', compact('departments'));
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
            'DepartmentID' => 'required|exists:tblDepartment,DepartmentID',

        ]);

        try {

            DB::table('tblBatch')->insert([

                'BatchName' => $request->BatchName,

                'DepartmentID' => $request->DepartmentID,

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

        $departments = DB::table('tblDepartment')->orderBy('DepartmentName')->get();
        return view('batches.edit', compact('batch', 'departments'));
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
            'DepartmentID' => 'required|exists:tblDepartment,DepartmentID',

        ]);

        try {

            DB::table('tblBatch')
                ->where('BatchID', $id)
                ->update([

                    'BatchName' => $request->BatchName,

                    'DepartmentID' => $request->DepartmentID,

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
