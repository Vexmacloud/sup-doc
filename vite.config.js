import { fileURLToPath, URL } from "node:url";

import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from "@vitejs/plugin-vue"

export default defineConfig({
    plugins: [
        laravel({
            input: ['public/splash-screen.css', 'resources/js/main.ts'],
            refresh: true,
        }),
        vue()
    ],
    server: {
        hmr: {
            overlay: false,
        },
    },
    resolve: {
        alias: {
          "vue-i18n": "vue-i18n/dist/vue-i18n.cjs.js",
          "@": fileURLToPath(new URL("./resources/js/", import.meta.url)),
        },
    },
    base: "./",
  build: {
    chunkSizeWarningLimit: 3000,
  },
  env: {
    VITE_APP_API_URL: 'http://127.0.0.1:5173/' // Your API URL here
  }
});
