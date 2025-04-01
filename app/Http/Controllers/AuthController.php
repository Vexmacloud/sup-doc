<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Http\Resources\UserPermissionResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class AuthController extends Controller
{

    public function authenticate(Request $request)
    {


        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json(['success' => false, 'errors' => ['0' => 'Invalid Credentials']], 401);
        }

        $matchPassword = $user->comparePassword($request->password);

        if (!$matchPassword) {
            return response()->json(['success' => false, 'errors' => ['0' => 'Invalid Credentials']], 401);
        }

        $token = $user->createToken('APISECERETABABABABABABABABA')->plainTextToken;

        return response()->json([
            'success' => true,
            'message' => 'Login Successfully',
            'data' => new UserResource($user),
            'token' => $token,
        ], 200);
    }

    public function verifyToken(Request $request)
    {

        if (auth('sanctum')->user()) {
            $user = auth('sanctum')->user();
            return response()->json([
                'success' => true,
                'message' => 'Login Successfully',
                'data' => new UserResource($user),
                'token' => $request->api_token,
            ], 200);
        } else {
            return response()->json(['success' => false, 'errors' => ['0' => 'Session Expired']], 401);
        }
    }
    public function logoutAllDevices(Request $request)
    {
        // 1. Get the currently authenticated user
        $user = User::where('uuid', $request->uuid)->first();
     
        if(auth('sanctum')->user()){
            // 2. Invalidate all tokens associated with the user
        $user->tokens()->delete();
        return response()->json([
            'success' => true,
            'message' => 'Logged out from all devices successfully. Please redirect to the login page.',
            'redirectUrl'=> '/#/sign-in'
        ], 200);
        }
        else{
            return response()->json(['success' => false, 'message' => 'User not found',]);
        }     
    }

}
