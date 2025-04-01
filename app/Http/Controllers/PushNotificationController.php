<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Services\ApiService;
use App\Services\ValidationService;
use Illuminate\Http\Request;
use Notification;
use App\Notifications\SendPushNotification;
use App\Models\User;
use App\Models\UserNotification;
use Kutia\Larafirebase\Facades\Larafirebase;

class PushNotificationController extends Controller
{

    public $apiService;

    public $validationService;

    public function __construct()
    {
        $this->apiService = new ApiService();
        $this->validationService = new ValidationService();
    }

    public function updateToken(Request $request){
        try{
            $user = auth('sanctum')->user()->update(['fcm_token'=> $request->token]);
            return response()->json([
                'success'=>true
            ]);
        }catch(\Exception $e){
            report($e);
            return response()->json([
                'success'=>false
            ],500);
        }
    }

    public function notification(Request $request){
        $request->validate([
            'title'=>'required',
            'message'=>'required'
        ]);
        try{
            $fcmTokens = User::whereNotNull('fcm_token')->pluck('fcm_token')->toArray();
            if($request->recv_id){
                $fcmTokens = User::where('uuid', $request->recv_id)->first()->whereNotNull('fcm_token')->pluck('fcm_token')->toArray();
                // $fcmTokens = $request->recv_id;
            }
            elseif ($request->receiver_id === 'admin') {
                // If receiver is admin, fetch FCM tokens of users with admin role
                $adminUUID = Role::where('role', 'admin')->pluck('uuid')->first();
                if ($adminUUID) {
                    $fcmTokens = User::where('role_uuid', $adminUUID)
                        ->whereNotNull('fcm_token')
                        ->pluck('fcm_token')
                        ->toArray();
                }
             }
           
       
          
            $this->addNotification($request->sender_id, $request->receiver_id, $request->message, $request->type, isset($request->order_id) ? $request->order_id : null,  isset($request->inquiry_id) ? $request->inquiry_id : null,  isset($request->quotation_id) ? $request->quotation_id : null);
           
    
            Larafirebase::withTitle($request->title)
                ->withBody($request->message)
                ->sendMessage($fcmTokens);
    
                return response()->json([
                    'success'=>true
                ]);
    
        }catch(\Exception $e){
            dd($e);
            return response()->json([
                'success'=>false
            ]);
        }
    }



    public function notification2(Request $request){
        $request->validate([
            'title'=>'required',
            'message'=>'required'
        ]);
        try{
            $fcmTokens = User::whereNotNull('fcm_token')->pluck('fcm_token')->toArray();
            if($request->recv_id){
                $fcmTokens = User::where('uuid', $request->recv_id)->first()->whereNotNull('fcm_token')->pluck('fcm_token')->toArray();
                // $fcmTokens = $request->recv_id;
            }
            elseif ($request->receiver_id === 'employee') {
                // If receiver is admin, fetch FCM tokens of users with admin role
                $adminUUID = Role::where('role', 'employee')->pluck('uuid')->first();
                if ($adminUUID) {
                    $fcmTokens = User::where('role_uuid', $adminUUID)
                        ->whereNotNull('fcm_token')
                        ->pluck('fcm_token')
                        ->toArray();
                }
             }
           
       
          
            $this->addNotification2($request->sender_id, $request->receiver_id, $request->message, $request->type, isset($request->order_id) ? $request->order_id : null,  isset($request->inquiry_id) ? $request->inquiry_id : null,  isset($request->quotation_id) ? $request->quotation_id : null);
           
    
            Larafirebase::withTitle($request->title)
                ->withBody($request->message)
                ->sendMessage($fcmTokens);
    
                return response()->json([
                    'success'=>true
                ]);
    
        }catch(\Exception $e){
            dd($e);
            return response()->json([
                'success'=>false
            ]);
        }
    }




