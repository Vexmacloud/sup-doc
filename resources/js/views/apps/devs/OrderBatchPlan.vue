<template>
  <div class="onboarding-container">
    <header class="header-section">
      <h1 class="main-heading">How to Create an Order Batch Plan</h1>
      <div class="progress-container">
        <div class="progress-bar" :style="progressStyle"></div>
      </div>
    </header>
    
    <div class="content-wrapper">
      <!-- Left Side: Carousel with Controls -->
      <div class="carousel-section">
        <transition name="fade">
          <div class="carousel-arrow prev" @click="previousStep" :class="{ disabled: currentStep === 0 }">
            &#8249;
          </div>
        </transition>
        
        <div class="image-carousel">
          <div 
            class="zoom-wrapper" 
            ref="zoomWrapper" 
            :class="{ 'zoomed': isZoomed }"
            @click="toggleZoom"
            @mousemove="handleZoom"
          >
            <div class="zoom-controls">
              <button class="zoom-button" @click.stop="toggleZoom">
                {{ isZoomed ? '−' : '+' }}
              </button>
            </div>
            <transition name="slide-fade" mode="out-in">
              <img
                :key="currentStep"
                :src="steps[currentStep].image"
                :alt="steps[currentStep].title"
                class="slide-image"
                ref="zoomImage"
              />
            </transition>
          </div>
          
          <div class="carousel-dots">
            <transition-group name="dot-scale">
              <span 
                v-for="(step, index) in steps" 
                :key="index"
                class="carousel-dot" 
                :class="{ active: currentStep === index }"
                @click="goToStep(index)"
              ></span>
            </transition-group>
          </div>
        </div>
        
        <div class="content-section">
          <transition name="fade-slide" mode="out-in">
            <div class="step-info" :key="currentStep">
              <div class="step-header">
                <div class="step-badge">Step {{ currentStep + 1 }}/{{ steps.length }}</div>
                <h2 class="step-title">{{ steps[currentStep].title }}</h2>
              </div>
              
              <p class="step-description">{{ steps[currentStep].description }}</p>
              
              <div class="step-details" v-if="steps[currentStep].bulletPoints">
                <transition-group name="list" tag="ul" class="feature-list">
                  <li v-for="(item, index) in steps[currentStep].bulletPoints" :key="item">
                    <span class="checkmark">
                      <transition name="check-pop">
                        <span class="check-icon" v-show="showChecks">✓</span>
                      </transition>
                    </span>
                    <span>{{ item }}</span>
                  </li>
                </transition-group>
              </div>
              
              <transition name="bounce" v-if="steps[currentStep].tip">
                <div class="tip-box">
                  <div class="tip-icon pulse">💡</div>
                  <div class="tip-content">{{ steps[currentStep].tip }}</div>
                </div>
              </transition>
            </div>
          </transition>
        </div>
        
        <transition name="fade">
          <div class="carousel-arrow next" @click="nextStep" :class="{ disabled: currentStep === steps.length - 1 }">
            &#8250;
          </div>
        </transition>
      </div>
    </div>
    
    <!-- Video Tutorial Section -->
    <div class="video-section" ref="videoSection" v-intersect="handleVideoIntersect">
      <h2 class="video-title">Watch Video Tutorial</h2>
      <transition name="reveal">
        <div class="video-container" v-if="videoVisible">
          <iframe
            src="https://www.youtube.com/embed/7TUfuT6DTg0?autoplay=0&controls=1"
            frameborder="0"
            allowfullscreen
            class="video-frame"
          ></iframe>
        </div>
      </transition>
    </div>
    
    <!-- Scroll to top button -->
    <transition name="fade-up">
      <button class="scroll-top-button" @click="scrollToTop" v-show="showScrollButton">
        <span class="top-arrow">↑</span>
      </button>
    </transition>
  </div>
</template>

<script>
import { defineComponent, ref, computed, onMounted, onUnmounted } from "vue";

