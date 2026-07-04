<!DOCTYPE html>
<html lang="en" class="h-full">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>@yield('title', 'Enterprise HRM')</title>
      <link rel="icon" type="image/png" href="{{ asset('favicon.png') }}">
      <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>

    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

    <style>[x-cloak] { display: none !important; }</style>

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