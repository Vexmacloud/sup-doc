<template>
  <div class="topbar-container">
    <div class="topbar-content">
      <!-- Logo -->
      <div class="logo-container">
        <!-- Logo placeholder -->
      </div>

      <!-- Hamburger Menu for Mobile -->
      <button class="menu-toggle" @click="toggleMobileMenu" aria-label="Toggle Menu">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
          stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="3" y1="12" x2="21" y2="12"></line>
          <line x1="3" y1="6" x2="21" y2="6"></line>
          <line x1="3" y1="18" x2="21" y2="18"></line>
        </svg>
      </button>

      <div class="role-selector" :class="{ 'mobile-visible': mobileMenuOpen }">
        <router-link 
          to="/admin/devs/introduction" 
          class="role-btn" 
          :class="{ 'active': isActive('admin') }"
        >
          Admin
        </router-link>

        <router-link 
          to="/employee/devs/introduction" 
          class="role-btn" 
          :class="{ 'active': isActive('employee') }"
        >
          Employee
        </router-link>

        <router-link 
          to="/customer/devs/introduction" 
          class="role-btn" 
          :class="{ 'active': isActive('customer') }"
        >
          Customer
        </router-link>
      </div>

      <div class="search-container" :class="{ 'mobile-visible': mobileMenuOpen }">
        <div class="search-wrapper">
          <input type="text" class="search-input" placeholder="How can we help you..." aria-label="Search"
            v-model="searchTerm" @keyup.enter="handleSearch" ref="searchInput" />
          <button class="search-btn" @click="handleSearch" :disabled="isLoading" aria-label="Search">
            <span v-if="!isLoading" class="search-icon">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
              </svg>
            </span>
            <span v-else class="loading-spinner"></span>
          </button>
        </div>
      </div>
    </div>

    <!-- Search Results Indicator -->
    <div v-if="searchActive" class="search-results-info">
      <div class="results-navigation">
        <span>{{ currentMatchIndex + 1 }} of {{ totalMatches }} matches</span>
        <div class="navigation-buttons">
          <button @click="navigateToPreviousMatch" :disabled="currentMatchIndex <= 0" aria-label="Previous match">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <polyline points="15 18 9 12 15 6"></polyline>
            </svg>
          </button>
          <button @click="navigateToNextMatch" :disabled="currentMatchIndex >= totalMatches - 1"
            aria-label="Next match">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <polyline points="9 18 15 12 9 6"></polyline>
            </svg>
          </button>
        </div>
        <button @click="closeSearch" class="close-search" aria-label="Close search">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <line x1="18" y1="6" x2="6" y2="18"></line>
            <line x1="6" y1="6" x2="18" y2="18"></line>
          </svg>
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent, ref, onMounted, onBeforeUnmount, watch } from 'vue';
import { useRoute } from 'vue-router';

