import { defineConfig } from 'vite';
import path from 'path';

export default defineConfig({
  root: 'src/renderer',
  resolve: {
    conditions: ['import', 'module', 'browser', 'default'],
  },
  build: {
    outDir: path.resolve(__dirname, '.vite/renderer/main_window'),
  },
});
