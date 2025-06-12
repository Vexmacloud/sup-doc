<template>
    <div class="onboarding-container">
      <header class="header-section">
        <h1 class="main-heading">Company Setup User Onboarding</h1>
        <div class="progress-container">
          <div class="progress-bar" :style="progressStyle"></div>
        </div>
      </header>
  
      <div class="slideshow-wrapper">
        <transition
          name="slide"
          mode="out-in"
          @before-enter="resetTransform"
          @enter="startAnimation"
          @leave="resetTransform"
        >
          <div class="slide-content" :key="currentStep">
            <div class="image-container">
              <img
                :src="steps[currentStep].image"
                :alt="steps[currentStep].title"
                class="slide-image"
              />
            </div>
            <div class="slide-text">
              <div class="step-badge">Step {{ currentStep + 1 }}/{{ steps.length }}</div>
              <h2 class="step-title">{{ steps[currentStep].title }}</h2>
              
              <div class="step-details">
                <ul class="feature-list">
                  <li v-for="(item, index) in steps[currentStep].details" :key="index">
                    <span class="checkmark">✓</span>
                    <span>{{ item }}</span>
                  </li>
                </ul>
              </div>
              
              <div class="tip-box">
                <div class="tip-icon">💡</div>
                <div class="tip-content">{{ steps[currentStep].tip }}</div>
              </div>
            </div>
          </div>
        </transition>
  
        <div class="step-indicators">
          <span 
            v-for="(step, index) in steps" 
            :key="index" 
            class="step-dot" 
            :class="{ active: currentStep === index }"
            @click="goToStep(index)"
          ></span>
        </div>
  
        <div class="navigation-buttons">
          <button class="btn prev-btn" @click="previousStep" :disabled="currentStep === 0">
            <span class="btn-icon">←</span> Previous
          </button>
          <button class="btn next-btn" @click="nextStep" :disabled="currentStep === steps.length - 1">
            Next <span class="btn-icon">→</span>
          </button>
        </div>
      </div>
  
      <div class="video-section">
        <h2 class="video-title">Watch Video Tutorial</h2>
        <div class="video-container">
          <iframe
            src="https://www.youtube.com/embed/cq0yA4tQEx0?autoplay=0&controls=1"
            frameborder="0"
            allowfullscreen
            class="video-frame"
          ></iframe>
        </div>
      </div>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent, ref } from "vue";
  import "@/assets/style.css";
  export default defineComponent({
    name: "CompanySetup",
    props: {
      currentStep: Number,
      steps: Array
    },
    computed:{
      progressStyle() {
        return {
          width: `${(this.currentStep / (this.steps.length - 1)) * 100}%`
        };
      }
    },
    setup() {
      const steps = ref([
        {
          title: "Manufacturing Unit Details",
          image: "/images/companysetup1mockup.PNG",
          details: [
            "Enter your manufacturing unit's official name",
            "Specify exact location coordinates and address",
            "Define production capacity in units per timeframe",
            "Add contact information for unit administrators"
          ],
          tip: "Complete unit details accurately to ensure proper system configuration and reporting."
        },
        {
          title: "Add Services",
          image: "/images/companysetup2mockup.PNG",
          details: [
            "Select from predefined manufacturing capabilities",
            "Add custom services unique to your facility",
            "Specify service rates and turnaround times",
            "Set availability and scheduling parameters"
          ],
          tip: "Be comprehensive when listing services to improve visibility in client searches."
        },
        {
          title: "Add Machines",
          image: "/images/companysetup3mockup.PNG",
          details: [
            "Register each piece of equipment with unique ID",
            "Document machine specifications and capabilities",
            "Set up maintenance schedules and alert parameters",
            "Link machines to specific services they support"
          ],
          tip: "Include detailed specifications to optimize job routing and scheduling."
        },
        {
          title: "Add Operations",
          image: "/images/companysetup4mockup.PNG",
          details: [
            "Define sequential production operations",
            "Set requirements for materials, skills, and time",
            "Establish quality control checkpoints",
            "Create operation dependencies and prerequisites"
          ],
          tip: "Break down complex processes into discrete operations for better tracking."
        },
        {
          title: "Add Workflow",
          image: "/images/companysetup5mockup.PNG",
          details: [
            "Configure production workflow stages",
            "Set up approval processes and notifications",
            "Define stage transitions and conditions",
            "Establish final quality verification procedures"
          ],
          tip: "Design workflows that match your actual production process for maximum efficiency."
        }
      ]);
  
      const currentStep = ref(0);
  
      const previousStep = () => {
        if (currentStep.value > 0) {
          currentStep.value--;
        }
      };
  
      const nextStep = () => {
        if (currentStep.value < steps.value.length - 1) {
          currentStep.value++;
        }
      };
  
      const goToStep = (stepIndex) => {
        currentStep.value = stepIndex;
      };
  
      // Dummy functions for transition events
      const resetTransform = () => {};
      const startAnimation = () => {};
  
      return {
        steps,
        currentStep,
        previousStep,
        nextStep,
        goToStep,
        resetTransform,
        startAnimation
      };
    }
  });
  </script>
  