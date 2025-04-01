<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\Controller;
use App\Http\Controllers\TenantController;
use Illuminate\Support\Facades\Route;
use routes\api;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Default route
Route::get('/', function () {
    return view('index');
})->name('login');

// Route::get('/{any}', function () {
//     return view('app'); // Your Vue entry point
// })->where('any', '.*');

// Authentication routes
Route::post('login', [AuthController::class, 'authenticate']);
Route::post('/verify_token', [AuthController::class, 'verifyToken']);
Route::post('/log-out-all', [AuthController::class, 'logoutAllDevices']);
Route::post('/forgot_password', [Controller::class, 'forgetPassword']);
Route::get('password/reset/{token}', [Controller::class, 'showResetForm'])->name('password.reset');
Route::post('/update-password', [Controller::class, 'updatePassword'])->name('password.update');
Route::post('set_device_token', [Controller::class, 'setToken'])->name('setToken');
