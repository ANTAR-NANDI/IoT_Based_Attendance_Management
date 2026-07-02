<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DepartmentController extends Controller
{
    public function index(Request $request)
    {
        $query = DB::table('tblDepartment')
            ->select('tblDepartment.*');

        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('tblDepartment.DepartmentName', 'like', '%' . $request->search . '%')
                    ->orWhere('tblDepartment.DepartmentID', 'like', '%' . $request->search . '%');
            });
        }

        $departments = $query->orderBy('tblDepartment.DepartmentID', 'DESC')
            ->paginate(10)
            ->withQueryString();

        return view('departments.index', compact('departments'));
    }

    /**
     * Show Create Form
     */
    public function create()
    {
        return view('departments.create');
    }

    /**
     * Store Employee
     */
    public function store(Request $request)
    {
        $request->validate([
            'DepartmentName' => 'required',
            'DepartmentCode' => 'required'
        ]);

        try {



            DB::table('tblDepartment')->insert([
                'DepartmentName' => $request->DepartmentName,
                'DepartmentCode' => $request->DepartmentCode
            ]);

            return redirect()
                ->route('departments.index')
                ->with('success', 'Department Added Successfully');
        } catch (Exception $e) {

            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    /**
     * Show Edit Form
     */
    public function edit($DepartmentID)
    {
        $department = DB::table('tblDepartment')
            ->where('DepartmentID', $DepartmentID)
            ->first();

        if (!$department) {
            abort(404);
        }
        return view('departments.edit', compact(
            'department'
        ));
    }

    /**
     * Update Employee
     */
    public function update(Request $request, $DepartmentID)
    {
        $request->validate([
            'DepartmentName' => 'required',
            'DepartmentCode' => 'required'
        ]);

        try {

            $department = DB::table('tblDepartment')
                ->where('DepartmentID', $DepartmentID)
                ->first();

            if (!$department) {
                return back()->with('error', 'Department not found');
            }



            DB::table('tblDepartment')
                ->where('DepartmentID', $DepartmentID)
                ->update([
                    'DepartmentName' => $request->DepartmentName,
                    'DepartmentCode' => $request->DepartmentCode
                ]);

            return redirect()
                ->route('departments.index')
                ->with('success', 'Department Updated Successfully');
        } catch (Exception $e) {

            return back()
                ->withInput()
                ->with('error', $e->getMessage());
        }
    }

    /**
     * Delete Employee
     */
    public function destroy($DepartmentID)
    {
        try {

            DB::table('tblDepartment')
                ->where('DepartmentID', $DepartmentID)
                ->delete();

            return redirect()
                ->route('departments.index')
                ->with('success', 'Department Deleted Successfully');
        } catch (Exception $e) {

            return redirect()
                ->route('departments.index')
                ->with('error', 'Unable to delete Department.');
        }
    }
}
