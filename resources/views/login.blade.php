@extends('layouts.master')

@section('content')
<div class="w-full min-h-screen flex flex-col lg:flex-row bg-white">
    <div class="hidden lg:flex lg:w-[53%] bg-[#06231d] justify-center items-center p-12 text-white relative overflow-hidden">
        <div class="absolute inset-0 bg-gradient-to-br from-[#063d31] via-[#07251f] to-[#031512]"></div>
        <div class="absolute inset-0 opacity-25" style="background-image: radial-gradient(#eabf35 1px, transparent 1px); background-size: 24px 24px;"></div>
        <div class="relative z-10 max-w-xl text-center">
            <img src="{{ asset('images/baiust-logo.jpeg') }}" alt="BAIUST logo" class="mx-auto h-56 w-56 rounded-full object-cover shadow-2xl ring-4 ring-[#d9ad2b]/70">
            <p class="mt-8 text-xs font-bold uppercase tracking-[0.28em] text-[#f5d764]">Bangladesh Army International University of Science and Technology</p>
            <h1 class="mt-4 text-4xl font-black tracking-tight leading-tight">BAIUST Attendance<br>Management System</h1>
            <p class="mx-auto mt-5 max-w-md text-base leading-relaxed text-emerald-50/75">Secure class routine, biometric attendance and roster management in one place.</p>
            <div class="mt-8 inline-flex items-center gap-3 rounded-xl border border-[#eabf35]/35 bg-black/15 px-4 py-3 text-xs text-emerald-50 backdrop-blur-sm">
                <span class="relative flex h-2.5 w-2.5"><span class="absolute inline-flex h-full w-full animate-ping rounded-full bg-emerald-300 opacity-75"></span><span class="relative inline-flex h-2.5 w-2.5 rounded-full bg-emerald-300"></span></span>
                <span class="font-semibold tracking-wide">Secure ZKT biometric integration</span>
            </div>
        </div>
    </div>

    <div class="flex flex-1 items-center justify-center bg-[#f4f7f5] p-6 sm:p-12">
        <div class="w-full max-w-md space-y-7 rounded-3xl border border-emerald-950/10 bg-white p-7 shadow-xl shadow-emerald-950/10 sm:p-9">
            <div class="space-y-2">
                <div class="mb-6 flex items-center gap-3">
                    <img src="{{ asset('images/baiust-logo.jpeg') }}" alt="BAIUST logo" class="h-14 w-14 rounded-full object-cover ring-2 ring-[#d9ad2b]">
                    <div><p class="text-xs font-bold uppercase tracking-wider text-[#07745a]">BAIUST</p><p class="text-sm font-semibold text-slate-700">Attendance Management</p></div>
                </div>
                <h2 class="text-3xl font-black text-slate-950 tracking-tight">Welcome back</h2>
                <p class="text-sm text-slate-500">Sign in with your authorized account to continue.</p>
            </div>

            @if($errors->any())
                <div class="bg-rose-50 text-rose-700 p-4 rounded-xl border border-rose-100 text-xs font-semibold space-y-1 shadow-xs">
                    <div class="font-bold text-sm">Authentication Failed</div>
                    <p>{{ $errors->first() }}</p>
                </div>
            @endif

            <form method="POST" action="{{ route('login.post') }}" class="space-y-5">
                @csrf
                <div>
                    <label class="block text-xs font-bold uppercase tracking-wider text-slate-600 mb-1.5">Email address</label>
                    <input type="email" name="email" value="{{ old('email') }}" required autofocus autocomplete="email" placeholder="admin@university.edu"
                        class="w-full px-4 py-3 rounded-xl border border-slate-200 bg-white text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-emerald-700 text-sm shadow-sm transition duration-150">
                </div>

                <div>
                    <div class="mb-1.5 flex items-center justify-between"><label class="block text-xs font-bold uppercase tracking-wider text-slate-600">Password</label><a href="{{ route('password.request') }}" class="text-xs font-bold text-emerald-700 hover:text-emerald-900">Forgot password?</a></div>
                    <input type="password" name="password" required autocomplete="current-password" placeholder="Enter your password"
                        class="w-full px-4 py-3 rounded-xl border border-slate-200 bg-white text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-emerald-700 text-sm shadow-sm transition duration-150">
                </div>

                <div class="flex items-center">
                    <input id="remember" type="checkbox" name="remember" class="h-4 w-4 rounded-sm border-slate-300 text-emerald-700 focus:ring-emerald-600 transition cursor-pointer">
                    <label for="remember" class="ml-2 block text-xs font-medium text-slate-600 select-none cursor-pointer">Keep me signed in on this device</label>
                </div>

                <button type="submit" class="w-full flex justify-center rounded-xl border border-transparent bg-[#08745c] px-4 py-3.5 text-sm font-bold text-white shadow-md transition duration-150 hover:bg-[#055c48] focus:outline-none transform active:scale-98 cursor-pointer">
                    Sign In Securely
                </button>
            </form>
            <p class="text-center text-xs text-slate-400">Authorized users only · Secure system access</p>
        </div>
    </div>

</div>
@endsection
