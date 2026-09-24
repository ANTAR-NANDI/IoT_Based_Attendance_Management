<?php

use App\Http\Controllers\AttendanceSettingController;
use App\Http\Controllers\Auth\LoginSessionController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DeviceController;
use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\DesignationController;
use App\Http\Controllers\BatchController;
use App\Http\Controllers\SubjectController;
use App\Http\Controllers\RosterAssignmentController;
use App\Http\Controllers\RosterLocationController;
use App\Http\Controllers\RosterPersonController;
use App\Http\Controllers\RosterReportController;
use App\Http\Controllers\RosterLocationReportController;
use App\Http\Controllers\RosterTeacherReportController;
use App\Http\Controllers\RosterRotationController;
use App\Http\Controllers\RosterSettingController;
use App\Http\Controllers\RosterShiftController;
use Illuminate\Support\Facades\Route;

Route::get('/', fn () => redirect()->route('login'));

Route::middleware('guest')->group(function () {
    Route::get('/login', [LoginSessionController::class, 'create'])->name('login');
    Route::post('/login', [LoginSessionController::class, 'store'])->name('login.post');
});

Route::middleware('auth')->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/dashboard/attendance-settings', [AttendanceSettingController::class, 'edit'])->name('attendance-settings.edit');
    Route::put('/dashboard/attendance-settings', [AttendanceSettingController::class, 'update'])->name('attendance-settings.update');
    Route::resource('dashboard/devices', DeviceController::class)->except('show');
    Route::resource('dashboard/departments', DepartmentController::class);
    Route::resource('dashboard/designations', DesignationController::class);
    Route::resource('dashboard/batches', BatchController::class)->except('show')->names('batches');
    Route::resource('dashboard/subjects', SubjectController::class)->except('show')->names('subjects');
    Route::resource('dashboard/roster/people', RosterPersonController::class)->except('show')->names('roster.people');
    Route::resource('dashboard/roster/locations', RosterLocationController::class)->except('show', 'destroy')->names('roster.locations');
    Route::resource('dashboard/roster/shifts', RosterShiftController::class)->except('show', 'destroy')->names('roster.shifts');
    Route::get('dashboard/roster/settings', [RosterSettingController::class, 'edit'])->name('roster.settings.edit');
    Route::put('dashboard/roster/settings', [RosterSettingController::class, 'update'])->name('roster.settings.update');
    Route::resource('dashboard/roster/assignments', RosterAssignmentController::class)->except('show')->names('roster.assignments');
    Route::get('dashboard/roster/security-rotation', [RosterRotationController::class, 'create'])->name('roster.rotation.create');
    Route::post('dashboard/roster/security-rotation', [RosterRotationController::class, 'store'])->name('roster.rotation.store');
    Route::get('dashboard/reports/roster-attendance', [RosterReportController::class, 'index'])->name('reports.roster-attendance');
    Route::get('dashboard/reports/roster-attendance/pdf', [RosterReportController::class, 'exportPdf'])->name('reports.roster-attendance.pdf');
    Route::get('dashboard/reports/room-attendance', [RosterLocationReportController::class, 'index'])->name('reports.room-attendance');
    Route::get('dashboard/reports/room-attendance/pdf', [RosterLocationReportController::class, 'exportPdf'])->name('reports.room-attendance.pdf');
    Route::get('dashboard/reports/teacher-attendance', [RosterTeacherReportController::class, 'index'])->name('reports.teacher-attendance');
    Route::get('dashboard/reports/teacher-attendance/pdf', [RosterTeacherReportController::class, 'exportPdf'])->name('reports.teacher-attendance.pdf');
    Route::post('/logout', [LoginSessionController::class, 'destroy'])->name('logout');
});
