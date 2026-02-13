import { describe, it, expect } from 'vitest';
import { readFileSync } from 'node:fs';
import { resolve } from 'node:path';

describe('package configuration', () => {
  const pkg = JSON.parse(readFileSync(resolve(__dirname, '../../package.json'), 'utf-8'));

  it('should have the correct package name', () => {
    expect(pkg.name).toBe('fbsim-desktop');
  });

  it('should depend on fbsim-ui', () => {
    expect(pkg.dependencies['@whatsacomputertho/fbsim-ui']).toBeDefined();
  });

  it('should have electron as a dev dependency', () => {
    expect(pkg.devDependencies['electron']).toBeDefined();
  });
});
