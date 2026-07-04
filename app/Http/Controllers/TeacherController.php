<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TeacherController extends Controller
{
    /**
     * Display Employee List
     */
    public function index(Request $request)
    {
        $query = DB::table('tblTeacher as t')
            ->join('tblDepartment as d', 't.DepartmentID', '=', 'd.DepartmentID')
            ->join('tblDesignation as des', 't.DesignationID', '=', 'des.DesignationID')
            ->select(
                't.*',
                'd.DepartmentName',
                'des.DesignationName'
            );
        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('t.TeacherName', 'like', "%{$request->search}%")
                    ->orWhere('t.EmployeeID', 'like', "%{$request->search}%")
                    ->orWhere('d.DepartmentName', 'like', "%{$request->search}%")
                    ->orWhere('des.DesignationName', 'like', "%{$request->search}%")
                    ->orWhere('t.Mobile', 'like', "%{$request->search}%");
            });
        }

        $teachers = $query
            ->orderByDesc('TeacherID')
            ->paginate(20);

        return view('teachers.index', compact('teachers'));
    }

    /**
     * Show Create Form
     */
    public function create()
    {
        $departments = DB::table('tblDepartment')
            ->where('Status', 1)
            ->orderBy('DepartmentName')
            ->get();

        $designations = DB::table('tblDesignation')
            ->where('Status', 1)
            ->orderBy('DesignationName')
            ->get();

        return view('teachers.create', compact(
            'departments',
            'designations'
        ));
    }
    /**
     * Store Employee
     */
    public function store(Request $request)
    {
        $request->validate([
            'EmployeeID'    => 'required|max:50|unique:tblTeacher,EmployeeID',
            'TeacherName'   => 'required|max:100',
            'DepartmentID'  => 'required',
            'DesignationID' => 'required',
            'Mobile'        => 'nullable|max:20',
            'Email'         => 'nullable|email',
            'ZKUserID'      => 'nullable|integer',
        ]);

        DB::table('tblTeacher')->insert([
            'EmployeeID'    => $request->EmployeeID,
            'TeacherName'   => $request->TeacherName,
            'DepartmentID'  => $request->DepartmentID,
            'DesignationID' => $request->DesignationID,
            'Mobile'        => $request->Mobile,
            'Email'         => $request->Email,
            'ZKUserID'      => $request->ZKUserID,
            'created_at'    => now(),
            'updated_at'    => now(),
        ]);

        return redirect()
            ->route('teachers.index')
            ->with('success', 'Teacher Added Successfully');
    }

    /**
     * Show Edit Form
     */
    public function edit($id)
    {
        $teacher = DB::table('tblTeacher')
            ->where('TeacherID', $id)
            ->first();

        if (!$teacher) {
            abort(404);
        }

        $departments = DB::table('tblDepartment')
            ->where('Status', 1)
            ->get();

        $designations = DB::table('tblDesignation')
            ->where('Status', 1)
            ->get();

        return view('teachers.edit', compact(
            'teacher',
            'departments',
            'designations'
        ));
    }

    /**
     * Update Employee
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'EmployeeID'    => 'required|max:50|unique:tblTeacher,EmployeeID,' . $id . ',TeacherID',
            'TeacherName'   => 'required|max:100',
            'DepartmentID'  => 'required',
            'DesignationID' => 'required',
            'Mobile'        => 'nullable|max:20',
            'Email'         => 'nullable|email',
            'ZKUserID'      => 'nullable|integer',
        ]);

        try {

            DB::table('tblTeacher')
                ->where('TeacherID', $id)
                ->update([
                    'EmployeeID'    => $request->EmployeeID,
                    'TeacherName'   => $request->TeacherName,
                    'DepartmentID'  => $request->DepartmentID,
                    'DesignationID' => $request->DesignationID,
                    'Mobile'        => $request->Mobile,
                    'Email'         => $request->Email,
                    'ZKUserID'      => $request->ZKUserID,
                    'updated_at'    => now(),
                ]);

            return redirect()
                ->route('teachers.index')
                ->with('success', 'Teacher Updated Successfully');
        } catch (Exception $e) {

            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    /**
     * Delete Employee
     */
    public function destroy($id)
    {
        try {

            DB::table('tblTeacher')
                ->where('TeacherID', $id)
                ->delete();

            return redirect()
                ->route('teachers.index')
                ->with('success', 'Teacher Deleted Successfully');
        } catch (Exception $e) {

            return redirect()
                ->route('teachers.index')
                ->with('error', $e->getMessage());
        }
    }
}
