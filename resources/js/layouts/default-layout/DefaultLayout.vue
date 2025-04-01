<template>
  <!-- begin:: Body -->
  <div class="page d-flex flex-column flex-column-fluid">
    <KTHeader />

    <div id="kt_content_container" class="d-flex flex-column-fluid align-items-stretch" :class="{
      'container-fluid': contentWidthFluid,
      'container-xxl': !contentWidthFluid,
    }">
      <component :is="layoutComponent" />
      <!-- <router-view /> -->
      
    </div>
  </div>
  <!-- end:: Body -->
  <KTScrollTop />
  <KTDrawerMessenger />
  <KTActivityDrawer />
  <KTCreateApp />
  <KTInviteFriendsModal />

  <KTToolButtons />
  <KTHelpDrawer />
</template>

<script lang="ts">
import {
  defineComponent,
  nextTick,
  defineAsyncComponent,
  onBeforeMount,
  onMounted,
  computed,
  watch,
} from "vue";
import { useRoute } from "vue-router";
import KTAside from "@/layouts/default-layout/components/aside/Aside.vue";
import KTSidebar from "@/layouts/default-layout/components/sidebar/Sidebar.vue";
import KTHeader from "@/layouts/default-layout/components/header/Header.vue";
import KTFooter from "@/layouts/default-layout/components/footer/Footer.vue";
import KTScrollTop from "@/layouts/default-layout/components/extras/ScrollTop.vue";
import KTActivityDrawer from "@/layouts/default-layout/components/drawers/ActivityDrawer.vue";
import KTCreateApp from "@/components/modals/wizards/CreateAppModal.vue";
import KTInviteFriendsModal from "@/components/modals/general/InviteFriendsModal.vue";
import KTHelpDrawer from "@/layouts/default-layout/components/extras/HelpDrawer.vue";
import KTToolButtons from "@/layouts/default-layout/components/extras/ToolButtons.vue";
import KTDrawerMessenger from "@/layouts/default-layout/components/extras/MessengerDrawer.vue";
import { reinitializeComponents } from "@/core/plugins/keenthemes";
import {
  asideEnabled,
  contentWidthFluid,
  displaySidebar,
  loaderEnabled,
  loaderLogo,
  subheaderDisplay,
  themeDarkLogo,
  themeLightLogo,
  toolbarDisplay,
} from "@/layouts/default-layout/config/helper";
import LayoutService from "@/core/services/LayoutService";

const layouts = {
  'admin': defineAsyncComponent(() =>import('@/layouts/default-layout/DefaultLayout3.vue')),
  'employee': defineAsyncComponent(() =>import('@/layouts/default-layout/DefaultLayout2.vue')),
  'customer': defineAsyncComponent(() =>import('@/layouts/default-layout/DefaultLayout1.vue')),
}

export default defineComponent({
  name: "default-layout",
  components: {
    KTAside,
    KTSidebar,
    KTHeader,
    KTFooter,
    KTScrollTop,
    KTCreateApp,
    KTInviteFriendsModal,
    KTActivityDrawer,
    KTHelpDrawer,
    KTToolButtons,
    KTDrawerMessenger,
  },
  setup() {
    const route = useRoute();

    const layoutComponent = computed(() => {
      return layouts[route.meta.layout] || layouts.default;
    });
    onBeforeMount(() => {
      LayoutService.init();
    });

    onMounted(() => {
      nextTick(() => {
        reinitializeComponents();
      });
    });

    watch(
      () => route.path,
      () => {
        nextTick(() => {
          reinitializeComponents();
        });
      }
    );

    return {
      layoutComponent,
      toolbarDisplay,
      loaderEnabled,
      contentWidthFluid,
      loaderLogo,
      asideEnabled,
      displaySidebar,
      subheaderDisplay,
      themeLightLogo,
      themeDarkLogo,
    };
  },
});
</script>