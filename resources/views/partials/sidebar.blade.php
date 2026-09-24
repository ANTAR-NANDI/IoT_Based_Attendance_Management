<aside class="flex h-full w-64 flex-col border-r border-slate-800/80 bg-slate-950 text-slate-300">
    <div class="flex h-16 shrink-0 items-center border-b border-slate-800/80 px-5"><div class="flex items-center space-x-3"><div class="flex h-8 w-8 items-center justify-center rounded-lg bg-indigo-600 text-sm font-bold text-white">A</div><span class="text-[15px] font-semibold tracking-wide text-white">Army Roster</span></div></div>
    @php
        $menu = [
            ['route' => 'dashboard', 'label' => 'Dashboard'],
            ['heading' => 'ZKT Setup'],
            ['route' => 'devices.index', 'label' => 'ZKT Devices'],
            ['heading' => 'Roster Setup'],
            ['route' => 'departments.index', 'label' => 'Departments'],
            ['route' => 'designations.index', 'label' => 'Designations'],
            ['route' => 'roster.people.index', 'label' => 'Employees'],
            ['heading' => 'Academic Setup'],
            ['route' => 'batches.index', 'label' => 'Batches, Sessions & Semesters'],
            ['route' => 'subjects.index', 'label' => 'Subjects'],
            ['heading' => 'Roster Setup'],
            ['route' => 'roster.locations.index', 'label' => 'Duty Posts'],
            ['route' => 'roster.shifts.index', 'label' => 'Roster Shifts'],
            ['route' => 'roster.settings.edit', 'label' => 'Roster Grace Settings'],
            ['route' => 'roster.assignments.index', 'label' => 'Roster Calendar'],
            ['route' => 'roster.rotation.create', 'label' => '24-Hour Security Rotation'],
            ['heading' => 'Reports'],
            ['route' => 'reports.roster-attendance', 'label' => 'Roster Attendance Report'],
            ['route' => 'reports.room-attendance', 'label' => 'Room-wise Attendance'],
            ['route' => 'reports.teacher-attendance', 'label' => 'Teacher-wise Attendance'],
        ];
    @endphp
    <nav class="flex-1 space-y-1 overflow-y-auto px-3 py-5">
        @foreach($menu as $item)
            @if(isset($item['heading']))
                <div class="px-3 pb-1 pt-3 text-[11px] font-semibold uppercase tracking-wider text-slate-500">{{ $item['heading'] }}</div>
            @else
                <a href="{{ route($item['route']) }}" class="block rounded-lg px-4 py-2.5 text-sm font-medium {{ request()->routeIs($item['route'].'*') ? 'bg-indigo-600/20 text-white' : 'text-slate-400 hover:bg-slate-800/60 hover:text-white' }}">{{ $item['label'] }}</a>
            @endif
        @endforeach
    </nav>
</aside>
