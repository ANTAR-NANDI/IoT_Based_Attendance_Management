@extends('layouts.master')

@section('title', 'My Profile | ZKT Attendance System')

@section('content')
<div class="mx-auto max-w-3xl space-y-6">
    <div><p class="text-sm font-bold uppercase tracking-wider text-blue-700">Account settings</p><h1 class="mt-1 text-2xl font-bold">My Profile</h1><p class="mt-1 text-sm text-slate-500">Update your administrator account details or change your password.</p></div>
    <form method="POST" action="{{ route('profile.update') }}" class="overflow-hidden rounded-xl border bg-white shadow-sm">@csrf @method('PUT')
        <div class="grid gap-5 p-6 md:grid-cols-2"><div><label class="text-sm font-semibold">Full name</label><input required name="name" value="{{ old('name', $user->name) }}" autocomplete="name" class="mt-1 w-full rounded-lg border p-2.5"></div><div><label class="text-sm font-semibold">Email address</label><input required type="email" name="email" value="{{ old('email', $user->email) }}" autocomplete="email" class="mt-1 w-full rounded-lg border p-2.5"></div></div>
        <div class="border-t bg-slate-50 p-6"><h2 class="font-bold text-slate-900">Change password</h2><p class="mt-1 text-sm text-slate-500">Leave these fields blank if you do not want to change your password.</p><div class="mt-5 grid gap-5 md:grid-cols-2"><div class="md:col-span-2"><label class="text-sm font-semibold">Current password</label><input type="password" name="current_password" autocomplete="current-password" class="mt-1 w-full rounded-lg border bg-white p-2.5"></div><div><label class="text-sm font-semibold">New password</label><input type="password" name="password" autocomplete="new-password" class="mt-1 w-full rounded-lg border bg-white p-2.5"></div><div><label class="text-sm font-semibold">Confirm new password</label><input type="password" name="password_confirmation" autocomplete="new-password" class="mt-1 w-full rounded-lg border bg-white p-2.5"></div></div></div>
        <div class="flex justify-end border-t p-5"><button class="rounded-lg bg-blue-600 px-5 py-2.5 text-sm font-bold text-white hover:bg-blue-700">Save profile changes</button></div>
    </form>
</div>
@endsection
