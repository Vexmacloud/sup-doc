<template>
  <div class="onboarding-container">
    <header class="header-section">
      <h1 class="main-heading">How to Create Deals</h1>
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
              
              <p class="step-description" v-if="steps[currentStep].description">{{ steps[currentStep].description }}</p>
              
              <div class="step-details">
                <transition-group name="list" tag="ul" class="feature-list">
                  <li v-for="(item, index) in steps[currentStep].details || steps[currentStep].bulletPoints" :key="item">
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
            src="https://www.youtube.com/embed/GBP6vpQP1xA?autoplay=0&controls=1"
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
  name: "Deal",
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
        title: "Browse Available Deals",
        image: "/images/udeal.PNG",
        description: "The Deals section provides customers with a centralized space to explore all available offers, discounts, and promotions in one place. This feature ensures that you never miss out on exclusive deals tailored to your business needs.",
        details: [
          "Customers can access the Deals section to view all active, upcoming, and past offers.",
          "Deals are categorized based on discounts, product bundles, or limited-time promotions.",
          "The intuitive interface allows quick navigation, making it easy to find relevant deals.",
          "Stay informed about special offers that can help optimize costs and maximize savings."
        ],
        tip: "Bookmark your favorite deals to revisit them later before they expire."
      },
      {
        id: 2,
        title: "Filter and Search",
        image: "/images/udeal.PNG",
        details: [
          "Use the search function to quickly find specific deals by keywords or product names.",
          "Filter deals by category, discount percentage, or validity period.",
          "Sort deals by popularity, expiration date, or discount value.",
          "Save time by focusing only on relevant promotions for your business."
        ],
        tip: "Combine multiple filters to narrow down the most relevant deals for your specific needs."
      },
      {
        id: 3,
        title: "Review Deal Details",
        image: "/images/udeal.PNG",
        details: [
          "Click on any deal to view comprehensive information including terms and conditions.",
          "Review the discount structure, eligibility criteria, and usage limitations.",
          "Check the validity period to ensure you don't miss out on time-sensitive offers.",
          "Understand the redemption process before proceeding with the deal."
        ],
        tip: "Always check the fine print in the terms and conditions to avoid any surprises later."
      },
      {
        id: 4,
        title: "Apply Deal to Your Purchase",
        image: "/images/udeal.PNG",
        details: [
          "Select the 'Apply Deal' button to add the promotion to your current transaction.",
          "The system automatically verifies your eligibility for the selected deal.",
          "View real-time calculations showing your savings after the deal is applied.",
          "Multiple compatible deals can be stacked for maximum savings where allowed."
        ],
        tip: "Some deals may require minimum purchase amounts or specific product combinations to be activated."
      },
      {
        id: 5,
        title: "Track Usage History",
        image: "/images/udeal.PNG",
        details: [
          "Access your deal usage history to review past savings and redemptions.",
          "Monitor remaining uses for deals with limited redemption opportunities.",
          "Analyze which deals provided the most value for your business.",
          "Plan future purchases based on your deal utilization patterns."
        ],
        tip: "Regular review of your deal history can help identify cost-saving opportunities and optimize your purchasing strategy."
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