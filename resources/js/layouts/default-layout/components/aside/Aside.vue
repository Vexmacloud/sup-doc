<template>
  <!--begin::Aside-->
  <div
    id="kt_aside"
    class="aside"
    data-kt-drawer="true"
    data-kt-drawer-name="aside"
    data-kt-drawer-activate="{default: true, lg: false}"
    data-kt-drawer-overlay="true"
    data-kt-drawer-width="{default:'200px', '300px': '225px'}"
    data-kt-drawer-direction="start"
    data-kt-drawer-toggle="#kt_aside_toggle"
  >
    <!--begin::Aside nav-->
    <div
      class="hover-scroll-overlay-y my-5 my-lg-5 w-100 ps-4 ps-lg-0 pe-4 me-1"
      id="kt_aside_menu_wrapper"
      data-kt-scroll="true"
      data-kt-scroll-activate="{default: false, lg: true}"
      data-kt-scroll-height="auto"
      data-kt-scroll-dependencies="#kt_header"
      data-kt-scroll-wrappers="#kt_aside"
      data-kt-scroll-offset="5px"
    >
      
      <!--begin::Menu-->
      <div
        class="menu menu-column menu-active-bg menu-hover-bg menu-title-gray-700 fs-6 menu-rounded w-100"
        id="#kt_aside_menu"
        data-kt-menu="true"
      >
        <!-- Admin Menu Items -->
        <div v-if="currentRole === 'admin'">
          <!--begin::Heading-->
          <div class="menu-item">
            <div class="menu-content pb-2">
              <span class="menu-section text-muted text-uppercase fs-7 fw-bold"
                >Getting Started</span
              >
            </div>
          </div>
          <!--end::Heading-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/introduction"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Introduction</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/activation"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Activation</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/company-setup"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Company Setup</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/updates"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Updates</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <!--begin::Menu item-->
          <!-- <div class="menu-item">
            <router-link
              to="/admin/devs/problems"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Problems</span>
            </router-link>
          </div> -->
          <!--end::Menu item-->

          <!--begin::Heading-->
          <div class="menu-item pt-5">
            <div class="menu-content pb-2">
              <span class="menu-section text-muted text-uppercase fs-7 fw-bold"
                >Sales CRM</span
              >
            </div>
          </div>
          <!--end::Heading-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/inquiry"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Inquiry</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/quotation"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Quotation</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/order"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Order</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <div class="menu-item">
            <router-link
              to="/admin/devs/Invoice"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Invoice</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <!--begin::Heading-->
          <div class="menu-item pt-5">
            <div class="menu-content pb-2">
              <span class="menu-section text-muted text-uppercase fs-7 fw-bold"
                >Production Module</span
              >
            </div>
          </div>
          <!--end::Heading-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/machine"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Machine</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/orderBatchPlan"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Order Batch Plan</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/production"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Planning</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/workflow"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Workflow</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/operations"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Operations</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/attributes"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Attributes</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/qualityCheck"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Quality Check</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/jobCard"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Job Card</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <!--begin::Heading-->
          <div class="menu-item pt-5">
            <div class="menu-content pb-2">
              <span class="menu-section text-muted text-uppercase fs-7 fw-bold"
                >Inventory</span
              >
            </div>
          </div>
          <!--end::Heading-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/purchaseReq"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Purchase Request</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/purchaseOrd"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Purchase Order</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/inwardQc"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Inward QC</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <!--begin::Heading-->
          <div class="menu-item pt-5">
            <div class="menu-content pb-2">
              <span class="menu-section text-muted text-uppercase fs-7 fw-bold"
                >Marketing</span
              >
            </div>
          </div>
          <!--end::Heading-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/deal"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Deal</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/admin/devs/knowledge"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Knowledge Center</span>
            </router-link>
          </div>
          <!--end::Menu item-->
        </div>
      </div>
      <!--end::Menu-->
    </div>
    <!--end::Aside nav-->
  </div>
  <!--end::Aside-->
</template>

<script lang="ts">
import { getAssetPath } from "@/core/helpers/assets";
import { defineComponent, ref, inject } from "vue";
import { useI18n } from "vue-i18n";


export default defineComponent({
  name: "KTAside",
  components: {},
  setup() {
    const { t } = useI18n();
    
    // Get the current role from a global state
    const currentRole = inject('currentRole', ref('admin'));
  
 
    return {
      t,
      getAssetPath,
      currentRole
    };
  },
});
</script>
