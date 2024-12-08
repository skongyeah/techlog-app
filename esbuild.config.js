// esbuild.config.js
const esbuild = require('esbuild');
const vuePlugin = require('@vitejs/plugin-vue');

esbuild.build({
  entryPoints: ['./app/javascript/packs/application.js'],  // entry 파일 경로
  bundle: true,
  outdir: './public/packs',  // output 파일 경로
  plugins: [vuePlugin()],  // Vue 플러그인 추가
  watch: process.env.RAILS_ENV === 'development',  // 개발 모드에서만 watch 모드 활성화
}).catch(() => process.exit(1));
