import { createApp } from 'vue';  
import SearchFilter from '../components/SearchFilter.vue';  

document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('vue-search-filter');
  if (el) {
    createApp(SearchFilter).mount(el);  
  }
});
