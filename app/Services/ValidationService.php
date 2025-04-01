<?php


namespace App\Services;

use Illuminate\Support\Facades\Validator;

class ValidationService
{

    public function addClient($request)
    {

        $rules = [
            'name' => 'required',
            'email' => 'required |unique:users,email',
            'mobile' => 'required',
            'company' => 'required',
            'address' => 'required',
            'password' => 'required'
        ];

        $validate = Validator::make($request->all(), $rules);
        if ($validate->fails()) {

            return [
                'success' => false,
                'message' => $validate->errors()->first()
            ];
        }

        return ['success' => true];
    }
    public function editClient($request)
    {
        $rules = [
            'user_uuid' => 'required',
        ];

        // Conditionally add the email rule only if email is present in the request
        if ($request->has('email')) {
            $rules['email'] = 'required|unique:users,email,' . $request->id;
        }

        $validate = Validator::make($request->all(), $rules);
        if ($validate->fails()) {
            return [
                'success' => false,
                'message' => $validate->errors()->first()
            ];
        }

        return ['success' => true];
    }

    public function userUUIDValidation($request)
    {
        $rules = [
            'user_uuid' => 'required'
        ];

        $validate = Validator::make($request->all(), $rules);
        if ($validate->fails()) {
            return [
                'success' => false,
                'message' => $validate->errors()->first()
            ];
        }

        return ['success' => true];
    }
}