export default defineComponent({
  name: 'Topbar',
  setup() {
    const isLoading = ref(false);
    const searchInput = ref(null);
    const currentRole = ref('admin');
    const mobileMenuOpen = ref(false);
    const searchTerm = ref('');
    const searchMatches = ref([]);
    const currentMatchIndex = ref(0);
    const totalMatches = ref(0);
    const searchActive = ref(false);
    const visibleAside = ref(null);
    const route = useRoute()
    const isActive = (role) => {
      return route.path.startsWith(`/${role}/devs`);
    };
    const toggleMobileMenu = () => {
      mobileMenuOpen.value = !mobileMenuOpen.value;
    };

    const handleSearch = async () => {
      if (!searchTerm.value.trim()) return;

      clearHighlights();
      currentMatchIndex.value = 0;
      isLoading.value = true;
      searchActive.value = true;

      try {
        await new Promise(resolve => setTimeout(resolve, 300));
        const matches = highlightMatches(searchTerm.value.trim());
        searchMatches.value = matches;
        totalMatches.value = matches.length;

        if (matches.length > 0) {
          scrollToMatch(matches[0]);
        } else {
          showNoResultsMessage();
          searchActive.value = false;
        }
      } catch (error) {
        console.error('Search error:', error);
        showErrorMessage();
        searchActive.value = false;
      } finally {
        isLoading.value = false;
      }
    };

    const highlightMatches = (term) => {
      const matches = [];
      const regex = new RegExp(term, 'gi');
      const textNodes = getAllTextNodes(document.body, term);

      textNodes.forEach(node => {
        const parent = node.parentNode;
        const originalText = node.textContent;
        const modifiedHtml = originalText.replace(regex, (match) => {
          return `<span class="highlighted-text">${match}</span>`;
        });

        if (originalText !== modifiedHtml) {
          const tempDiv = document.createElement('div');
          tempDiv.innerHTML = modifiedHtml;

          const fragment = document.createDocumentFragment();
          while (tempDiv.firstChild) {
            fragment.appendChild(tempDiv.firstChild);
          }

          parent.replaceChild(fragment, node);

          const highlightedSpans = parent.querySelectorAll('.highlighted-text');
          highlightedSpans.forEach(span => {
            matches.push(span);
          });
        }
      });

      return matches;
    };

    const getAllTextNodes = (root, searchTerm) => {
      const nodes = [];
      const walker = document.createTreeWalker(
        root,
        NodeFilter.SHOW_TEXT,
        {
          acceptNode: function (node) {
            if (!node.parentNode ||
              node.parentNode.nodeName === 'SCRIPT' ||
              node.parentNode.nodeName === 'STYLE' ||
              node.parentNode.classList.contains('topbar-container')) {
              return NodeFilter.FILTER_REJECT;
            }

            if (node.textContent.toLowerCase().includes(searchTerm.toLowerCase()) &&
              node.textContent.trim().length > 0) {
              return NodeFilter.FILTER_ACCEPT;
            }

            return NodeFilter.FILTER_SKIP;
          }
        }
      );

      let node;
      while (node = walker.nextNode()) {
        nodes.push(node);
      }

      return nodes;
    };

    const scrollToMatch = (element) => {
      if (!element) return;

      searchMatches.value.forEach((match, index) => {
        if (index === currentMatchIndex.value) {
          match.classList.add('current-match');
        } else {
          match.classList.remove('current-match');
        }
      });

      element.scrollIntoView({
        behavior: 'smooth',
        block: 'center',
        inline: 'nearest'
      });
    };

    const navigateToNextMatch = () => {
      if (currentMatchIndex.value < totalMatches.value - 1) {
        currentMatchIndex.value++;
        scrollToMatch(searchMatches.value[currentMatchIndex.value]);
      }
    };

    const navigateToPreviousMatch = () => {
      if (currentMatchIndex.value > 0) {
        currentMatchIndex.value--;
        scrollToMatch(searchMatches.value[currentMatchIndex.value]);
      }
    };

    const clearHighlights = () => {
      document.querySelectorAll('.highlighted-text').forEach(span => {
        const parent = span.parentNode;
        if (parent) {
          const textNode = document.createTextNode(span.textContent);
          parent.replaceChild(textNode, span);
        }
      });
      searchMatches.value = [];
    };

    const closeSearch = () => {
      clearHighlights();
      searchActive.value = false;
      searchTerm.value = '';
    };

    const showNoResultsMessage = () => {
      searchTerm.value = 'No results found';
      setTimeout(() => {
        searchTerm.value = '';
      }, 2000);
    };

    const showErrorMessage = () => {
      searchTerm.value = 'Error searching. Please try again.';
      setTimeout(() => {
        searchTerm.value = '';
      }, 2000);
    };

    const handleKeydown = (event) => {
      if (event.key === 'F5' && !event.ctrlKey && !event.shiftKey && !event.altKey) {
        event.preventDefault();
        handleSearch();
      }

      if (event.key === 'Escape' && searchActive.value) {
        closeSearch();
      }

      if (searchActive.value) {
        if (event.key === 'Enter') {
          event.preventDefault();
          if (event.shiftKey) {
            navigateToPreviousMatch();
          } else {
            navigateToNextMatch();
          }
        }

        if (event.key === 'ArrowDown' || event.key === 'ArrowRight') {
          event.preventDefault();
          navigateToNextMatch();
        }

        if (event.key === 'ArrowUp' || event.key === 'ArrowLeft') {
          event.preventDefault();
          navigateToPreviousMatch();
        }
      }
    };

    const handleResize = () => {
      if (window.innerWidth >= 768 && mobileMenuOpen.value) {
        mobileMenuOpen.value = false;
      }
    };

    const closeAside = () => {
      visibleAside.value = null;
    };

    onMounted(() => {
      window.addEventListener('keydown', handleKeydown);
      window.addEventListener('resize', handleResize);
      document.body.addEventListener('click', closeAside);

      if (window.location.search) {
        const params = new URLSearchParams(window.location.search);
        const initialSearchTerm = params.get('search');
        if (initialSearchTerm) {
          searchTerm.value = initialSearchTerm;
          handleSearch();
        }
      }
    });

    onBeforeUnmount(() => {
      window.removeEventListener('keydown', handleKeydown);
      window.removeEventListener('resize', handleResize);
      document.body.removeEventListener('click', closeAside);
      clearHighlights();
    });

    watch(searchTerm, (newVal) => {
      if (newVal && newVal.trim().length > 10) {
        const timer = setTimeout(() => {
          handleSearch();
        }, 500);
        return () => clearTimeout(timer);
      }
    });

    return {
      isActive,
      isLoading,
      searchInput,
      searchTerm,
      handleSearch,
      currentRole,
      mobileMenuOpen,
      toggleMobileMenu,
      searchActive,
      currentMatchIndex,
      totalMatches,
      navigateToNextMatch,
      navigateToPreviousMatch,
      closeSearch,
      visibleAside,
      closeAside
    };
  }
});
</script>

