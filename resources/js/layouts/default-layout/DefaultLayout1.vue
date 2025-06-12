<template>
  <div>
    <Aside1 />
      <div
        id="kt_wrapper"
        class="wrapper d-flex flex-column flex-row-fluid mt-5 mt-lg-10"
      >
        <div class="content flex-column-fluid" id="kt_content">
          <div id="kt_post" class="post">
            <router-view />
          </div>
        </div>
        <KTFooter />
      </div>
  </div>
</template>
<script lang="ts" setup>
import Aside1 from "@/layouts/default-layout/components/aside/Aside1.vue";
</script>