    public function notification1(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'message' => 'required'
        ]);
    
        try {
            $fcmTokens = User::whereNotNull('fcm_token');
    
            if ($request->recv_id) {
                $fcmTokens = $fcmTokens->where('uuid', $request->recv_id);
            } elseif (strcasecmp($request->receiver_id, 'client') === 0) {
                // If receiver is client, fetch FCM tokens of users with client role
                $clientUUIDs = Role::where('role', 'client')->pluck('uuid');
                $fcmTokens = $fcmTokens->whereIn('role_uuid', $clientUUIDs);
            }
    
            $fcmTokens = $fcmTokens->pluck('fcm_token')->toArray();
    
            $this->addNotification1(
                $request->sender_id,
                $request->receiver_id,
                $request->message,
                $request->type,
                $request->order_id ?? null,
                $request->inquiry_id ?? null,
                $request->quotation_id ?? null
            );
    
            Larafirebase::withTitle($request->title)
                ->withBody($request->message)
                ->sendMessage($fcmTokens);
    
            return response()->json(['success' => true]);
        } catch (\Exception $e) {
            // Handle exception
            dd($e);
            return response()->json(['success' => false]);
        }
    }
    

    public function addNotification($senderId, $receiverId, $message, $type, $orderId=null, $inquiryId = null, $quotationId = null)
    {
        $notification = new UserNotification();
        $notification->sender_id = $senderId;
        if($orderId){
            $notification->order_id = $orderId;
        }
        if($inquiryId){
            $notification->inquiry_id = $inquiryId;
        }
       
        if($quotationId){
            $notification->quotation_id = $quotationId;
        }
        if($senderId != null){
            $notification->sender_id = $senderId;
        } else {
            $clients = User::whereHas('role', function ($query) {
                $query->where('role', 'Admin');
            })->first();
            $notification->sender_id = $clients->uuid;
        }
        if($receiverId != null && $receiverId !== 'admin'){
            $notification->receiver_id = $receiverId;
        } else {
            $clients = User::whereHas('role', function ($query) {
                $query->where('role', 'Admin');
            })->first();
            $notification->receiver_id = $clients->uuid;
        }
        $notification->message = $message;
        $notification->type = $type;
        $notification->save();
    
        return $notification;
    }

    
    public function addNotification1($senderId, $receiverId, $message, $type, $orderId = null, $inquiryId = null, $quotationId = null)
    {
        $notification = new UserNotification();
        $notification->sender_id = $senderId;
    
        if ($orderId) {
            $notification->order_id = $orderId;
        }
    
        if ($inquiryId) {
            $notification->inquiry_id = $inquiryId;
        }
        
        if ($quotationId) {
            $notification->quotation_id = $quotationId;
        }
    
       
        if ($senderId != null) {
            $notification->sender_id = $senderId;
        } else {
            // Fetch client user based on specific criteria
            $client = User::whereHas('role', function ($query) {
                $query->where('role', 'Client');
            })->first();
            $notification->sender_id = $client->uuid;
        }
    
        if ($receiverId != null && $receiverId !== 'client') {
            $notification->receiver_id = $receiverId;
        } else {
            // Fetch admin user based on specific criteria
            $admin = User::whereHas('role', function ($query) {
                $query->where('role', 'Admin');
            })->first();
            $notification->receiver_id = $admin->uuid;
        }
    
        $notification->message = $message;
        $notification->type = $type;
        $notification->save();
    
        return $notification;
    }
    
    public function addNotification2($senderId, $receiverId, $message, $type, $orderId = null, $inquiryId = null, $quotationId = null)
{
    $notification = new UserNotification();
    $notification->sender_id = $senderId;

    if ($orderId) {
        $notification->order_id = $orderId;
    }

    if ($inquiryId) {
        $notification->inquiry_id = $inquiryId;
    }
    
    if ($quotationId) {
        $notification->quotation_id = $quotationId;
    }

    if ($senderId == null) {
        // Fetch employee user based on specific criteria
        $employee = User::whereHas('role', function ($query) {
            $query->where('role', 'Employee');
        })->first();
        if ($employee) {
            $notification->sender_id = $employee->uuid;
        } else {
            // Handle the case where no employee is found
            // For now, let's set sender_id to a default value or null
            $notification->sender_id = null;
        }
    }

    if ($receiverId != null && $receiverId !== 'employee') {
        $notification->receiver_id = $receiverId;
    } else {
        // Fetch admin user based on specific criteria
        $admin = User::whereHas('role', function ($query) {
            $query->where('role', 'Admin');
        })->first();
        
        if ($admin) {
            $notification->receiver_id = $admin->uuid;
        } else {
            // Fetch client user based on specific criteria
            $client = User::whereHas('role', function ($query) {
                $query->where('role', 'Client');
            })->first();
            
            if ($client) {
                $notification->receiver_id = $client->uuid;
            } else {
                // Handle the case where neither admin nor client is found
                // For now, let's set receiver_id to a default value or null
                $notification->receiver_id = null;
            }
        }
    }

    $notification->message = $message;
    $notification->type = $type;
    $notification->save();

    return $notification;
}

    
}

