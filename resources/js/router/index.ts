import {
  createRouter,
  createWebHashHistory,
  type RouteRecordRaw,
} from "vue-router";
import { useAuthStore } from "@/stores/auth";
import { useConfigStore } from "@/stores/config";




const routes: Array<RouteRecordRaw> = [
  {
    path: "/",
    redirect: "/admin/devs/introduction",
    component: () => import("@/layouts/default-layout/DefaultLayout.vue"),
    // meta: {
    //   middleware: "auth",
    // },
    children: [
      {
        path: "/admin/devs",
        name: "admin",
        // component: () => import("@/layouts/default-layout/DefaultLayout3.vue"),
        component: () => import("@/layouts/default-layout/DefaultLayout.vue"),
        meta: { layout: 'admin' },
        children: [
          {
            path: "updates",
            name: "admin-devs-updates",
            component: () => import("@/views/apps/devs/Updates.vue"),
            meta: { pageTitle: "Updates" },
          },
          {
            path: "question",
            name: "admin-devs-question",
            component: () => import("@/views/apps/devs/Question.vue"),
            meta: { pageTitle: "Question" },
          },
          {
            path: "activation",
            name: "admin-devs-activation",
            component: () => import("@/views/apps/devs/Activation.vue"),
            meta: { pageTitle: "Activation" },
          },
          {
            path: "introduction",
            name: "admin-devs-introduction",
            component: () => import("@/views/apps/devs/Introduction.vue"),
            meta: { pageTitle: "Introduction" },
          },
          {
            path: "company-setup",
            name: "admin-devs-company-setup",
            component: () => import("@/views/apps/devs/Companysetup.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "inquiry",
            name: "admin-devs-inquiry",
            component: () => import("@/views/apps/devs/Inquiry.vue"),
            meta: { pageTitle: "Inquiry" },
          },
          {
            path: "quotation",
            name: "admin-devs-quotation",
            component: () => import("@/views/apps/devs/Quotation.vue"),
            meta: { pageTitle: "Quotation" },
          },
          {
            path: "order",
            name: "admin-devs-order",
            component: () => import("@/views/apps/devs/Order.vue"),
            meta: { pageTitle: "Order" },
          },
          {
            path: "machine",
            name: "admin-devs-machine",
            component: () => import("@/views/apps/devs/Machine.vue"),
            meta: { pageTitle: "Machine" },
          },
          {
            path: "orderBatchPlan",
            name: "admin-devs-orderBatchPlan",
            component: () => import("@/views/apps/devs/OrderBatchPlan.vue"),
            meta: { pageTitle: "Order Batch Plan" },
          },
          {
            path: "production",
            name: "admin-devs-production",
            component: () => import("@/views/apps/devs/Production.vue"),
            meta: { pageTitle: "Production" },
          },
          {
            path: "workflow",
            name: "admin-devs-workflow",
            component: () => import("@/views/apps/devs/Workflow.vue"),
            meta: { pageTitle: "Workflow" },
          },
          {
            path: "operations",
            name: "admin-devs-operations",
            component: () => import("@/views/apps/devs/Operations.vue"),
            meta: { pageTitle: "Operations" },
          },
          {
            path: "attributes",
            name: "admin-devs-attributes",
            component: () => import("@/views/apps/devs/Attributes.vue"),
            meta: { pageTitle: "Attributes" },
          },
          {
            path: "qualityCheck",
            name: "admin-devs-qualityCheck",
            component: () => import("@/views/apps/devs/QualityCheck.vue"),
            meta: { pageTitle: "Quality Check" },
          },
          {
            path: "jobCard",
            name: "admin-devs-jobCard",
            component: () => import("@/views/apps/devs/JobCard.vue"),
            meta: { pageTitle: "Job Card" },
          },
          {
            path: "purchaseReq",
            name: "admin-devs-purchaseReq",
            component: () => import("@/views/apps/devs/PurchaseReq.vue"),
            meta: { pageTitle: "Purchase Request" },
          },
          {
            path: "purchaseOrd",
            name: "admin-devs-purchaseOrd",
            component: () => import("@/views/apps/devs/PurchaseOrd.vue"),
            meta: { pageTitle: "Purchase Order" },
          },
          {
            path: "inwardQc",
            name: "admin-devs-inwardQc",
            component: () => import("@/views/apps/devs/InwardQc.vue"),
            meta: { pageTitle: "Inward QC" },
          },
          {
            path: "deal",
            name: "admin-devs-deal",
            component: () => import("@/views/apps/devs/Deal.vue"),
            meta: { pageTitle: "Deal" },
          },
          {
            path: "knowledge",
            name: "admin-devs-knowledge",
            component: () => import("@/views/apps/devs/Knowledge.vue"),
            meta: { pageTitle: "Knowledge" },
          },
          {
            path: "invoice",
            name: "admin-devs-invoice",
            component: () => import("@/views/apps/devs/Invoice.vue"),
            meta: { pageTitle: "Invoice" },
          },
        
          {
            path: "problems",
            name: "admin-devs-problems",
            component: () => import("@/views/apps/devs/Problems.vue"),
            meta: { pageTitle: "Problems" },
          },
        ],
      },
      {
        path: '/employee/devs',
        name: 'employee',
        // component: () => import("@/layouts/default-layout/DefaultLayout1.vue"),
        component: () => import("@/layouts/default-layout/DefaultLayout.vue"),
        meta: { layout: 'employee' },
        children: [
          {
            path: "introduction",
            name: "employee-devs-introduction",
            component: () => import("@/views/apps/devs/EmployeeIntroduction.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "activation",
            name: "employee-devs-activation",
            component: () => import("@/views/apps/devs/Activation1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          // {
          //   path: "activation",
          //   name: "employee-devs-production",
          //   component: () => import("@/views/apps/devs/Production.vue"),
          //   meta: { pageTitle: "Company Setup" },
          // },
          {
            path: "updates",
            name: "employee-devs-updates",
            component: () => import("@/views/apps/devs/Updates1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
         
          {
            path: "customer",
            name: "employee-devs-customer",
            component: () => import("@/views/apps/devs/Customer.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "inquiry",
            name: "employee-devs-inquiry",
            component: () => import("@/views/apps/devs/Inquiry1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "quotation",
            name: "employee-devs-quotation",
            component: () => import("@/views/apps/devs/Quotation1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "order",
            name: "employee-devs-order",
            component: () => import("@/views/apps/devs/Order1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "orderBatchPlan",
            name: "employee-devs-orderBatchPlan",
            component: () => import("@/views/apps/devs/OrderBatchPlan1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "production",
            name: "employee-devs-production",
            component: () => import("@/views/apps/devs/Production1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "invoice",
            name: "employee-devs-invoice",
            component: () => import("@/views/apps/devs/Invoice1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "machine",
            name: "employee-devs-machine",
            component: () => import("@/views/apps/devs/Machine1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "workflow",
            name: "employee-devs-workflow",
            component: () => import("@/views/apps/devs/Workflow1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "attributes",
            name: "employee-devs-attributes",
            component: () => import("@/views/apps/devs/Attributes1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "qualityCheck",
            name: "employee-devs-qualityCheck",
            component: () => import("@/views/apps/devs/QualityCheck1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "operations",
            name: "employee-devs-operations",
            component: () => import("@/views/apps/devs/Operations1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "jobCard",
            name: "employee-devs-jobCard",
            component: () => import("@/views/apps/devs/JobCard1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "purchasereq",
            name: "employee-devs-purchasereq",
            component: () => import("@/views/apps/devs/PurchaseReq1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "purchaseorder",
            name: "employee-devs-purchaseorder",
            component: () => import("@/views/apps/devs/PurchaseOrd1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
          {
            path: "inwardqc",
            name: "employee-devs-inwardqc",
            component: () => import("@/views/apps/devs/InwardQc1.vue"),
            meta: { pageTitle: "Inward QC" },
          },
          {
            path: "deal",
            name: "employee-devs-deal",
            component: () => import("@/views/apps/devs/Deal1.vue"),
            meta: { pageTitle: "Deal" },
          },
          {
            path: "knowledge",
            name: "employee-devs-knowledge",
            component: () => import("@/views/apps/devs/Knowledge1.vue"),
            meta: { pageTitle: "Knowledge" },
          },
         
          {
            path: "problems",
            name: "employee-devs-problems",
            component: () => import("@/views/apps/devs/Problems1.vue"),
            meta: { pageTitle: "Company Setup" },
          },
        ]
      },
      {
        path: '/customer/devs',
        name: 'customer',
        // component: () => import("@/layouts/default-layout/DefaultLayout2.vue"),
        component: () => import("@/layouts/default-layout/DefaultLayout.vue"),
        meta: { layout: 'customer' },
        children: [
          {
            path: "introduction",
            name: "customer-devs-introduction",
            component: () => import("@/views/apps/devs/CustomerIntroduction.vue"),
            meta: { pageTitle: "Activation" },
          },
          {
            path: "activation",
            name: "customer-devs-activation",
            component: () => import("@/views/apps/devs/Activation2.vue"),
            meta: { pageTitle: "Activation" },
          },
          {
            path: "updates",
            name: "customer-devs-updates",
            component: () => import("@/views/apps/devs/Updates2.vue"),
            meta: { pageTitle: "Activation" },
          },
          {
            path: "problems",
            name: "customer-devs-problems",
            component: () => import("@/views/apps/devs/Problems2.vue"),
            meta: { pageTitle: "Activation" },
          },
          {
            path: "knowledge",
            name: "customer-devs-knowledge",
            component: () => import("@/views/apps/devs/Knowledge.vue"),
            meta: { pageTitle: "Activation" },
          },
         
          {
            path: "orders",
            name: "customer-devs-orders",
            component: () => import("@/views/apps/devs/Order2.vue"),
            meta: { pageTitle: "Activation" },
          },
          {
            path: "quotation",
            name: "customer-devs-quotation",
            component: () => import("@/views/apps/devs/Quotation2.vue"),
            meta: { pageTitle: "Activation" },
          },
        
          {
            path: "checkout",
            name: "customer-devs-checkout",
            component: () => import("@/views/apps/devs/Checkout.vue"),
            meta: { pageTitle: "Activation" },
          },
          {
            path: "inquiry",
            name: "customer-devs-inquiry",
            component: () => import("@/views/apps/devs/Inquiry2.vue"),
            meta: { pageTitle: "Activation" },
          },
          {
            path: "deal",
            name: "customer-devs-deal",
            component: () => import("@/views/apps/devs/Deal2.vue"),
            meta: { pageTitle: "Activation" },
          },
          {
            path: "inventory",
            name: "customer-devs-inventory",
            component: () => import("@/views/apps/devs/DigitalInventory.vue"),
            meta: { pageTitle: "Activation" },
          },
          {
            path: "knowledge",
            name: "customer-devs-knowledge",
            component: () => import("@/views/apps/devs/Knowledge2.vue"),
            meta: { pageTitle: "Activation" },
          },
          // {
          //   path: "support",
          //   name: "customer-devs-support",
          //   component: () => import("@/views/apps/devs/Support.vue"),
          //   meta: { pageTitle: "Activation" },
          // },
        ]
      },
    ],
  },
  {
    path: "/",
    component: () => import("@/layouts/SystemLayout.vue"),
    children: [
      {
        // the 404 route, when none of the above matches
        path: "/404",
        name: "404",
        component: () => import("@/views/crafted/authentication/Error404.vue"),
        meta: {
          pageTitle: "Error 404",
        },
      },
      {
        path: "/500",
        name: "500",
        component: () => import("@/views/crafted/authentication/Error500.vue"),
        meta: {
          pageTitle: "Error 500",
        },
      },
    ],
  },
  {
    path: "/:pathMatch(.*)*",
    redirect: "/404",
  },
];




const router = createRouter({
  history: createWebHashHistory(),
  routes,
  scrollBehavior(to) {
    // If the route has a hash, scroll to the section with the specified ID; otherwise, scroll to the top of the page.
    if (to.hash) {
      return {
        el: to.hash,
        top: 80,
        behavior: "smooth",
      };
    } else {
      return {
        top: 0,
        left: 0,
        behavior: "smooth",
      };
    }
  },
});

router.beforeEach((to, from, next) => {
  const authStore = useAuthStore();
  const configStore = useConfigStore();

  // current page view title
  document.title = `${to.meta.pageTitle} - ${import.meta.env.VITE_APP_NAME}`;

  // reset config to initial state
  configStore.resetLayoutConfig();

  // verify auth token before each page change
  authStore.verifyAuth();

  // before page access check if page requires authentication
  if (to.meta.middleware == "auth") {
    if (authStore.isAuthenticated) {
      next();
    } else {
      next({ name: "sign-in" });
    }
  } else {
    next();
  }
});

export default router;
