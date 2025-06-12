<?php

use App\Http\Controllers\ApiController;
use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Existing route
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Authentication routes using AuthController
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
Route::post('/authenticate', [AuthController::class, 'authenticate']);
Route::post('/verify-token', [AuthController::class, 'verifyToken']);
Route::post('/logout-all-devices', [AuthController::class, 'logoutAllDevices']);

// Existing custom routes
Route::get('/user-details', [ApiController::class, 'userDetails']);

// Client-related routes
Route::post('/add-client', [ApiController::class, 'addClient']);
Route::post('/get-client', [ApiController::class, 'getClient']);
Route::post('/get-notification-list', [ApiController::class, 'getNotificationList']);
Route::post('/mark-all-read', [ApiController::class, 'markAllAsRead']);
Route::post('/clear-all', [ApiController::class, 'clearNotificationList']);
Route::post('/delete-client', [ApiController::class, 'deleteClient']);
Route::post('/edit-client', [ApiController::class, 'editClient']);
Route::post('/edit-chattime', [ApiController::class, 'editChattime']);
Route::get('/all-client', [ApiController::class, 'allClient']);
Route::post('/all-chat-client', [ApiController::class, 'allChatClient']);