<style>
.topbar-container {
  background:#003ca5;
  padding: 1.2rem 1.5rem;
  position: sticky;
  top: 0;
  z-index: 1000;
  width: 100%;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.topbar-content {
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
  max-width: 1400px;
  margin: 0 auto;
}


.logo-container {
  flex-shrink: 0;
  min-width: 120px;
  position: relative;
  transition: transform 0.3s ease;
}

.logo-container:hover {
  transform: scale(1.05);
}

.menu-toggle {
  display: none;
  background: transparent;
  border: none;
  color: white;
  cursor: pointer;
  padding: 0.5rem;
  transition: all 0.3s ease;
  border-radius: 8px;
}

.menu-toggle:hover {
  background-color: rgba(255, 255, 255, 0.15);
  transform: scale(1.05);
}

.role-selector {
  display: flex;
  gap: 1rem;
  margin-right: auto;
}

.role-btn {
  background: rgba(255, 255, 255, 0.1);
  border: none;
  border-radius: 10px;
  padding: 0.75rem 1.5rem;
  cursor: pointer;
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
  white-space: nowrap;
  font-size: 0.95rem;
  font-weight: 600;
  color: rgba(255, 255, 255, 0.95);
  position: relative;
  overflow: hidden;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
  text-decoration: none;
  letter-spacing: 0.5px;
}

.role-btn:before {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  width: 0;
  height: 0;
  background-color: rgba(255, 255, 255, 0.15);
  border-radius: 50%;
  transform: translate(-50%, -50%);
  transition: width 0.6s ease, height 0.6s ease;
  z-index: -1;
}

.role-btn:hover {
  background-color: rgba(255, 255, 255, 0.2);
  transform: translateY(-3px);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
  color: #ffffff;
}

.role-btn:hover:before {
  width: 300px;
  height: 300px;
}

.role-btn:active {
  transform: translateY(1px);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);
}