export default defineComponent({
  name: "OrderBatchPlanOnboarding",
  directives: {
    intersect: {
      mounted(el, binding) {
        const observer = new IntersectionObserver(
          ([entry]) => {
            if (entry.isIntersecting) {
              binding.value(true);
            } else {
              binding.value(false);
            }
          },
          {
            threshold: 0.2
          }
        );
        observer.observe(el);
        el._intersectionObserver = observer;
      },
      unmounted(el) {
        if (el._intersectionObserver) {
          el._intersectionObserver.disconnect();
        }
      }
    }
  },
  setup() {
    const steps = ref([
        {
          id: 1,
          title: "Initial Setup",
          image: "/images/Machine Listing - web mockup.webp",
          description: `To kickstart your production journey, begin with a one-time 
                       initial setup that lays the foundation for all subsequent processes.
                       This phase is crucial as it allows you to configure your system settings 
                       and update them whenever you introduce new services.`,
          bulletPoints: [
            "Configure system settings only once",
            "Update settings when adding new services",
            "Establish a foundation for all production processes",
            "Streamline workflow management"
          ],
          tip: "Take time to get this right - a solid foundation ensures efficient operations later."
        },
        {
          id: 2,
          title: "Add Machines",
          image: "/images/Machine Listing - web mockup.webp",
          description: `The first operational step involves adding assets to the system, primarily by registering
                       all the machines utilized in your production facility. By adding each machine with its specific 
                       details, you create a comprehensive inventory that facilitates effective equipment tracking.`,
          bulletPoints: [
            "Register each machine with unique identifiers",
            "Add machine name, model, and capacity",
            "Specify machine functionality and capabilities",
            "Create a complete equipment inventory"
          ],
          tip: "Include detailed specifications to optimize job routing and scheduling."
        },
        {
          id: 3,
          title: "Define Operations",
          image: "/images/operation1.webp",
          description: `Once your assets are in place, the next step is to define the core operations 
                      that form your production process. This involves outlining the various tasks 
                      and processes, from material handling to final assembly.`,
          bulletPoints: [
            "Outline sequential production steps",
            "Define material handling procedures",
            "Specify assembly processes",
            "Incorporate necessary attributes for customization"
          ],
          tip: "Break down complex processes into discrete operations for better tracking."
        },
        {
          id: 4,
          title: "Update Operations",
          image: "/images/obp3.webp",
          description: `Flexibility is key in a dynamic production environment. In this phase, you 
                      have the capability to update and edit existing operations effortlessly through an 
                      intuitive action button.`,
          bulletPoints: [
            "Make real-time adjustments to processes",
            "Update operations as requirements change",
            "Optimize processes for better efficiency",
            "Minimize downtime with quick updates"
          ],
          tip: "Regular reviews and updates ensure your operations remain optimized and current."
        },
        {
          id: 5,
          title: "Set Up Workflows",
          image: "/images/Work Flow Listing - web mockup.webp",
          description: `With your operations clearly defined, the next step is to set up customizable 
                      workflows that orchestrate the entire production sequence. This feature empowers 
                      you to design workflows that match your unique process requirements.`,
          bulletPoints: [
            "Design workflows matching your production process",
            "Add, rearrange, or remove various stages",
            "Configure workflow transitions and dependencies",
            "Set up approval processes and checkpoints"
          ],
          tip: "Design workflows that match your actual production process for maximum efficiency."
        },
        {
          id: 6,
          title: "Create Order Batch Plan",
          image: "/images/obp5.webp",
          description: `Once an order is confirmed and enters the production stage, the system facilitates the 
                      creation of a detailed order batch plan. In this step, you outline the scheduling, resource 
                      allocation, and sequence of operations for each production batch.`,
          bulletPoints: [
            "Outline scheduling for production batches",
            "Allocate resources to specific operations",
            "Sequence operations in optimal order",
            "Establish quality control checkpoints"
          ],
          tip: "A detailed and well-organized batch plan is key to consistent product quality and efficiency."
        },
        {
          id: 7,
          title: "Manage Workflow",
          image: "/images/obp6.webp",
          description: `Whether you're automating routine tasks or incorporating manual oversight, 
                      the flexible workflow setup ensures that each production phase is meticulously 
                      managed and can be easily modified to adapt to evolving business needs.`,
          bulletPoints: [
            "Automate routine production tasks",
            "Incorporate manual quality checks when needed",
            "Manage each production phase meticulously",
            "Modify workflows as business needs evolve"
          ],
          tip: "Finding the right balance between automation and manual oversight is crucial for optimal results."
        },
        {
          id: 8,
          title: "Monitor and Improve",
          image: "/images/obp7.webp",
          description: `The final steps focus on continuous improvement and monitoring. 
                      You can dynamically adjust workflow stages by simply checking or 
                      unchecking specific options, allowing for real-time modifications 
                      based on production demands.`,
          bulletPoints: [
            "Review all planned orders in a dedicated screen",
            "Edit and update order plans with a few clicks",
            "Adjust workflow stages in real-time",
            "Optimize operations based on production data"
          ],
          tip: "Regular monitoring and continuous improvement are key to maintaining an agile and responsive production process."
        }
    ]);

    const currentStep = ref(0);
    const showScrollButton = ref(false);
    const zoomWrapper = ref(null);
    const zoomImage = ref(null);
    const isZoomed = ref(false);
    const zoomPosition = ref({ x: 50, y: 50 });
    const showChecks = ref(false);
    const videoVisible = ref(false);

    const progressStyle = computed(() => {
      return {
        width: `${(currentStep.value / (steps.value.length - 1)) * 100}%`
      };
    });

    const nextStep = () => {
      if (currentStep.value < steps.value.length - 1) {
        currentStep.value++;
        isZoomed.value = false;
        showChecks.value = false;
        setTimeout(() => {
          showChecks.value = true;
        }, 500);
      }
    };

    const previousStep = () => {
      if (currentStep.value > 0) {
        currentStep.value--;
        isZoomed.value = false;
        showChecks.value = false;
        setTimeout(() => {
          showChecks.value = true;
        }, 500);
      }
    };

    const goToStep = (index) => {
      if (index !== currentStep.value) {
        currentStep.value = index;
        isZoomed.value = false;
        showChecks.value = false;
        setTimeout(() => {
          showChecks.value = true;
        }, 500);
      }
    };

    const toggleZoom = () => {
      isZoomed.value = !isZoomed.value;
      
      if (isZoomed.value && zoomWrapper.value && zoomImage.value) {
        updateZoomPosition(zoomPosition.value.x, zoomPosition.value.y);
      }
    };

    const updateZoomPosition = (x, y) => {
      if (zoomImage.value) {
        zoomImage.value.style.transformOrigin = `${x}% ${y}%`;
      }
    };

    const handleZoom = (e) => {
      if (!isZoomed.value || !zoomWrapper.value || !zoomImage.value) return;
      
      const rect = zoomWrapper.value.getBoundingClientRect();
      const x = ((e.clientX - rect.left) / rect.width) * 100;
      const y = ((e.clientY - rect.top) / rect.height) * 100;
      
      zoomPosition.value = { x, y };
      updateZoomPosition(x, y);
    };

    const scrollToTop = () => {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    };

    const checkScroll = () => {
      showScrollButton.value = window.pageYOffset > 300;
    };

    const handleVideoIntersect = (isVisible) => {
      if (isVisible) {
        videoVisible.value = true;
      }
    };

    onMounted(() => {
      window.addEventListener('scroll', checkScroll);
      
      // Show check marks with delay on initial load
      setTimeout(() => {
        showChecks.value = true;
      }, 500);
    });

    onUnmounted(() => {
      window.removeEventListener('scroll', checkScroll);
    });

    return {
      steps,
      currentStep,
      showScrollButton,
      zoomWrapper,
      zoomImage,
      isZoomed,
      showChecks,
      videoVisible,
      progressStyle,
      nextStep,
      previousStep,
      goToStep,
      toggleZoom,
      handleZoom,
      scrollToTop,
      handleVideoIntersect
    };
  }
});
</script>