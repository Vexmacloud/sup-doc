<?php

use App\Models\Role;
use App\Models\User;

function findUser($id)
{

    $user = User::where('uuid', $id)->first();
    if ($user) {
        return ['success' => true, 'data' => $user];
    } else {
        return ['success' => false, 'message' => 'User not found'];
    }
}

function findRole($string)
{
    $role = Role::where('role', $string)->first();
    if ($role) {
        return ['success' => true, 'data' => $role];
    } else {
        return ['success' => false, 'message' => 'Role not found'];
    }
}
