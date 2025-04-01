// src/stores/userRole.ts
import { defineStore } from 'pinia';

export const useUserRoleStore = defineStore('userRole', {
  state: () => ({
    currentRole: 'admin' as 'admin' | 'employee' | 'customer'
  }),
  actions: {
    setRole(role: 'admin' | 'employee' | 'customer') {
      this.currentRole = role;
    }
  }
});