@extends('layouts.master')

@section('title', 'Forgot password | ZKT Attendance System')

@section('content')
<div class="w-full min-h-screen bg-slate-50 flex items-center justify-center p-6">
    <div class="w-full max-w-md rounded-3xl border border-slate-200 bg-white p-8 shadow-xl shadow-slate-200/50 sm:p-10">
        <a href="{{ route('login') }}" class="mb-8 inline-flex items-center gap-2 text-sm font-bold text-blue-700 hover:text-blue-900">← Back to login</a>
        <div class="mb-8"><div class="mb-5 flex h-12 w-12 items-center justify-center rounded-2xl bg-blue-600 text-xl font-black text-white">S</div><h1 class="text-3xl font-black tracking-tight text-slate-950">Reset your password</h1><p class="mt-2 text-sm leading-6 text-slate-500">Enter your administrator email. We will send a six-digit verification code.</p></div>
        @if($errors->any())<div class="mb-5 rounded-xl border border-rose-100 bg-rose-50 p-4 text-sm text-rose-700">{{ $errors->first() }}</div>@endif
        <form method="POST" action="{{ route('password.email') }}" class="space-y-5">@csrf
            <div><label class="mb-1.5 block text-xs font-bold uppercase tracking-wider text-slate-600">Administrator Email</label><input type="email" name="email" value="{{ old('email') }}" required autofocus autocomplete="email" placeholder="admin@university.edu" class="w-full rounded-xl border border-slate-200 px-4 py-3 text-sm text-slate-900 outline-none focus:border-blue-600"></div>
            <button class="w-full rounded-xl bg-blue-600 px-4 py-3.5 text-sm font-bold text-white shadow-md hover:bg-blue-700">Send verification code</button>
        </form>
    </div>
</div>
@endsection
