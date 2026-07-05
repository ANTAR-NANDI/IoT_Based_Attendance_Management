<aside class="w-64 bg-slate-950 text-slate-300 flex flex-col h-full border-r border-slate-800/80 z-20">

    {{-- Logo --}}
    <div class="px-5 h-16 shrink-0 flex items-center justify-between border-b border-slate-800/80">
        <div class="flex items-center space-x-3">
            <div class="h-8 w-8 rounded-lg bg-indigo-600 flex items-center justify-center font-bold text-white text-sm">H</div>
            <span class="text-[15px] font-semibold tracking-wide text-white">HRM W3</span>
        </div>

        <button
            @click="sidebarOpen = false"
            class="lg:hidden p-1.5 rounded-lg text-slate-400 hover:bg-slate-800 hover:text-white">
            <svg class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
            </svg>
        </button>
    </div>

    <nav class="flex-1 px-3 py-5 space-y-6 overflow-y-auto">

        {{-- Overview --}}
        <div class="space-y-1">
            <a href="{{ route('dashboard') }}"
               class="group relative flex items-center space-x-3 pl-4 pr-3 py-2.5 rounded-lg text-sm font-medium transition
                      {{ Route::currentRouteName() == 'dashboard'
                            ? 'bg-indigo-600/15 text-white'
                            : 'text-slate-400 hover:bg-slate-800/60 hover:text-slate-100' }}">
                @if (Route::currentRouteName() == 'dashboard')
                    <span class="absolute left-0 top-1.5 bottom-1.5 w-[3px] rounded-r-full bg-indigo-500"></span>
                @endif
                <svg class="w-[18px] h-[18px] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 13.5l7.5-7.5 7.5 7.5M4.5 12v7.125c0 .621.504 1.125 1.125 1.125H9.75v-4.5a1.125 1.125 0 011.125-1.125h2.25A1.125 1.125 0 0114.25 15.75v4.5h4.125c.621 0 1.125-.504 1.125-1.125V12" />
                </svg>
                <span>Dashboard</span>
            </a>
        </div>

        {{-- Master Registry --}}
        <div class="space-y-1">
            <div class="px-4 pb-1 text-[11px] font-semibold text-slate-500 uppercase tracking-wider">Master registry</div>

            @php
                $registry = [
                    ['route' => 'departments.index',   'label' => 'Departments',   'icon' => 'folder'],
                    ['route' => 'designations.index',   'label' => 'Designations',  'icon' => 'badge'],
                    ['route' => 'teachers.index',       'label' => 'Teachers',      'icon' => 'user'],
                    ['route' => 'subjects.index',       'label' => 'Subjects',      'icon' => 'book'],
                    ['route' => 'batches.index',        'label' => 'Batches',       'icon' => 'users'],
                    ['route' => 'rooms.index',          'label' => 'Rooms',         'icon' => 'door'],
                    ['route' => 'devices.index',        'label' => 'Devices',       'icon' => 'device'],
                    ['route' => 'routines.index',       'label' => 'Routines',      'icon' => 'book'],
                ];
            @endphp

            @foreach ($registry as $item)
                <a onclick="window.location.href='{{ route($item['route']) }}'" href="#"
                   class="group relative flex items-center space-x-3 pl-4 pr-3 py-2 rounded-lg text-sm font-medium transition
                          {{ Route::currentRouteName() == $item['route']
                                ? 'bg-indigo-600/15 text-white'
                                : 'text-slate-400 hover:bg-slate-800/60 hover:text-slate-100' }}">
                    @if (Route::currentRouteName() == $item['route'])
                        <span class="absolute left-0 top-1.5 bottom-1.5 w-[3px] rounded-r-full bg-indigo-500"></span>
                    @endif

                    @switch($item['icon'])
                        @case('folder')
                            <svg class="w-[17px] h-[17px] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3 7.5A1.5 1.5 0 014.5 6h4.379a1.5 1.5 0 011.06.44l1.122 1.12a1.5 1.5 0 001.06.44H19.5A1.5 1.5 0 0121 9.5v8a1.5 1.5 0 01-1.5 1.5h-15A1.5 1.5 0 013 17.5v-10z" />
                            </svg>
                            @break
                        @case('badge')
                            <svg class="w-[17px] h-[17px] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 6.75V15m6-8.25V15M4.5 4.5h15A1.5 1.5 0 0121 6v13.5a1.5 1.5 0 01-1.5 1.5h-15A1.5 1.5 0 013 19.5V6a1.5 1.5 0 011.5-1.5z" />
                            </svg>
                            @break
                        @case('user')
                            <svg class="w-[17px] h-[17px] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.5 20.25a7.5 7.5 0 0115 0" />
                            </svg>
                            @break
                        @case('book')
                            <svg class="w-[17px] h-[17px] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 6.75c-2.1-1.4-4.9-1.6-7-.6v12.6c2.1-1 4.9-.8 7 .6m0-12.6c2.1-1.4 4.9-1.6 7-.6v12.6c-2.1-1-4.9-.8-7 .6m0-12.6V19.35" />
                            </svg>
                            @break
                        @case('users')
                            <svg class="w-[17px] h-[17px] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15 19.5v-1.5a4.5 4.5 0 00-9 0v1.5m13.5 0v-1.5a4.5 4.5 0 00-3-4.24M10.5 10.5a3 3 0 100-6 3 3 0 000 6zm7.5 0a3 3 0 10-2.4-4.8" />
                            </svg>
                            @break
                        @case('door')
                            <svg class="w-[17px] h-[17px] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M5.25 20.25V4.5A1.5 1.5 0 016.75 3h7.5a1.5 1.5 0 011.5 1.5v15.75M5.25 20.25h13.5M5.25 20.25H3.75m15 0h1.5M14.25 12h.008" />
                            </svg>
                            @break
                        @case('device')
                            <svg class="w-[17px] h-[17px] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 17.25v1.5m3-1.5v1.5m3-1.5v1.5M4.5 5.25h15a.75.75 0 01.75.75v9a.75.75 0 01-.75.75h-15a.75.75 0 01-.75-.75V6a.75.75 0 01.75-.75z" />
                            </svg>
                            @break
                    @endswitch

                    <span>{{ $item['label'] }}</span>
                </a>
            @endforeach
        </div>

        {{-- Schedule --}}
        <div class="space-y-1">
            <div class="px-4 pb-1 text-[11px] font-semibold text-slate-500 uppercase tracking-wider">Schedule</div>

            <a onclick="window.location.href='{{ route('shifts.index') }}'" href="#"
               class="group relative flex items-center space-x-3 pl-4 pr-3 py-2 rounded-lg text-sm font-medium transition
                      {{ Route::currentRouteName() == 'shifts.index'
                            ? 'bg-indigo-600/15 text-white'
                            : 'text-slate-400 hover:bg-slate-800/60 hover:text-slate-100' }}">
                @if (Route::currentRouteName() == 'shifts.index')
                    <span class="absolute left-0 top-1.5 bottom-1.5 w-[3px] rounded-r-full bg-indigo-500"></span>
                @endif
                <svg class="w-[17px] h-[17px] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v6l4 2m5-2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                <span>Shifts</span>
            </a>

            <a onclick="window.location.href='{{ route('holidays.index') }}'" href="#"
               class="group relative flex items-center space-x-3 pl-4 pr-3 py-2 rounded-lg text-sm font-medium transition
                      {{ Route::currentRouteName() == 'holidays.index'
                            ? 'bg-indigo-600/15 text-white'
                            : 'text-slate-400 hover:bg-slate-800/60 hover:text-slate-100' }}">
                @if (Route::currentRouteName() == 'holidays.index')
                    <span class="absolute left-0 top-1.5 bottom-1.5 w-[3px] rounded-r-full bg-indigo-500"></span>
                @endif
                <svg class="w-[17px] h-[17px] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a1.5 1.5 0 011.5-1.5h15a1.5 1.5 0 011.5 1.5v11.25a1.5 1.5 0 01-1.5 1.5h-15a1.5 1.5 0 01-1.5-1.5zM3 10.5h18M8.25 14.25h1.5v1.5h-1.5v-1.5z" />
                </svg>
                <span>Holidays</span>
            </a>

            {{-- Leave (collapsible) --}}
            <div>
                <input type="checkbox" id="leave-toggle" class="peer hidden"
                       @checked(request()->routeIs('leave_types.index') || request()->routeIs('leaves.create')) />

                <label for="leave-toggle"
                       class="flex items-center justify-between pl-4 pr-3 py-2 rounded-lg text-sm font-medium text-slate-400 hover:bg-slate-800/60 hover:text-slate-100 transition cursor-pointer select-none">
                    <div class="flex items-center space-x-3">
                        <svg class="w-[17px] h-[17px] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a1.5 1.5 0 011.5-1.5h15a1.5 1.5 0 011.5 1.5v11.25a1.5 1.5 0 01-1.5 1.5h-15a1.5 1.5 0 01-1.5-1.5zM3 10.5h18" />
                        </svg>
                        <span>Leave</span>
                    </div>
                    <svg class="h-4 w-4 shrink-0 transition-transform duration-200 peer-checked:rotate-180" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M19 9l-7 7-7-7" />
                    </svg>
                </label>

                <div class="grid grid-rows-[0fr] peer-checked:grid-rows-[1fr] transition-all duration-200 ease-in-out">
                    <div class="overflow-hidden">
                        <div class="pl-11 pr-3 py-1 space-y-0.5">
                            <a onclick="window.location.href='{{ route('leave_types.index') }}'" href="#"
                               class="block px-3 py-1.5 rounded-md text-[13px] font-medium transition
                                      {{ Route::currentRouteName() == 'leave_types.index'
                                            ? 'text-white bg-indigo-600/15'
                                            : 'text-slate-400 hover:bg-slate-800/60 hover:text-slate-100' }}">
                                Leave type
                            </a>
                            <a onclick="window.location.href='{{ route('leaves.index') }}'" href="#"
                               class="block px-3 py-1.5 rounded-md text-[13px] font-medium transition
                                      {{ Route::currentRouteName() == 'leaves.index'
                                            ? 'text-white bg-indigo-600/15'
                                            : 'text-slate-400 hover:bg-slate-800/60 hover:text-slate-100' }}">
                                Leave apply
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="space-y-1">
            <div class="px-4 pb-1 text-[11px] font-semibold text-slate-500 uppercase tracking-wider">Reports</div>

            <a onclick="window.location.href='{{ route('reports.class-attendance') }}'" href="#"
               class="group relative flex items-center space-x-3 pl-4 pr-3 py-2 rounded-lg text-sm font-medium transition
                      {{ Route::currentRouteName() == 'reports.class-attendance'
                            ? 'bg-indigo-600/15 text-white'
                            : 'text-slate-400 hover:bg-slate-800/60 hover:text-slate-100' }}">
                @if (Route::currentRouteName() == 'reports.class-attendance')
                    <span class="absolute left-0 top-1.5 bottom-1.5 w-[3px] rounded-r-full bg-indigo-500"></span>
                @endif
                <svg class="w-[17px] h-[17px] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.75">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v6l4 2m5-2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                <span>Attendance Report</span>
            </a>
        </div>

    </nav>
</aside>