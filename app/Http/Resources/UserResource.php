<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        if (isset($this->department->name)) {
            $department_name = $this->department->name;
        } else {
            $department_name = '';
        }
        if (isset($this->designation->name)) {
            $designation_name = $this->designation->name;
        } else {
            $designation_name = '';
        }
        return [
            'id' => $this->id,
            'uuid' => $this->uuid,
            'name' => $this->name,
            'mobile' => $this->mobile,
            'alt_mobile' => $this->alt_mobile,
            'email' => $this->email,
            'company' => $this->company,
            'gst' => $this->gst,
            'salesperson_bde' => $this->salesperson_bde,
            'reference' => $this->reference,
            'shopping_address' => $this->shopping_address,
            'address' => $this->address,
            // 'designation'=>new DesignationResource($this->designation),
            'designation_uuid' => $this->designation_uuid,
            'department_uuid' => $this->department_uuid,
            'department' => $department_name,
            'designation' => $designation_name,
            'role' => new RoleResource($this->role),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'assigned_to' => $this->assigned_to,
            'account_status' => $this->account_status,
            'tour_status' => $this->tour_status
        ];
    }
}
