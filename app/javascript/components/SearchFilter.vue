<template>
  <div>
    <input
      type="text"
      v-model="searchQuery"
      placeholder="検索語を入力してください。"
    />
    
    <input
      type="button"
      value="検索"
      @click="fetchResults"
      class="search-button"
    />

    <ul v-if="results.length">
      <li v-for="result in results" :key="result.id">{{ result.title }}</li>
    </ul>
    <p v-else>検索結果がありません。</p>
  </div>
</template>

<script>
import axios from 'axios'; 
import qs from 'qs';

export default {
  data() {
    return {
      searchQuery: '',
      filter: '', 
      results: [], 
    };
  },
  methods: {
    async fetchResults() {
  try {
    const response = await axios.get('/api/posts', {
      params: {
        query: this.searchQuery,
        filter: this.filter,
      },
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      paramsSerializer: (params) => {
        return qs.stringify(params, { indices: false });
      },
    });

    console.log(response.data.posts); 
  } catch (error) {
    console.error(error); 
  }
}
  },
};
</script>

<style scoped>
input, select {
  margin-right: 10px;
}

.search-button {
  display: inline-flex;
  justify-content: center;
  padding: 0.5rem 1rem;
  border: 1px solid transparent;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), 0 1px 3px rgba(0, 0, 0, 0.1);
  font-size: 0.875rem;
  font-weight: 500;
  border-radius: 0.375rem;
  color: white;
  background-color: #4f46e5;
  cursor: pointer;
  transition: background-color 0.2s ease, box-shadow 0.2s ease;
}

.search-button:hover {
  background-color: #4338ca; 
}
</style>
