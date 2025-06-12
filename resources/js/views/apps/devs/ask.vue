<template>
  <div>
    <h1>Explore Developer Tags</h1>
    <p>
      Find discussions, questions, and solutions related to various development technologies.
      Browse through different tags to explore trending topics and best practices.
    </p>

    <div class="tags">
      <div class="tag">
        <h3>Vue.js</h3>
        <p>Join the conversation about Vue.js, its ecosystem, and best development practices.</p>
      </div>

      <div class="tag">
        <h3>JavaScript</h3>
        <p>Stay updated with JavaScript trends, coding tips, and framework comparisons.</p>
      </div>

      <div class="tag">
        <h3>Metronic</h3>
        <p>Find support and share insights about the Metronic UI framework.</p>
      </div>

      <div class="tag">
        <h3>Laravel</h3>
        <p>Discuss Laravel’s latest features, best practices, and real-world applications.</p>
      </div>

      <div class="tag">
        <h3>React.js</h3>
        <p>Engage in discussions about React.js, hooks, state management, and performance optimization.</p>
      </div>
    </div>

    <!-- Questions Component (If Needed) -->
    <!-- <Questions /> -->
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
