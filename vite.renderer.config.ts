import { defineConfig } from 'vite';

export default defineConfig({
  root: 'src/renderer',
  resolve: {
    conditions: ['import', 'module', 'browser', 'default'],
  },
});
