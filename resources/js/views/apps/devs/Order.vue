<template>
  <div class="onboarding-container">
    <header class="header-section">
      <h1 class="main-heading">How to Create an Order</h1>
      <div class="progress-container">
        <div class="progress-bar" :style="progressStyle"></div>
      </div>
    </header>
    
    <div class="content-wrapper">
      <!-- Left Side: Carousel with Controls -->
      <div class="carousel-section">
        <transition name="fade">
          <div class="carousel-arrow prev" @click="prevSlide" :class="{ disabled: currentStep === 0 }">
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
              
              <div class="step-details">
                <transition-group name="list" tag="ul" class="feature-list">
                  <li v-for="(item, index) in steps[currentStep].details" :key="item">
                    <span class="checkmark">
                      <transition name="check-pop">
                        <span class="check-icon" v-show="showChecks">✓</span>
                      </transition>
                    </span>
                    <span>{{ item }}</span>
                  </li>
                </transition-group>
              </div>
              
              <transition name="bounce">
                <div class="tip-box">
                  <div class="tip-icon pulse">💡</div>
                  <div class="tip-content">{{ steps[currentStep].tip }}</div>
                </div>
              </transition>
            </div>
          </transition>
        </div>
        
        <transition name="fade">
          <div class="carousel-arrow next" @click="nextSlide" :class="{ disabled: currentStep === steps.length - 1 }">
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
import { defineComponent, ref, computed, onMounted, onUnmounted, nextTick } from "vue";
import "@/assets/style.css";

export default defineComponent({
  name: "Order",
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
        title: "Generate Order from Inquiry",
        image: "/images/order1.webp",
        details: [
          "Locate the approved quotation in the system",
          "Click 'Generate Order' button to create new order",
          "System automatically transfers inquiry details",
          "All client information is preserved for consistency"
        ],
        tip: "Creating an order directly from inquiry ensures all client specifications are accurately maintained."
      },
      {
        id: 2,
        title: "Complete Order Details",
        image: "/images/order2.webp",
        details: [
          "Verify all pre-filled information for accuracy",
          "Complete any additional required fields",
          "Review pricing and delivery timeline",
          "Submit completed order for processing"
        ],
        tip: "Double-check all fields before submission to prevent delays in order processing."
      },
      {
        id: 3,
        title: "Order Confirmation",
        image: "/images/order3.webp",
        details: [
          "Review order summary page for accuracy",
          "System generates unique order reference number",
          "Client receives email notification automatically",
          "WhatsApp notification sent with order details"
        ],
        tip: "Order confirmations are sent via multiple channels to ensure clients are properly informed."
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

    const nextSlide = () => {
      if (currentStep.value < steps.value.length - 1) {
        currentStep.value++;
        isZoomed.value = false;
        showChecks.value = false;
        setTimeout(() => {
          showChecks.value = true;
        }, 500);
      }
    };

    const prevSlide = () => {
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
      nextSlide,
      prevSlide,
      goToStep,
      toggleZoom,
      handleZoom,
      scrollToTop,
      handleVideoIntersect
    };
  }
});
</script>

