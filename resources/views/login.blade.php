@extends('layouts.master')

@section('content')
<div class="w-full min-h-screen flex flex-col lg:flex-row bg-white">
    
    <div class="hidden lg:flex lg:w-[52%] bg-gradient-to-br from-[#071735] via-[#102957] to-[#173b72] justify-center items-center p-16 text-white relative overflow-hidden">
        <div class="z-10 max-w-lg space-y-7">
            <div class="h-14 w-14 rounded-2xl bg-blue-600 flex items-center justify-center font-black text-2xl shadow-xl shadow-blue-500/30">S</div>
            <div class="space-y-2">
                <p class="text-xs font-bold uppercase tracking-[0.22em] text-blue-200">Sanjibani Army University</p>
                <h1 class="text-4xl font-black tracking-tight leading-tight">Duty Roster &<br>Biometric Attendance</h1>
                <p class="text-blue-100/70 text-base leading-relaxed">A secure control centre for duty scheduling, guard rotation and verified biometric attendance.</p>
            </div>
            <div class="inline-flex items-center space-x-3 text-xs text-blue-100 bg-blue-950/35 p-4 rounded-xl border border-blue-400/20 backdrop-blur-sm">
                <span class="flex h-2 w-2 relative">
                    <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                    <span class="relative inline-flex rounded-full h-2 w-2 bg-emerald-500"></span>
                </span>
                <span class="font-semibold tracking-wide">Secure access · ZKT attendance integration</span>
            </div>
        </div>
        <div class="absolute -bottom-24 -left-24 w-80 h-80 bg-indigo-600 rounded-full mix-blend-screen filter blur-3xl opacity-20"></div>
        <div class="absolute -top-24 -right-24 w-80 h-80 bg-blue-500 rounded-full mix-blend-screen filter blur-3xl opacity-10"></div>
    </div>

    <div class="flex flex-1 items-center justify-center p-8 sm:p-16 bg-slate-50">
        <div class="w-full max-w-sm space-y-8">
            <div class="space-y-2">
                <div class="mb-8 flex items-center gap-3 lg:hidden"><div class="flex h-10 w-10 items-center justify-center rounded-xl bg-blue-600 font-black text-white">S</div><span class="font-bold text-slate-900">Sanjibani Admin</span></div>
                <h2 class="text-3xl font-black text-slate-950 tracking-tight">Administrator Login</h2>
                <p class="text-sm text-slate-500">Sign in with your authorized administrator account.</p>
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
                    <label class="block text-xs font-bold uppercase tracking-wider text-slate-600 mb-1.5">Administrator Email</label>
                    <input type="email" name="email" value="{{ old('email') }}" required autofocus autocomplete="email" placeholder="admin@university.edu"
                        class="w-full px-4 py-3 rounded-xl border border-slate-200 bg-white text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-blue-600 text-sm shadow-sm transition duration-150">
                </div>

                <div>
                    <div class="mb-1.5 flex items-center justify-between"><label class="block text-xs font-bold uppercase tracking-wider text-slate-600">Password</label><a href="{{ route('password.request') }}" class="text-xs font-bold text-blue-700 hover:text-blue-900">Forgot password?</a></div>
                    <input type="password" name="password" required autocomplete="current-password" placeholder="Enter your password"
                        class="w-full px-4 py-3 rounded-xl border border-slate-200 bg-white text-slate-900 placeholder:text-slate-400 focus:outline-none focus:border-blue-600 text-sm shadow-sm transition duration-150">
                </div>

                <div class="flex items-center">
                    <input id="remember" type="checkbox" name="remember" class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-slate-300 rounded-sm transition cursor-pointer">
                    <label for="remember" class="ml-2 block text-xs font-medium text-slate-600 select-none cursor-pointer">Keep me signed in on this device</label>
                </div>

                <button type="submit" class="w-full flex justify-center py-3.5 px-4 border border-transparent rounded-xl shadow-md text-sm font-bold text-white bg-blue-600 hover:bg-blue-700 focus:outline-none transform active:scale-98 transition duration-150 cursor-pointer">
                    Sign In Securely
                </button>
            </form>
            <p class="text-center text-xs text-slate-400">Authorized administrators only · Secure system access</p>
        </div>
    </div>

</div>
@endsection