.role-btn.active {
  background: linear-gradient(135deg, #4a6fdc 0%, #5a7ce2 100%);
  color: #ffffff;
  box-shadow: 0 6px 12px rgba(74, 111, 220, 0.35);
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.role-btn.active:hover {
  background: linear-gradient(135deg, #5a7ce2 0%, #6a8cf2 100%);
}

.search-container {
  flex-grow: 1;
  max-width: 350px;
  margin-left: auto;
}

.search-wrapper {
  position: relative;
  width: 100%;
  transition: all 0.3s ease;
}

.search-wrapper:focus-within {
  transform: translateY(-2px);
}

.search-input {
  width: 100%;
  padding: 0.75rem 3.5rem 0.75rem 1.25rem;
  border: 2px solid rgba(255, 255, 255, 0.15);
  border-radius: 12px;
  font-size: 1rem;
  height: 46px;
  background-color: rgba(255, 255, 255, 0.08);
  color: #ffffff;
  transition: all 0.3s ease;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
  backdrop-filter: blur(5px);
}

.search-input:focus {
  outline: none;
  border-color: rgba(255, 255, 255, 0.3);
  background-color: rgba(255, 255, 255, 0.12);
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
}

.search-input::placeholder {
  color: rgba(255, 255, 255, 0.6);
  font-style: italic;
}

.search-btn {
  position: absolute;
  right: 5px;
  top: 5px;
  bottom: 5px;
  background: linear-gradient(135deg, #4a6fdc 0%, #5a7ce2 100%);
  color: #ffffff;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0 1rem;
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

.search-btn:hover:not(:disabled) {
  background: linear-gradient(135deg, #5a7ce2 0%, #6a8cf2 100%);
  box-shadow: 0 6px 12px rgba(74, 111, 220, 0.35);
  transform: translateY(-2px);
}

.search-btn:active:not(:disabled) {
  transform: translateY(1px);
  box-shadow: 0 2px 6px rgba(74, 111, 220, 0.25);
}

.search-btn:disabled {
  background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
  cursor: not-allowed;
  opacity: 0.8;
}

.search-icon {
  display: flex;
}

.loading-spinner {
  display: inline-block;
  width: 18px;
  height: 18px;
  border: 2px solid rgba(255, 255, 255, 0.3);
  border-left-color: #ffffff;
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

.highlighted-text {
  background-color: rgba(92, 124, 226, 0.4) !important;
  padding: 0 2px;
  border-radius: 3px;
  transition: background-color 0.3s ease;
  box-shadow: 0 0 0 1px rgba(92, 124, 226, 0.3);
}

.highlighted-text.current-match {
  background-color: rgba(92, 124, 226, 0.8) !important;
  font-weight: bold;
  box-shadow: 0 0 0 2px rgba(92, 124, 226, 0.5);
  padding: 0 3px;
}

.search-results-info {
  background: rgba(13, 29, 80, 0.95);
  color: white;
  padding: 0.875rem 1.5rem;
  margin-top: 1rem;
  border-radius: 12px;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
  backdrop-filter: blur(10px);
  transition: all 0.3s ease;
  animation: fadeIn 0.3s ease-out;
  border: 1px solid rgba(255, 255, 255, 0.1);
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.results-navigation {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.navigation-buttons {
  display: flex;
  gap: 0.875rem;
}

.navigation-buttons button,
.close-search {
  background-color: rgba(255, 255, 255, 0.15);
  border: none;
  border-radius: 8px;
  padding: 0.5rem 0.875rem;
  cursor: pointer;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}

.navigation-buttons button:hover:not(:disabled),
.close-search:hover {
  background-color: rgba(255, 255, 255, 0.25);
  transform: translateY(-2px);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.navigation-buttons button:active:not(:disabled),
.close-search:active {
  transform: translateY(1px);
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);
}

.navigation-buttons button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

/* Responsive styles */
@media (max-width: 767px) {
  .topbar-content {
    flex-direction: row;
    flex-wrap: wrap;
  }

  .menu-toggle {
    display: flex;
    order: 3;
  }

  .role-selector {
    display: none;
    width: 100%;
    order: 4;
    margin: 1rem 0 0;
    flex-direction: column;
  }

  .search-container {
    display: none;
    width: 100%;
    max-width: none;
    order: 5;
    margin: 1rem 0 0;
  }

  .mobile-visible {
    display: flex;
    animation: slideDown 0.4s ease-out;
  }

  @keyframes slideDown {
    from {
      opacity: 0;
      transform: translateY(-15px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  .search-results-info {
    padding: 0.75rem 1rem;
  }

  .results-navigation {
    flex-direction: column;
    gap: 0.75rem;
    align-items: flex-start;
  }

  .navigation-buttons {
    width: 100%;
    justify-content: space-between;
  }

  .close-search {
    margin-left: auto;
  }
}

@media (min-width: 768px) and (max-width: 991px) {
  .role-btn {
    padding: 0.625rem 1.125rem;
    font-size: 0.875rem;
  }

  .search-input {
    font-size: 0.875rem;
    height: 42px;
  }
}
</style>