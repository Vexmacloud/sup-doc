import { ref, onMounted } from "vue";
import { defineStore } from "pinia";
import { ThemeModeComponent } from "@/assets/ts/layout";

export const THEME_MODE_LS_KEY = "kt_theme_mode_value";
export const THEME_MENU_MODE_LS_KEY = "kt_theme_mode_menu";

export const useThemeStore = defineStore("theme", () => {
  const mode = ref<"light">("light");

  function applyTheme() {
    document.documentElement.setAttribute("data-bs-theme", "light");
    localStorage.setItem(THEME_MODE_LS_KEY, "light");
    localStorage.setItem(THEME_MENU_MODE_LS_KEY, "light");
    ThemeModeComponent.init();
  }

  function setThemeMode() {
    applyTheme();
  }

  // Always apply light theme on mount
  onMounted(() => {
    applyTheme();
  });

  return {
    mode,
    setThemeMode,
  };
});