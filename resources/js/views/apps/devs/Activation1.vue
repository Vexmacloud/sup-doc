<template>
  <div 
    class="activation-page" 
    style="font-family: var(--font-nunito); background-color: var(--color-off-white); color: var(--color-body); padding: 3rem 2rem; margin-left: 110px;"
  >
    <!-- Hero Section with Animation -->
    <header class="activation-header">
      <h1 class="main-heading">Choose Your Plan & Activate Your Account</h1>
      <p class="subtitle">Welcome to our platform! Select one of our flexible subscription plans below.</p>
      <div class="accent-line"></div>
      <div class="hero-image-container">
        <img
          src="@/../../public/images/pricing.webp"
          alt="Activation Banner"
          class="hero-image"
        />
      </div>
    </header>

    <!-- Activation Steps With Visual Elements -->
    <section class="activation-steps">
      <h2 class="section-heading">
        <span class="section-icon"><img src="@/../../public/images/rocket.gif" alt="rocket" style="width: 40px; height: 40px;"/></span>
        How Activation Works
      </h2>
      
      <div class="steps-container">
        <div class="steps-grid">
          <div class="step-card" v-for="(step, index) in activationSteps" :key="index">
            <div class="step-number">{{ index + 1 }}</div>
            <div class="step-content">
              <h3 class="step-title">{{ step.title }}</h3>
              <p class="step-description">{{ step.description }}</p>
            </div>
          </div>
        </div>
        
        <div class="steps-image-container">
          <img
            src="@/../../public/images/sign-up-account.png"
            alt="Activation Steps"
            class="steps-image"
          />
          <div class="image-overlay">
            <div class="overlay-content">
              <span class="overlay-icon">💡</span>
              <p>Once activated, manage everything from a central dashboard!</p>
            </div>
          </div>
        </div>
      </div>
      
      <div class="tip-box">
        <div class="tip-icon">💡</div>
        <div class="tip-content">
          Once your Admin account is active, you can manage everything from a central dashboard.
          Monitor production, track orders, assign tasks to Employees, and offer Customers an easy way to stay updated on their inquiries.
          Our platform ensures smooth collaboration.
        </div>
      </div>
    </section>

    <!-- Features Carousel -->
    <section class="features-section">
      <div class="section-divider">
        <span class="divider-line"></span>
        <span class="divider-text">Platform Features</span>
        <span class="divider-line"></span>
      </div>
      
      <div class="carousel-container">
        <div class="carousel-slides">
          <div class="carousel-slide" :class="{ active: currentSlide === 0 }">
            <div class="feature-card">
              <div class="feature-icon"><img src="@/../../public/images/analytics.gif" alt="analytics" style="width: 64px; height: 64px;"/></div>
              <h3 class="feature-title">Real-time Analytics</h3>
              <p class="feature-description">Monitor performance metrics and make data-driven decisions with comprehensive dashboards.</p>
            </div>
          </div>
          <div class="carousel-slide" :class="{ active: currentSlide === 1 }">
            <div class="feature-card">
              <div class="feature-icon"><img src="@/../../public/images/teamwork.gif" alt="teamwork" style="width: 64px; height: 64px;"/></div>
              <h3 class="feature-title">Team Collaboration</h3>
              <p class="feature-description">Connect your entire team with integrated communication and task management tools.</p>
            </div>
          </div>
          <div class="carousel-slide" :class="{ active: currentSlide === 2 }">
            <div class="feature-card">
              <div class="feature-icon"><img src="@/../../public/images/password.gif" alt="password" style="width: 64px; height: 64px;"/></div>
              <h3 class="feature-title">Role-based Access</h3>
              <p class="feature-description">Control who sees what with customizable permission levels for employees and customers.</p>
            </div>
          </div>
          <div class="carousel-slide" :class="{ active: currentSlide === 3 }">
            <div class="feature-card">
              <div class="feature-icon"><img src="@/../../public/images/companalysis.gif" alt="icon" style="width: 64px; height: 64px;"/></div>
              <h3 class="feature-title">Comprehensive Part Tracking</h3>
              <p class="feature-description">Comprehensive Part Tracking delivers real-time visibility and analytics, ensuring every component meets quality, compliance, and efficiency standards.</p>
            </div>
          </div>
          <div class="carousel-slide" :class="{ active: currentSlide === 4 }">
            <div class="feature-card">
              <div class="feature-icon"><img src="@/../../public/images/teamwork.gif" alt="teamwork" style="width: 64px; height: 64px;"/></div>
              <h3 class="feature-title">Shop floor Management</h3>
              <p class="feature-description">Shop Floor Management optimizes production with real-time tracking and streamlined workflows, enhancing overall efficiency.</p>
            </div>
          </div>
          <div class="carousel-slide" :class="{ active: currentSlide === 5 }">
            <div class="feature-card">
              <div class="feature-icon"><img src="@/../../public/images/teamwork.gif" alt="teamwork" style="width: 64px; height: 64px;"/></div>
              <h3 class="feature-title">Go Paperless with Digital Job Cards</h3>
              <p class="feature-description">Go Paperless with Digital Job Cards: Streamline operations by replacing paper with efficient, digital task management.</p>
            </div>
          </div>
          <div class="carousel-slide" :class="{ active: currentSlide === 6 }">
            <div class="feature-card">
              <div class="feature-icon"><img src="@/../../public/images/teamwork.gif" alt="teamwork" style="width: 64px; height: 64px;"/></div>
              <h3 class="feature-title">Agile ERP and CRM Tools</h3>
              <p class="feature-description">Agile ERP and CRM Tools streamline business processes and elevate customer engagement with flexible, integrated solutions.</p>
            </div>
          </div>
        </div>
        
        <div class="carousel-controls">
          <div class="carousel-indicators">
            <span 
              v-for="(_, index) in 3" 
              :key="index" 
              class="indicator-dot" 
              :class="{ active: currentSlide === index }" 
              @click="setSlide(index)"
            ></span>
          </div>
          <div class="carousel-arrows">
            <button class="arrow-btn prev-arrow" @click="prevSlide">
              <span>◀</span>
            </button>
            <button class="arrow-btn next-arrow" @click="nextSlide">
              <span>▶</span>
            </button>
          </div>
        </div>
      </div>
    </section>

    <!-- Enhanced CTA Section -->
    <section class="cta-section">
      <div class="cta-content">
        <h2 class="cta-title">Ready to Get Started?</h2>
        <p class="cta-description">
          Create your Admin account now and take control of your entire workflow.
          Whether you're a small team or a growing enterprise, our platform scales with your business.
        </p>
        <div class="cta-button-container">
          <a href="https://vexmacloud.com/pricing" target="_blank" class="cta-button">
            View Pricing Plans <span class="btn-icon">→</span>
          </a>
        </div>
      </div>
      <div class="cta-animation">
        <div class="pulse-circle"></div>
        <div class="pulse-circle delay-1"></div>
        <div class="pulse-circle delay-2"></div>
      </div>
    </section>
    
    <!-- Testimonials Section -->
    <section class="testimonials-section">
      <div class="section-divider">
        <span class="divider-line"></span>
        <span class="divider-text">What Our Customers Say</span>
        <span class="divider-line"></span>
      </div>
      
      <div class="testimonials-grid">
        <div class="testimonial-card">
          <div class="quote-mark">"</div>
          <p class="testimonial-text">Their platform's agility and paperless job cards streamlined our processes. Highly recommend Vexma Cloud for its innovative solutions and exceptional support team.</p>
          <div class="testimonial-author">
            <div class="author-avatar">PB</div>
            <div class="author-info">
              <div class="author-name">Pathik bhatt</div>
              <div class="author-role">Project Manager</div>
              <div class="rating">★★★★★</div>
            </div>
          </div>
        </div>
        
        <div class="testimonial-card">
          <div class="quote-mark">"</div>
          <p class="testimonial-text">Vexma's comprehensive part tracking and customer dashboard enhanced our efficiency. Outstanding experience with seamless integration and real-time analytics!</p>
          <div class="testimonial-author">
            <div class="author-avatar">U</div>
            <div class="author-info">
              <div class="author-name">Udith</div>
              <div class="author-role">Customer Success</div>
              <div class="rating">★★★★☆</div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, onMounted } from "vue";
