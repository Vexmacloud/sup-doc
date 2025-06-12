<template>
  <!-- Company Setup Page (Inline CSS for Documentation-Style Layout) -->
  <div style="width: 80%; margin: 0 auto; padding: 20px; font-family: var(--font-nunito); color: var(--color-body);">
    <!-- Main Heading -->
    <h1 style="font-family: var(--font-quicksand); color: var(--color-secondary); margin-bottom: 1rem;">
      Company Setup User Onboarding
    </h1>

    <!-- Intro Paragraph -->
    <p style="line-height: 1.6; margin-bottom: 1.5rem;">
      Add the required information in the app step-by-step by following the visual guide shown below.
      Once the information is set, the app will take you to the dashboard screen.
    </p>

    <!-- Step 1 -->
<h2
  style="
    font-family: var(--font-nunito);
    color: var(--color-secondary);
    margin-top: 2rem;
    font-size: 1.4rem;
  "
>
  Step 1
</h2>
<img
  src="/images/Step 1.PNG"
  alt="Step 1"
  style="
    display: block;
    max-width: 100%;
    height: auto;
    margin-bottom: 1rem;
  "
/>
<p
  style="
    
    font-family: var(--font-nunito);
    line-height: 1.8;
    margin-bottom: 5rem;
    font-size: 1.2rem;
    color: var(--color-white);
  "
>
  Provide your company details (Name, Email, Contact) in the setup form. 
  This initial step ensures you have a unique identity on the platform.
</p>
    <!-- Step 2 -->
    <h2 style="font-family: var(--font-nunito-sans); color: var(--color-secondary); margin-top: 2rem;">
      Step 2
    </h2>
    <img
      src="/images/Step 2.PNG"
      alt="Step 2"
      style="display: block; max-width: 100%; height: auto; margin-bottom: 1rem;"
    />
    <p style="line-height: 2; margin-bottom: 2rem;">
      Check your email for a verification link or code. Verifying your email address allows you to
      securely access all admin features and notifications.
    </p>

    <!-- Step 3 -->
    <h2 style="font-family: var(--font-nunito-sans); color: var(--color-secondary); margin-top: 2rem;">
      Step 3
    </h2>
    <img
      src="/images/Step 3.PNG"
      alt="Step 3"
      style="display: block; max-width: 100%; height: auto; margin-bottom: 1rem;"
    />
    <p style="line-height: 1.6; margin-bottom: 1.5rem;">
      Complete any mandatory fields such as business address, tax information, or
      any additional details required for your specific industry.
    </p>

    <!-- Step 4 -->
    <h2 style="font-family: var(--font-nunito-sans); color: var(--color-secondary); margin-top: 2rem;">
      Step 4
    </h2>
    <img
      src="/images/Step 4.PNG" 
      alt="Step 4"
      style="display: block; max-width: 100%; height: auto; margin-bottom: 1rem;"
    />
    <p style="line-height: 1.6; margin-bottom: 1.5rem;">
      Configure your default settings (e.g., currency, time zone, language) to match
      your business preferences. These will be applied across your entire account.
    </p>

    <!-- Step 5 -->
    <h2 style="font-family: var(--font-nunito-sans); color: var(--color-secondary); margin-top: 2rem;">
      Step 5
    </h2>
    <img
      src="/images/Step 5.PNG"
      alt="Step 5"
      style="display: block; max-width: 100%; height: auto; margin-bottom: 1rem;"
    />
    <p style="line-height: 1.6; margin-bottom: 1.5rem;">
      Finalize your setup and submit. After successful completion, you’ll be redirected
      to the Admin Dashboard where you can manage employees, customers, and more.
    </p>
  </div>
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
.tags {
  margin-top: 20px;
}

.tag {
  background: #f8f9fa;
  padding: 15px;
  margin-bottom: 10px;
  border-radius: 5px;
}

h3 {
  margin: 0;
  color: #007bff;
}

p {
  margin-top: 5px;
  font-size: 0.9em;
  color: gray;
}
</style>
