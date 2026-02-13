PLATFORM ?= win32
ARCH ?= x64

.PHONY: build-dependencies lint test build sec dev

build-dependencies:
	npm ci

lint: build-dependencies
	npx prettier --check "src/**/*.ts"
	npx eslint src/

test: build-dependencies
	npx vitest run

build: build-dependencies
	npx electron-forge make --platform=$(PLATFORM) --arch=$(ARCH)

sec: build-dependencies
	npm audit --omit=dev --audit-level=high

dev: build-dependencies
	npx electron-forge start
