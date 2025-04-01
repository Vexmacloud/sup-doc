<?php

namespace App\Http\Controllers;

use App\Services\ApiService;
use App\Services\ValidationService;
use Illuminate\Http\Request;

class ApiController extends Controller
{

    public $apiService;

    public $validationService;

    public function __construct()
    {
        $this->apiService = new ApiService();
        $this->validationService = new ValidationService();
    }

    public function addClient(Request $request)
    {

        $data = $this->validationService->addClient($request);
        if (!$data['success']) {
            return response()->json($data);
        }

        $response = $this->apiService->addClient($request);

        return response()->json($response);
    }

    public function getClient(Request $request)
    {

        $data = $this->validationService->userUUIDValidation($request);
        if (!$data['success']) {
            return response()->json($data);
        }

        $response = $this->apiService->getClient($request);
        return response()->json($response);
    }
    public function getNotificationList(Request $request)
    {
        $response = $this->apiService->getNotificationList($request->id);
        return response()->json($response);
    }
    public function clearNotificationList(Request $request)
    {
        $response = $this->apiService->clearNotificationList($request->receiver_id);
        return response()->json($response);
    }
    public function markAllAsRead(Request $request)
    {
        $response = $this->apiService->markAllAsRead($request->id, $request->receiver_id,  isset($request->type) ? $request->type : null, isset($request->order_id) ? $request->order_id : null);
        return response()->json($response);
    }

    public function deleteClient(Request $request)
    {

        $data = $this->validationService->userUUIDValidation($request);
        if (!$data['success']) {
            return response()->json($data);
        }
        $response = $this->apiService->deleteClient($request);
        return response()->json($response);
    }

    public function editClient(Request $request)
    {

        // dd($request->all());
        $data = $this->validationService->editClient($request);
        if (!$data['success']) {
            return response()->json($data);
        }
        $response = $this->apiService->editClient($request);
        return response()->json($response);
    }
    public function editChattime(Request $request)
    {
        $response = $this->apiService->editChattime($request->id, $request->time);
        return response()->json($response);
    }
    public function allClient()
    {
        $response = $this->apiService->allClient();
        return response()->json($response);
    }
}
