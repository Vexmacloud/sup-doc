<template>
  <div class="introduction-container">
    <header class="header-section">
      <h1 class="main-heading">Transforming Manufacturing with Vexma Cloud</h1>
      <p class="subtitle">Your comprehensive solution for digital manufacturing excellence</p>
      <div class="accent-line"></div>
    </header>

    <div class="content-grid">
      <!-- Left panel with feature sections -->
      <div class="feature-sections">
        <transition-group name="fade" tag="div" class="sections-container">
          <details 
            v-for="(section, index) in sections" 
            :key="index" 
            class="topic-section" 
            :open="index === activeSection"
            @toggle="handleToggle(index, $event)"
          >
            <summary class="topic-title">
              <span class="section-icon" v-html="section.icon"></span>
              {{ section.title }}
            </summary>
            <div class="section-content">
              <ul class="topic-list">
                <li v-for="(item, itemIndex) in section.points" :key="itemIndex">
                  <span class="checkmark">✓</span>
                  <span>{{ item }}</span>
                </li>
              </ul>
              <div class="tip-box" v-if="section.tip">
                <div class="tip-icon">💡</div>
                <div class="tip-content">{{ section.tip }}</div>
              </div>
            </div>
          </details>
        </transition-group>
      </div>

      <!-- Right panel with image carousel -->
      <div class="image-showcase">
        <div class="image-carousel">
          <transition-group name="slide" tag="div" class="carousel-container">
            <div 
              v-for="(image, index) in images" 
              :key="index" 
              v-show="index === activeImage" 
              class="carousel-slide"
            >
              <div 
                class="image-container" 
                ref="imageContainer"
                @mousemove="handleMouseMove($event, index)"
                @mouseout="resetZoom(index)"
                @click="toggleZoom($event, index)"
              >
                <img 
                  :src="image.src" 
                  :alt="image.alt" 
                  class="showcase-image"
                  :style="zoomStyles[index]"
                  ref="showcaseImages"
                />
              </div>
              <div class="image-caption">{{ image.caption }}</div>
            </div>
          </transition-group>

          <div class="carousel-controls">
            <div class="carousel-indicators">
              <span 
                v-for="(image, index) in images" 
                :key="index" 
                class="indicator-dot" 
                :class="{ active: index === activeImage }"
                @click="setActiveImage(index)"
              ></span>
            </div>
          </div>
          
          <!-- Improved navigation arrows - only for images -->
          <button class="floating-arrow floating-arrow-left" @click="previousImage()">
            <span class="arrow-icon">❮</span>
          </button>
          <button class="floating-arrow floating-arrow-right" @click="nextImage()">
            <span class="arrow-icon"></span>
          </button>
        </div>
      </div>
    </div>

    <div class="video-section">
      <div class="section-divider">
        <span class="divider-line"></span>
        <span class="divider-text">Watch How It Works</span>
        <span class="divider-line"></span>
      </div>
      
      <div class="video-container">
        <iframe
          src="https://www.youtube.com/embed/Ry90evDx45c?autoplay=0&controls=1"
          frameborder="0"
          allowfullscreen
          class="video-frame"
        ></iframe>
      </div>
    </div>

    <div class="cta-section">
      <h2 class="cta-title">Ready to Transform Your Manufacturing?</h2>
      <p class="cta-description">Join thousands of manufacturers who have optimized their operations with Vexma Cloud.</p>
      <button class="cta-button" onclick="window.open('https://vexmacloud.com/pricing', '_blank')">Start Free Trial</button>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, onMounted, onBeforeUnmount, reactive } from "vue";
