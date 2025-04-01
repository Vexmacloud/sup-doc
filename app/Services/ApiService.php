<?php

namespace App\Services;

use App\Models\User;
use App\Models\UserNotification;
use Illuminate\Support\Facades\Hash;
use App\Mail\SendCredentialsMail;
use App\Mail\SendWelcomUserMail;
use App\Http\Resources\UserResource;
use App\Http\Resources\UserNotificationResource;
class ApiService
{

    public function addClient($request)
    {

        $role = findRole('Client');
        if (!$role['success']) {
            return $role;
        }


        $user = $role['data']->users()->create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'mobile' => $request->mobile,
            'salesperson_bde' => $request->salesperson_bde,
            'company' => $request->company,
            'reference' => $request->reference,
            'alt_mobile' => $request->alt_mobile,
            'address' => $request->address,
            'gst' => $request->gst,
            'shopping_address' => $request->shopping_address,

        ]);

        $welcomeMail = new SendWelcomUserMail($user->email, $request->password, $request->name);
        // Mail::to($user->email)->send($welcomeMail);

        $sendMail = new SendCredentialsMail($user->email, $request->password, $request->name);
        // Mail::to($user->email)->send($sendMail);
        $lastSpacePosition = strrpos($request->name, ' ');


        return [
            'success' => true,
            'message' => 'Users Details',
            'data' => new UserResource($user),
        ];
    }

    public function getClient($request)
    {

        $data = findUser($request->user_uuid);
        if (!$data['success']) {
            return $data;
        }
        return [
            'success' => true,
            'message' => 'User Details',
            'data' => new UserResource($data['data'])
        ];
    }

    public function deleteClient($request)
    {

        $data = findUser($request->user_uuid);
        if (!$data['success']) {
            return $data;
        }

        $data['data']->delete();

        return [
            'success' => true,
            'message' => 'User Deleted Successfully'
        ];
    }

    public function editClient($request)
    {

        $data = findUser($request->user_uuid);
        if (!$data['success']) {
            return $data;
        }

        if ($request->has('name')) {
            $data['data']->name = $request->name;
        }
        if ($request->has('mobile')) {
            $data['data']->mobile = $request->mobile;
        }
        if ($request->has('alt_mobile')) {
            $data['data']->alt_mobile = $request->alt_mobile;
        }

        if ($request->has('reference')) {
            $data['data']->reference = $request->reference;
        }

        if ($request->has('gst')) {
            $data['data']->gst = $request->gst;
        }
        if ($request->has('shopping_address')) {
            $data['data']->shopping_address = $request->shopping_address;
        }

        if ($request->has('company')) {
            $data['data']->company = $request->company;
        }
        if ($request->has('address')) {
            $data['data']->address = $request->address;
        }
        if ($request->has('salesperson_bde')) {
            $data['data']->salesperson_bde = $request->salesperson_bde;
        }
        if ($request->has('password')) {
            $data['data']->password = Hash::make($request->password);
        }
        if ($request->has('email')) {
            $data['data']->email = $request->email;
        }

        return [
            'success' => true,
            'message' => 'Profile Updated Successfully',
            'data' => new UserResource($data['data']),
        ];
    }
    public function editChattime($id, $time)
    {
        $user = User::where('uuid', $id)->first();

        if (!$user) {
            return response(['success' => false, 'message' => 'User not found'], 404);
        }

        $user->recent_chat_time = $time;
        $user->save();

        return response(['success' => true, 'message' => 'Chat time updated successfully', 'data' => new UserResource($user)]);
    }
    public function allClient()
    {

        $clients = User::whereHas('role', function ($query) {
            $query->where('role', 'Client');
        })->orderBy('created_at', 'desc')->get();

        $clientsByMonth = $clients->groupBy(function ($clients) {
            return $clients->created_at->format('Y-m');
        })->map(function ($clients) {
            return $clients->count();
        });
        $newclientsByMonth = $clients->groupBy(function ($clients) {
            return $clients->created_at->format('Y-m');
        })->map(function ($clients) {
            return $clients->count();
        });
        if ($clients->count() == 0) {
            return ['success' => false, 'message' => 'Users Not Found'];
        }

        return [
            'success' => true,
            'message' => 'Users List',
            'data' => UserResource::collection($clients),
            'client_by_month' => $clientsByMonth->all(),
            'new_client_by_month' => $newclientsByMonth->all()
        ];
    }
    public function allChatClient()
    {

        $clients = User::whereHas('role', function ($query) {
            $query->where('role', 'Client');
        })->orderBy('recent_chat_time', 'desc')->get();

        if ($clients->count() == 0) {
            return ['success' => false, 'message' => 'Users Not Found'];
        }

        return [
            'success' => true,
            'message' => 'Users List',
            'data' => UserResource::collection($clients)
        ];
    }
    public function getNotificationList($receiverId)
    {
        $notifications = UserNotification::where('receiver_id', $receiverId)->where('is_read', false)->get();
        foreach ($notifications as $notification) {
            $sender = User::where('uuid', $notification->sender_id)->first();
            if ($sender) {
                $notification->sender_name = $sender->name;
                $notification->sender_role = $sender->role;
            } else {
                $notification->sender_name = 'Unknown';
            }
        }
        return $notifications;
    }
    public function clearNotificationList($receiver_id)
    {
        $notifications = UserNotification::where('receiver_id', $receiver_id)->where('is_read', false);
        if ($notifications->count() == 0) {
            return [
                'success' => false,
                'message' => 'No Notification Found'
            ];
        }

        try {
            $notifications->update(['is_read' => true]);
            return [
                'success' => true,
                'message' => 'Cleared All Notification',
            ];
        } catch (\Exception $e) {
            return [
                'success' => false,
                'message' => 'Error clearing notifications: ' . $e->getMessage()
            ];
        }
    }
    public function markAllAsRead($senderId, $receiverId, $type = null, $orderId = null, $inquiryId = null, $quotationId = null)
    {
        $query = UserNotification::where('receiver_id', $receiverId)->where('sender_id', $senderId);

        if ($type !== null) {
            $query->where('type', $type);
        }


        if ($orderId !== null) {
            $query->where('order_id', $orderId);
        }

        if ($inquiryId !== null) {
            $query->orWhere('inquiry_id', $inquiryId);
        }
        if ($quotationId !== null) {
            $query->orWhere('quotation_id', $quotationId);
        }
        $notifications = $query->get();

        foreach ($notifications as $notification) {
            $notification->is_read = true;
            $notification->save();
        }

        return response()->json(['message' => 'All notifications marked as read for the receiver.']);
    }
}
