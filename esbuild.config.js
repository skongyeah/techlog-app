const vuePlugin = require('esbuild-plugin-vue');

module.exports = {
  entryPoints: ['./app/javascript/packs/application.js'],
  bundle: true,
  outdir: './app/assets/builds',
  plugins: [vuePlugin],
};