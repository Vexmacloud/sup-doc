<template>






</template>




<script lang="ts">
import { defineComponent, onMounted, onUnmounted } from "vue";
import Questions from "@/components/devs/Questions.vue";
import LayoutService from "@/core/services/LayoutService";
import { LS_CONFIG_NAME_KEY } from "@/stores/config";

export default defineComponent({
  name: "dev-tag",
  components: { Questions },
  setup() {
    onMounted(() => {
      if (!localStorage.getItem(LS_CONFIG_NAME_KEY)) {
        LayoutService.enableSidebar();
      }
    });
    onUnmounted(() => {
      if (!localStorage.getItem(LS_CONFIG_NAME_KEY)) {
        LayoutService.disableSidebar();
      }
    });
  },
});
</script>

<style scoped>
:root {
  /* Font Families */
  --font-quicksand: 'Quicksand', sans-serif; /* Headings */
  --font-nunito-sans: 'Nunito Sans', sans-serif; /* Subheadings */
  --font-nunito: 'Nunito', sans-serif; /* Normal text */

  /* Colours */
  --color-primary: #2667FF;
  --color-secondary: #0B1460;
  --color-tertiary: #6EF1B2;
  --color-body: #5C6185;
  --color-white: #fafafa;
  --color-black: #000000;
  --color-off-white: #F6F9FB;
  --color-primary-5: rgb(175, 199, 255);
  --color-primary-7: rgba(38, 103, 255, 0.07);
  --color-primary-10: rgba(38, 103, 255, 0.1);
  --color-secondary-10: rgba(11, 20, 96, 0.1);
  --color-white-10: rgba(255, 255, 255, 0.1);
  --color-white-60: rgba(255, 255, 255, 0.6);
  --color-white-70: rgba(255, 255, 255, 0.7);
  --color-dark: #151516;
  --color-deep-dark: #0B0B0B;
}

@media (max-width: 768px) {
  .onboarding-container {
    padding: 2rem 1rem;
  }
  h1 {
    font-size: 24px !important;
  }
  h2 {
    font-size: 20px !important;
  }
  p,
  ol {
    font-size: 14px !important;
  }
  img,
  iframe {
    max-width: 100% !important;
  }
}

img:hover,
iframe:hover {
  transform: scale(1.02);
  transition: transform 0.3s ease;
  backface-visibility: hidden;
  will-change: transform;
}

.header-divider {
  width: 60px;
  height: 4px;
  background: linear-gradient(90deg, var(--color-secondary), var(--color-tertiary));
  margin: 0.5rem auto 1.5rem;
  border-radius: 2px;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