import "@/assets/style2.css";

export default defineComponent({
  name: "EnhancedActivationPage",
  setup() {
    const activationSteps = ref([
      {
        title: "Select a Plan",
        description: "Pick the subscription that best fits your needs and business requirements."
      },
      {
        title: "Sign Up as Admin",
        description: "Provide your details to create an Admin account and set up your organization."
      },
      {
        title: "Add Employees & Customers",
        description: "Invite team members and customers via email to join your platform."
      },
      {
        title: "Grant Access",
        description: "Employees and Customers each get their own portal for tasks or inquiries."
      },
      {
        title: "Manage & Monitor",
        description: "Enjoy real-time dashboards, streamlined workflows, and easy collaboration."
      }
    ]);
    
    // Carousel logic
    const currentSlide = ref(0);
    const totalSlides = 7;
    
    const nextSlide = () => {
      currentSlide.value = (currentSlide.value + 1) % totalSlides;
    };
    
    const prevSlide = () => {
      currentSlide.value = (currentSlide.value - 1 + totalSlides) % totalSlides;
    };
    
    const setSlide = (index) => {
      currentSlide.value = index;
    };
    
    // Auto-rotate carousel
    let carouselInterval;
    
    onMounted(() => {
      // Initialize carousel auto-rotation
      carouselInterval = setInterval(() => {
        nextSlide();
      }, 5000);
      
      // Clean up interval on component unmount
      return () => {
        clearInterval(carouselInterval);
      };
    });
    
    return {
      activationSteps,
      currentSlide,
      nextSlide,
      prevSlide,
      setSlide
    };
  }
});
</script>
