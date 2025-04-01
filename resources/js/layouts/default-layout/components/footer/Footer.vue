<template>
  <!--begin::Footer-->
  <div class="footer py-4 d-flex flex-lg-column" id="kt_footer">
    <!--begin::Container-->
    <div
      class="d-flex flex-column flex-md-row align-items-center justify-content-between"
      :class="{
        'container-fluid': footerWidthFluid,
        'container-xxl': !footerWidthFluid,
      }"
      style="margin: 0 auto; max-width: calc(100% - 380px); padding: 0 20px;"
    >
      <!--begin::Copyright-->
      <div class="text-gray-900 order-2 order-md-1">
        <span class="text-muted fw-semibold me-1">2025&copy;</span>
        <a
          href="https://vexmacloud.com/"
          target="_blank"
          class="text-gray-800 text-hover-primary"
          >vexmacloud</a
        >
      </div>
      <!--end::Copyright-->

      <!--begin::Menu-->
      <ul class="menu menu-gray-600 menu-hover-primary fw-semibold order-1 d-flex">
        <li class="menu-item">
          <a href="https://vexmacloud.com/" target="_blank" class="menu-link px-2">About</a>
        </li>

        <li class="menu-item">
          <a href="https://vexmacloud.com" target="_blank" class="menu-link px-2">Support</a>
        </li>

        <li class="menu-item">
          <a href="https://vexmacloud.com/pricing" target="_blank" class="menu-link px-2">Purchase</a>
        </li>
      </ul>
      <!--end::Menu-->
    </div>
    <!--end::Container-->
  </div>
  <!--end::Footer-->
</template>

<script lang="ts">
import { defineComponent } from "vue";
import { footerWidthFluid } from "@/layouts/default-layout/config/helper";

export default defineComponent({
  name: "KTFooter",
  setup() {
    return {
      footerWidthFluid,
    };
  },
});
</script>
