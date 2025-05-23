document.addEventListener('DOMContentLoaded', function() {
    const carousel = document.querySelector('.carousel-slides');
    const slides = document.querySelectorAll('.carousel-slide');
    const prevBtn = document.querySelector('.arrow-btn:first-child');
    const nextBtn = document.querySelector('.arrow-btn:last-child');
    let currentSlide = 0;
    let touchStartX = 0;
    let touchEndX = 0;
    let isSwiping = false;

    // Function to show a specific slide
    function showSlide(index) {
        slides.forEach(slide => slide.classList.remove('active'));
        currentSlide = (index + slides.length) % slides.length;
        slides[currentSlide].classList.add('active');
    }

    // Function to show next slide
    function nextSlide() {
        showSlide(currentSlide + 1);
    }

    // Function to show previous slide
    function prevSlide() {
        showSlide(currentSlide - 1);
    }

    // Click event listeners for buttons
    if (prevBtn) prevBtn.addEventListener('click', prevSlide);
    if (nextBtn) nextBtn.addEventListener('click', nextSlide);

    // Keyboard event listener
    document.addEventListener('keydown', function(e) {
        if (e.key === 'ArrowLeft') {
            prevSlide();
        } else if (e.key === 'ArrowRight') {
            nextSlide();
        }
    });

    // Touch events for swipe
    if (carousel) {
        carousel.addEventListener('touchstart', function(e) {
            touchStartX = e.changedTouches[0].screenX;
            isSwiping = true;
        }, { passive: true });

        carousel.addEventListener('touchmove', function(e) {
            if (!isSwiping) return;
            
            const currentX = e.changedTouches[0].screenX;
            const diff = touchStartX - currentX;
            
            // Add visual feedback during swipe
            if (Math.abs(diff) > 10) {
                const direction = diff > 0 ? 1 : -1;
                slides[currentSlide].style.transform = `translateX(${diff * 0.5}px)`;
                slides[currentSlide].style.transition = 'none';
            }
        }, { passive: true });

        carousel.addEventListener('touchend', function(e) {
            if (!isSwiping) return;
            
            touchEndX = e.changedTouches[0].screenX;
            handleSwipe();
            isSwiping = false;
            
            // Reset transform
            slides[currentSlide].style.transform = '';
            slides[currentSlide].style.transition = '';
        }, { passive: true });

        carousel.addEventListener('touchcancel', function() {
            isSwiping = false;
            // Reset transform
            slides[currentSlide].style.transform = '';
            slides[currentSlide].style.transition = '';
        }, { passive: true });
    }

    // Handle swipe gesture
    function handleSwipe() {
        const swipeThreshold = 50; // Minimum distance for swipe
        const diff = touchStartX - touchEndX;

        if (Math.abs(diff) > swipeThreshold) {
            if (diff > 0) {
                // Swipe left
                nextSlide();
            } else {
                // Swipe right
                prevSlide();
            }
        }
    }

    // Initialize first slide
    showSlide(0);
}); 