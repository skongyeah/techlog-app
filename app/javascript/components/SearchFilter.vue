<template>
  <div>
    <input
      type="text"
      v-model="searchQuery"
      placeholder="検索語を入力してください。"
      @input="fetchResults"
    />
    <p>
        배불러.... 돼지 같이 머금
    </p>
    <select v-model="filter" @change="fetchResults">
      <option value="">전체</option>
      <option value="category1">카테고리 1</option>
      <option value="category2">카테고리 2</option>
    </select>
    <ul>
      <li v-for="item in results" :key="item.id">{{ item.name }}</li>
    </ul>
  </div>
</template>

<script>
export default {
    mounted(){
        console.log('success!')
    },
    data() {
    return {
      searchQuery: '',
      filter: '',
      results: [],
    };
  },
  methods: {
    async fetchResults() {
      const response = await fetch(
        `/api/items?query=${this.searchQuery}&filter=${this.filter}`
      );
      this.results = await response.json();
    },
  },
};
</script>

<style scoped>
input, select {
  margin-right: 10px;
}
</style>