import "@/assets/style1.css";
export default defineComponent({
  name: "Introduction",
  setup() {
    const activeSection = ref(0);
    const activeImage = ref(0);
    const zoomLevel = ref(2.5); // Zoom magnification level
    const imageContainer = ref(null);
    const showcaseImages = ref([]);
    
    // Track zoom state for each image
    const zoomedImages = reactive({});
    
    // Reactive objects for zoom styles
    const zoomStyles = reactive({});
    
    // Store mouse position for precise zooming
    const mousePosition = reactive({
      x: 0,
      y: 0
    });

    const sections = ref([
      {
        icon: '<img src="/images/rocket.gif" alt="Introduction" style="width: 40px; height: 40px;"/>',
        title: "Introduction: Transforming Manufacturing with Vexma Cloud",
        points: [
          "Embrace digital transformation in manufacturing.",
          "Modernize operations with our cloud-based SaaS platform.",
          "Consolidate production, quality control, inventory tracking, and customer engagement in one intuitive solution.",
          "Leverage automation, real-time analytics, and scalability to optimize workflows and reduce costs.",
          "Maintain the highest standards of quality and efficiency."
        ],
        tip: "Start your journey to manufacturing excellence by exploring our comprehensive platform features."
      },
      {
        icon: '<img src="/images/efficiency.gif" alt="Operations" style="width: 40px; height: 40px;"/>',
        title: "Unifying Your Operations for Enhanced Efficiency",
        points: [
          "Simplify complex processes by uniting operational components.",
          "Access all aspects of your business from a centralized dashboard.",
          "Improve communication and collaboration across departments.",
          "Achieve a smoother production cycle that adapts to market changes."
        ],
        tip: "The unified approach can reduce operational costs by up to 30% while increasing productivity."
      },
      {
        icon: '<img src="/images/laptop.gif" alt="Digital Transformation" style="width: 40px; height: 40px;"/>',
        title: "Driving Digital Transformation in Manufacturing",
        points: [
          "Simplify day-to-day operations with comprehensive reporting and analytics.",
          "Gain immediate access to performance metrics for informed decisions.",
          "Automate routine tasks to free up resources for strategic growth.",
          "Transform production management to stay competitive in an evolving market."
        ],
        tip: "Companies that embrace digital transformation see an average of 40% improvement in operational efficiency."
      },
      {
        icon: '<img src="/images/award.gif" alt="icon" style="width: 40px; height: 40px;"/>',
        title: "Why Choose Vexma Cloud?",
        points: [
          "Invest in a holistic approach to manufacturing excellence.",
          "Unify operations to drive long-term success and continuous improvement.",
          "Empower your business with integrated workflows and innovation.",
          "Leverage industry-specific templates and best practices for immediate results."
        ],
        tip: "Join over a thousand manufacturing companies that have revolutionized their operations with Vexma Cloud."
      }
    ]);

    const images = ref([
      {
        src: "/images/vexmacloudintro1.webp",
        alt: "Vexma Cloud Dashboard Overview",
        caption: "Comprehensive dashboard providing real-time insights into your manufacturing operations"
      },
      {
        src: "/images/productionintro.webp",
        alt: "Production Planning Interface",
        caption: "Intuitive production planning tools for optimized workflow management"
      },
      {
        src: "/images/analyticsdashboardmockup.webp",
        alt: "Analytics and Reporting",
        caption: "Powerful analytics to track performance metrics and identify improvement opportunities"
      }
    ]);

    // Initialize zoom styles for each image
    const initZoomStyles = () => {
      images.value.forEach((_, index) => {
        zoomStyles[index] = {
          transformOrigin: '50% 50%',
          transform: 'scale(1)',
          transition: 'transform 0.3s ease-out'
        };
        zoomedImages[index] = false;
      });
    };

    // Toggle zoom on click with precise location
    const toggleZoom = (event, imageIndex) => {
      zoomedImages[imageIndex] = !zoomedImages[imageIndex];
      
      if (zoomedImages[imageIndex]) {
        // Get relative position within the image container
        const rect = event.currentTarget.getBoundingClientRect();
        const x = ((event.clientX - rect.left) / rect.width) * 100;
        const y = ((event.clientY - rect.top) / rect.height) * 100;
        
        // Zoom in at specific point
        zoomStyles[imageIndex] = {
          transformOrigin: `${x}% ${y}%`,
          transform: `scale(${zoomLevel.value})`,
          transition: 'transform 0.3s ease-out'
        };
      } else {
        // Zoom out
        zoomStyles[imageIndex] = {
          transformOrigin: '50% 50%',
          transform: 'scale(1)',
          transition: 'transform 0.3s ease-out'
        };
      }
    };
    
    // Handle mouse movement for hover effect (preparation for magnifying glass)
    const handleMouseMove = (event, imageIndex) => {
      if (!zoomedImages[imageIndex]) return;
      
      const rect = event.currentTarget.getBoundingClientRect();
      const x = ((event.clientX - rect.left) / rect.width) * 100;
      const y = ((event.clientY - rect.top) / rect.height) * 100;
      
      // Update transform origin based on mouse position
      zoomStyles[imageIndex].transformOrigin = `${x}% ${y}%`;
    };
    
    // Reset zoom for a specific image
    const resetZoom = (imageIndex) => {
      if (!zoomedImages[imageIndex]) return;
      
      zoomedImages[imageIndex] = false;
      zoomStyles[imageIndex] = {
        transformOrigin: '50% 50%',
        transform: 'scale(1)',
        transition: 'transform 0.3s ease-out'
      };
    };

    const handleToggle = (index, event) => {
      // If the detail is being opened, update activeSection
      if (event.target.open) {
        activeSection.value = index;
      }
    };

    const previousSection = () => {
      if (activeSection.value > 0) {
        activeSection.value--;
      } else {
        activeSection.value = sections.value.length - 1;
      }
    };

    const nextSection = () => {
      if (activeSection.value < sections.value.length - 1) {
        activeSection.value++;
      } else {
        activeSection.value = 0;
      }
    };

    const previousImage = () => {
      // Reset zoom on current image before changing
      resetZoomOnCurrentImage();
      activeImage.value = (activeImage.value - 1 + images.value.length) % images.value.length;
    };

    const nextImage = () => {
      // Reset zoom on current image before changing
      resetZoomOnCurrentImage();
      activeImage.value = (activeImage.value + 1) % images.value.length;
    };

    const setActiveImage = (index) => {
      // Reset zoom on current image before changing
      resetZoomOnCurrentImage();
      activeImage.value = index;
    };

    // Reset zoom only on the current active image
    const resetZoomOnCurrentImage = () => {
      const currentIndex = activeImage.value;
      zoomedImages[currentIndex] = false;
      zoomStyles[currentIndex] = {
        transformOrigin: '50% 50%',
        transform: 'scale(1)',
        transition: 'transform 0.3s ease-out'
      };
    };
    
    // Add keyboard navigation
    const handleKeyDown = (e) => {
      if (e.key === 'ArrowLeft') {
        previousImage();
      } else if (e.key === 'ArrowRight') {
        nextImage();
      }
    };
    
    onMounted(() => {
      initZoomStyles();
      window.addEventListener('keydown', handleKeyDown);
    });
    
    onBeforeUnmount(() => {
      window.removeEventListener('keydown', handleKeyDown);
    });

    return {
      sections,
      images,
      activeSection,
      activeImage,
      handleToggle,
      previousSection,
      nextSection,
      previousImage,
      nextImage,
      setActiveImage,
      zoomStyles,
      toggleZoom,
      handleMouseMove,
      resetZoom,
      imageContainer,
      showcaseImages
    };
  }
});
</script>