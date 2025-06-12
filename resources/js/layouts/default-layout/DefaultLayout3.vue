<template>
    <div>
        <KTAside  v-if="asideEnabled"/>
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
        <!-- <KTAside/>
        <div id="kt_wrapper" class="wrapper d-flex flex-column flex-row-fluid mt-5 mt-lg-10">
            <div class="content flex-column-fluid" id="kt_content">
                <div id="kt_post" class="post">
                    <
                </div>
            </div>
        </div> -->
    </div>
</template>
<script lang="ts" setup>
import {asideEnabled} from "@/layouts/default-layout/config/helper";
import KTAside from "@/layouts/default-layout/components/aside/Aside.vue";
</script>