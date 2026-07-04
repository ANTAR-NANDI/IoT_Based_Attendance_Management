<header class="bg-white border-b border-slate-200 h-16 px-4 sm:px-6 flex items-center justify-between shadow-sm shrink-0 z-10">
    <div class="flex items-center min-w-0">

        <button
            @click="sidebarOpen = true"
            class="lg:hidden mr-3 p-2 -ml-2 rounded-lg text-slate-500 hover:bg-slate-100 shrink-0">
            <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5M3.75 17.25h16.5" />
            </svg>
        </button>

        <div class="hidden sm:flex text-xs font-semibold text-slate-400 tracking-wider uppercase items-center space-x-2 truncate">
            <span class="h-2 w-2 rounded-full bg-indigo-500 animate-pulse shrink-0"></span>
            <span class="truncate">System Date: <span class="text-slate-700 font-bold ml-1">{{ date('Y-m-d') }}</span></span>
        </div>
    </div>

    <div class="flex items-center space-x-3 sm:space-x-6 shrink-0">
        <div class="flex flex-col text-right">
            <span class="text-sm font-bold text-slate-800 truncate max-w-[8rem] sm:max-w-none">{{ Auth::user()->name }}</span>
            <span class="hidden sm:inline-block text-[10px] text-slate-400 font-extrabold uppercase tracking-widest bg-slate-100 px-1.5 py-0.5 rounded mt-0.5">System Admin</span>
        </div>

        <form method="POST" action="{{ route('logout') }}">
            @csrf
            <button type="submit" class="bg-white hover:bg-red-50 text-slate-600 hover:text-red-600 px-2.5 sm:px-3 py-1.5 rounded-lg text-xs font-bold border border-slate-200 hover:border-red-200 shadow-xs transition cursor-pointer whitespace-nowrap">
                Sign Out
            </button>
        </form>
    </div>
</header>