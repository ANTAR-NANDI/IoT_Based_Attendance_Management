<!DOCTYPE html>
<html lang="en" class="h-full">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>@yield('title', 'Enterprise HRM')</title>
      <link rel="icon" type="image/png" href="{{ asset('favicon.png') }}">
      <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>

    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

    <style>
        [x-cloak] { display: none !important; }

        /* School management palette: navy foundation, blue actions, teal success. */
        :root {
            --brand-navy: #173b63;
            --brand-blue: #2563eb;
            --brand-blue-hover: #1d4ed8;
            --brand-teal: #0f766e;
            --brand-teal-hover: #0d5f59;
            --brand-slate: #475569;
            --brand-slate-hover: #334155;
            --brand-amber: #d97706;
            --brand-amber-hover: #b45309;
            --brand-rose: #dc2626;
            --brand-rose-hover: #b91c1c;
        }

        body { background-color: #f1f5f9; }

        [class~="bg-slate-800"] { background-color: var(--brand-navy) !important; }
        [class~="bg-slate-700"], [class~="bg-gray-500"] { background-color: var(--brand-slate) !important; }
        [class~="bg-indigo-600"], [class~="bg-blue-600"] { background-color: var(--brand-blue) !important; }
        [class~="bg-green-600"] { background-color: var(--brand-teal) !important; }
        [class~="bg-yellow-500"] { background-color: var(--brand-amber) !important; }
        [class~="bg-red-500"], [class~="bg-red-600"] { background-color: var(--brand-rose) !important; }

        [class~="hover:bg-slate-800"]:hover,
        [class~="hover:bg-gray-600"]:hover { background-color: var(--brand-slate-hover) !important; }
        [class~="hover:bg-indigo-700"]:hover,
        [class~="hover:bg-blue-700"]:hover { background-color: var(--brand-blue-hover) !important; }
        [class~="hover:bg-green-700"]:hover { background-color: var(--brand-teal-hover) !important; }
        [class~="hover:bg-yellow-600"]:hover { background-color: var(--brand-amber-hover) !important; }
        [class~="hover:bg-red-600"]:hover,
        [class~="hover:bg-red-700"]:hover { background-color: var(--brand-rose-hover) !important; }

        input:focus, select:focus, textarea:focus {
            border-color: var(--brand-blue) !important;
            outline: 2px solid rgb(37 99 235 / 0.2);
            outline-offset: 1px;
        }
    </style>

    @stack('styles')
</head>

<body class="h-full bg-slate-100 text-slate-800 antialiased" x-data="{ sidebarOpen: false }">

@auth

<div class="flex h-screen overflow-hidden">

    {{-- Mobile overlay --}}
    <div
        x-show="sidebarOpen"
        x-cloak
        @click="sidebarOpen = false"
        class="fixed inset-0 bg-black/50 z-30 lg:hidden">
    </div>

    {{-- Sidebar --}}
    <div
        :class="sidebarOpen ? 'translate-x-0' : '-translate-x-full'"
        class="fixed inset-y-0 left-0 z-40 transform transition-transform duration-200 ease-in-out
               lg:static lg:translate-x-0 lg:z-auto">
        @include('partials.sidebar')
    </div>

    <div class="flex flex-1 flex-col overflow-hidden min-w-0">

        {{-- Topbar --}}
        @include('partials.topbar')

        {{-- Main Content --}}
        <main class="flex-1 overflow-y-auto p-6">

            @if(session('success'))
                <div class="mb-4 rounded-lg border border-green-300 bg-green-100 px-4 py-3 text-green-700">
                    {{ session('success') }}
                </div>
            @endif

            @if(session('error'))
                <div class="mb-4 rounded-lg border border-red-300 bg-red-100 px-4 py-3 text-red-700">
                    {{ session('error') }}
                </div>
            @endif

            @if ($errors->any())
                <div class="mb-4 rounded-lg border border-red-300 bg-red-100 p-4">
                    <ul class="list-disc pl-5 text-red-700">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            @yield('content')

        </main>

        {{-- Footer --}}
        @include('partials.footer')

    </div>

</div>

@else

<div class="flex min-h-screen items-center justify-center bg-slate-100">

    @yield('content')

</div>

@endauth

@stack('scripts')

</body>
</html>
