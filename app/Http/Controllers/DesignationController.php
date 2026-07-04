<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DesignationController extends Controller
{
    public function index(Request $request)
    {
        $query = DB::table('tblDesignation')
            ->select('tblDesignation.*');

        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('tblDesignation.DesignationName', 'like', '%' . $request->search . '%')
                    ->orWhere('tblDesignation.DesignationID', 'like', '%' . $request->search . '%');
            });
        }

        $designations = $query->orderBy('tblDesignation.DesignationID', 'DESC')
            ->paginate(10)
            ->withQueryString();

        return view('designations.index', compact('designations'));
    }

    /**
     * Show Create Form
     */
    public function create()
    {
        return view('designations.create');
    }

    /**
     * Store Employee
     */
    public function store(Request $request)
    {
        $request->validate([
            'strName' => 'required',
        ]);

        try {
            DB::table('tblDesignation')->insert([
                'DesignationName' => $request->strName
            ]);

            return redirect()
                ->route('designations.index')
                ->with('success', 'Designation Added Successfully');
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
        $designation = DB::table('tblDesignation')
            ->where('DesignationID', $id)
            ->first();

        if (!$designation) {
            abort(404);
        }
        return view('designations.edit', compact(
            'designation'
        ));
    }

    /**
     * Update Employee
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'strName' => 'required'
        ]);

        try {

            $designation = DB::table('tblDesignation')
                ->where('DesignationID', $id)
                ->first();

            if (!$designation) {
                return back()->with('error', 'Designation not found');
            }



            DB::table('tblDesignation')
                ->where('DesignationID', $id)
                ->update([
                    'DesignationName' => $request->strName
                ]);

            return redirect()
                ->route('designations.index')
                ->with('success', 'Designation Updated Successfully');
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

            DB::table('tblDesignationOrder')
                ->where('id', $id)
                ->delete();

            return redirect()
                ->route('designations.index')
                ->with('success', 'Designation Deleted Successfully');
        } catch (Exception $e) {

            return redirect()
                ->route('designations.index')
                ->with('error', 'Unable to delete Designation.');
        }
    }
}
