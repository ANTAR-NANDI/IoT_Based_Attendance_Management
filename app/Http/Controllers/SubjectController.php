<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SubjectController extends Controller
{
    public function index(Request $request)
    {
        $query = DB::table('tblSubject as s')
            ->join('tblDepartment as d', 's.DepartmentID', '=', 'd.DepartmentID')
            ->select(
                's.*',
                'd.DepartmentName'
            );

        if ($request->filled('search')) {

            $query->where(function ($q) use ($request) {

                $q->where('s.Code', 'like', "%{$request->search}%")
                    ->orWhere('s.SubjectName', 'like', "%{$request->search}%")
                    ->orWhere('d.DepartmentName', 'like', "%{$request->search}%");
            });
        }

        $subjects = $query
            ->orderByDesc('SubjectID')
            ->paginate(20);

        return view('subjects.index', compact('subjects'));
    }

    /**
     * Create Form
     */
    public function create()
    {
        $departments = DB::table('tblDepartment')
            ->orderBy('DepartmentName')
            ->get();

        return view('subjects.create', compact('departments'));
    }

    /**
     * Store
     */
    public function store(Request $request)
    {
        $request->validate([
            'Code' => 'required|max:20|unique:tblSubject,Code',
            'SubjectName' => 'required|max:150',
            'DepartmentID' => 'required'
        ]);

        try {

            DB::table('tblSubject')->insert([

                'Code' => $request->Code,
                'SubjectName' => $request->SubjectName,
                'DepartmentID' => $request->DepartmentID,
                'created_at' => now(),
                'updated_at' => now()

            ]);

            return redirect()
                ->route('subjects.index')
                ->with('success', 'Subject Added Successfully');
        } catch (Exception $e) {

            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    /**
     * Edit
     */
    public function edit($id)
    {
        $subject = DB::table('tblSubject')
            ->where('SubjectID', $id)
            ->first();

        if (!$subject) {

            abort(404);
        }

        $departments = DB::table('tblDepartment')
            ->orderBy('DepartmentName')
            ->get();

        return view('subjects.edit', compact(
            'subject',
            'departments'
        ));
    }

    /**
     * Update
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'Code' => 'required|max:20|unique:tblSubject,Code,' . $id . ',SubjectID',
            'SubjectName' => 'required|max:150',
            'DepartmentID' => 'required'
        ]);

        try {

            DB::table('tblSubject')
                ->where('SubjectID', $id)
                ->update([

                    'Code' => $request->Code,
                    'SubjectName' => $request->SubjectName,
                    'DepartmentID' => $request->DepartmentID,
                    'updated_at' => now()

                ]);

            return redirect()
                ->route('subjects.index')
                ->with('success', 'Subject Updated Successfully');
        } catch (Exception $e) {

            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    /**
     * Delete
     */
    public function destroy($id)
    {
        try {

            DB::table('tblSubject')
                ->where('SubjectID', $id)
                ->delete();

            return redirect()
                ->route('subjects.index')
                ->with('success', 'Subject Deleted Successfully');
        } catch (Exception $e) {

            return redirect()
                ->route('subjects.index')
                ->with('error', $e->getMessage());
        }
    }
}
