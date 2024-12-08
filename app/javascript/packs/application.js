
import Vue from 'vue';  // Vue.js 임포트
import SearchFilter from '../components/SearchFilter.vue';  // Vue 컴포넌트 임포트

document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('app');  // '#app' 엘리먼트를 찾음
  if (el) {
    new Vue({
      render: h => h(SearchFilter),  // Vue 컴포넌트를 렌더링
    }).$mount(el);  // '#app' 엘리먼트에 Vue 인스턴스를 마운트
  }
});
