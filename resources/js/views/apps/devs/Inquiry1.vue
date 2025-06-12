<template>
  <div class="onboarding-container">
    <header class="header-section">
      <h1 class="main-heading">Inquiry Management</h1>
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
            src="https://www.youtube.com/embed/cq0yA4tQEx0?autoplay=0&controls=1"
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
  name: "CompanySetup",
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
        title: "Inquiry Management (Designated Employee Role: Sales/Customer Support)",
        image: "/images/inquiry1.webp",
        details: [
          "In the Inquiry section, designated employees—such as those in the Sales or Customer Support teams—can create new inquiries and view incoming inquiries.",
          "This role ensures that all customer requests are efficiently captured and managed.",
          "The system provides filtering and search options to help you quickly locate and prioritize inquiries.",
          "This centralized approach streamlines communication and sets the stage for prompt follow-ups."
        ],
        tip: "Utilize the search function to quickly locate inquiries by client name or keyword for faster management."
      },
      {
        title: "Generate Quotation",
        image: "/images/einquiry2.webp",
        details: [
          "After an inquiry is placed or reviewed, designated employees can generate a quotation directly from the inquiry details.",
          "Fill in all required fields in the quotation form to capture precise pricing, product details, and any applicable discounts.",
          "Once the quotation is completed, it is automatically sent to the customer via email and in-app notification.",
          "This step bridges the inquiry to a formal offer, ensuring clarity and professionalism."
        ],
        tip: "Be as detailed as possible when completing the quotation to avoid any follow-up clarifications and to speed up customer approval."
      },
      {
        title: "Convert Inquiry to Order",
        image: "/images/einquiry3.webp",
        details: [
          "Once the customer confirms the quotation, designated employees can easily convert the inquiry into an order with a few clicks.",
          "This conversion process carries over all relevant details, reducing manual data entry and ensuring consistency.",
          "The system automatically updates the order status and notifies relevant stakeholders about the transition.",
          "This streamlined workflow ensures a smooth progression from inquiry to order, enhancing overall efficiency."
        ],
        tip: "Review the order details before finalizing the conversion to ensure that every element reflects the customer’s requirements accurately."
      },
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

