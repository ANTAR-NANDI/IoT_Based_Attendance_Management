@extends('layouts.master')

@section('title', 'Verify reset code | ZKT Attendance System')

@section('content')
<div class="w-full min-h-screen bg-slate-50 flex items-center justify-center p-6">
    <div class="w-full max-w-md rounded-3xl border border-slate-200 bg-white p-8 shadow-xl shadow-slate-200/50 sm:p-10">
        <a href="{{ route('password.request') }}" class="mb-8 inline-flex items-center gap-2 text-sm font-bold text-blue-700 hover:text-blue-900">← Use a different email</a>
        <div class="mb-8"><div class="mb-5 flex h-12 w-12 items-center justify-center rounded-2xl bg-blue-600 text-xl font-black text-white">S</div><h1 class="text-3xl font-black tracking-tight text-slate-950">Verify your code</h1><p class="mt-2 text-sm leading-6 text-slate-500">Enter the six-digit code sent to <span class="font-semibold text-slate-700">{{ $email }}</span>. It expires in 10 minutes.</p></div>
        @if(session('status'))<div class="mb-5 rounded-xl border border-emerald-100 bg-emerald-50 p-4 text-sm text-emerald-700">{{ session('status') }}</div>@endif
        @if($errors->any())<div class="mb-5 rounded-xl border border-rose-100 bg-rose-50 p-4 text-sm text-rose-700">{{ $errors->first() }}</div>@endif
        <form method="POST" action="{{ route('password.otp.reset') }}" class="space-y-5">@csrf
            <div><label class="mb-1.5 block text-xs font-bold uppercase tracking-wider text-slate-600">Verification Code</label><input type="text" name="otp" inputmode="numeric" pattern="[0-9]{6}" maxlength="6" required autocomplete="one-time-code" placeholder="000000" class="w-full rounded-xl border border-slate-200 px-4 py-3 text-center text-xl font-bold tracking-[0.4em] text-slate-900 outline-none focus:border-blue-600"></div>
            <div><label class="mb-1.5 block text-xs font-bold uppercase tracking-wider text-slate-600">New Password</label><input type="password" name="password" required autocomplete="new-password" placeholder="Minimum 8 characters" class="w-full rounded-xl border border-slate-200 px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-600"></div>
            <div><label class="mb-1.5 block text-xs font-bold uppercase tracking-wider text-slate-600">Confirm New Password</label><input type="password" name="password_confirmation" required autocomplete="new-password" placeholder="Repeat new password" class="w-full rounded-xl border border-slate-200 px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-600"></div>
            <button class="w-full rounded-xl bg-blue-600 px-4 py-3.5 text-sm font-bold text-white shadow-md hover:bg-blue-700">Verify code and reset password</button>
        </form>
    </div>
</div>
@endsection
