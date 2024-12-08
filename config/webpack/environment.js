const { environment } = require('@rails/webpacker');
const { VueLoaderPlugin } = require('vue-loader');

environment.plugins.append('VueLoaderPlugin', new VueLoaderPlugin());

environment.loaders.append('vue', {
  test: /\.vue$/,
  use: 'vue-loader'
});

module.exports = environment;
