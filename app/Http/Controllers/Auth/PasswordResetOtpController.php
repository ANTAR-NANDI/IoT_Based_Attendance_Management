<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;

class PasswordResetOtpController extends Controller
{
    private const OTP_LIFETIME_MINUTES = 10;
    private const MAX_OTP_REQUESTS = 3;

    public function create()
    {
        return view('auth.forgot-password');
    }

    public function send(Request $request)
    {
        $data = $request->validate(['email' => ['required', 'email']]);
        $email = strtolower($data['email']);
        $key = 'password-reset-otp:'.$email.'|'.$request->ip();

        if (RateLimiter::tooManyAttempts($key, self::MAX_OTP_REQUESTS)) {
            $seconds = RateLimiter::availableIn($key);
            throw ValidationException::withMessages([
                'email' => "Too many requests. Please try again in {$seconds} seconds.",
            ]);
        }

        $user = User::where('email', $email)->first();
        RateLimiter::hit($key, 600);
        $request->session()->put('password_reset_email', $email);

        // Keep the response identical even if the address is not registered.
        if ($user) {
            $otp = (string) random_int(100000, 999999);
            DB::table('password_reset_tokens')->updateOrInsert(
                ['email' => $email],
                ['token' => Hash::make($otp), 'created_at' => now()]
            );

            try {
                Mail::raw(
                    "Your Sanjibani Admin password reset code is: {$otp}\n\nThis code expires in ".self::OTP_LIFETIME_MINUTES." minutes. Do not share it with anyone.",
                    fn ($message) => $message->to($user->email, $user->name)->subject('Your Sanjibani password reset code')
                );
            } catch (\Throwable $exception) {
                report($exception);
                throw ValidationException::withMessages([
                    'email' => 'We could not send the verification email. Please try again later or contact the system administrator.',
                ]);
            }
        }

        return redirect()->route('password.otp.form')->with('status', 'If this email belongs to an administrator account, a verification code has been sent.');
    }

    public function showResetForm(Request $request)
    {
        if (!$request->session()->has('password_reset_email')) {
            return redirect()->route('password.request')->withErrors(['email' => 'Enter your email address to request a verification code.']);
        }

        return view('auth.reset-password', ['email' => $request->session()->get('password_reset_email')]);
    }

    public function reset(Request $request)
    {
        $email = $request->session()->get('password_reset_email');
        if (!$email) {
            return redirect()->route('password.request')->withErrors(['email' => 'Your reset session has expired. Request a new code.']);
        }

        $data = $request->validate([
            'otp' => ['required', 'digits:6'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
        $record = DB::table('password_reset_tokens')->where('email', $email)->first();
        $valid = $record
            && $record->created_at
            && now()->diffInMinutes($record->created_at, false) >= -self::OTP_LIFETIME_MINUTES
            && Hash::check($data['otp'], $record->token);

        if (!$valid) {
            throw ValidationException::withMessages(['otp' => 'The verification code is invalid or has expired.']);
        }

        $user = User::where('email', $email)->first();
        if (!$user) {
            throw ValidationException::withMessages(['otp' => 'The verification code is invalid or has expired.']);
        }

        $user->forceFill(['password' => Hash::make($data['password']), 'remember_token' => Str::random(60)])->save();
        DB::table('password_reset_tokens')->where('email', $email)->delete();
        RateLimiter::clear('password-reset-otp:'.$email.'|'.$request->ip());
        $request->session()->forget('password_reset_email');
        Auth::login($user);
        $request->session()->regenerate();

        return redirect()->route('dashboard')->with('success', 'Your password has been reset successfully.');
    }
}
