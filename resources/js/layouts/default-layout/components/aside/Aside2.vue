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

        <!-- Employee Menu Items -->
        <div >
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
              to="/employee/devs/introduction"
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
              to="/employee/devs/activation"
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
              to="/employee/devs/updates"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Updates</span>
            </router-link>
          </div>
          <!--end::Menu item-->

         
           <!--begin::Menu item-->
           <div class="menu-item">
            <router-link
              to="/employee/devs/problems"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Problems</span>
            </router-link>
          </div>
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
              to="/employee/devs/customer"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Customer</span>
            </router-link>
          </div>
          <!--end::Menu item-->

          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/employee/devs/inquiry"
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
              to="/employee/devs/quotation"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Quotation</span>
            </router-link>
          </div>
          <!--end::Menu item-->
           <!--begin::Menu item-->
           <div class="menu-item">
            <router-link
              to="/employee/devs/order"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Order</span>
            </router-link>
          </div>
          <!--end::Menu item-->
           <!--begin::Menu item-->
           <div class="menu-item">
            <router-link
              to="/employee/devs/invoice"
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
                >MES</span
              >
            </div>
          </div>
          <!--end::Heading-->
          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/employee/devs/machine"
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
              to="/employee/devs/orderBatchPlan"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Order Batch Plan</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/employee/devs/production"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Production</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/employee/devs/workflow"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Workflow</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/employee/devs/operations"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Operations</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/employee/devs/attributes"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Attributes</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/employee/devs/qualityCheck"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Quality Check</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/employee/devs/jobCard"
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
              to="/employee/devs/purchasereq"
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
              to="/employee/devs/purchaseorder"
              active-class="active"
              class="menu-link"
            >
              <span class="menu-title">Purchase Order</span>
            </router-link>
          </div>
          <!--end::Menu item-->
          <!--begin::Menu item-->
          <div class="menu-item">
            <router-link
              to="/employee/devs/inwardqc"
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
              to="/employee/devs/deal"
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
              to="/employee/devs/knowledge"
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
    return {
      t,
      getAssetPath,
    };
  },
});
</script>