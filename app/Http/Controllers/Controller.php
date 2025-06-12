<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Password;
use Illuminate\Auth\Notifications\ResetPassword;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use App\Models\SbUser;


class Controller extends BaseController

{
    use AuthorizesRequests, ValidatesRequests;

    public function forgetPassword(Request $request)
    {
        $user = User::where('email', $request->email)->first();
  
        if (!$user) {
            return response()->json(['success' => false, 'errors' => ['0' => 'Email not found !']], 404);
        }
        else if ($user->account_status === 'Disable') {
            return response()->json(['success' => false, 'errors' => ['0' => 'Account Not Active !']], 404);
        }
         else {
            $token = Password::createToken($user);

            $data = [
                $user->email
            ];

            Mail::send('Mail.ResetPassword', [
                'fullname'      => $user->name,
                'reset_url'     => route('password.reset', ['token' => $token, 'email' => $user->email]),
            ], function ($message) use ($data) {
                $message->subject('Reset Password Request');
                $message->to($data[0]);
            });

            return response()->json(['success' => true, 'message' => 'Password reset link sent'], 200);
        }
    }
    public function showResetForm(Request $request, $token = null)
    {
        return view('pages.auth.reset-password')->with(
            ['token' => $token, 'email' => $request->email]
        );
    }
    public function updatePassword(Request $request)
    {
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|confirmed|',
        ]);


        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['success' => false, 'errors' => ['0' => 'Email not found']], 404);
        }
        $resetToken = DB::table('password_reset_tokens')
            ->where('email', $request->email)
            ->first();

        if (!$resetToken || !Hash::check($request->token, $resetToken->token)) {
            return response()->json(['success' => false, 'errors' => ['0' => 'Invalid reset token']], 400);
        }

        $user->password = Hash::make($request->password);
        $user->save();


        return redirect()->route('login');
    }

    public function setToken(Request $request)
    {


        $user = auth('sanctum')->user();
        dd($request->all(), $user);
    }
}
