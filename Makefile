.PHONY: dependencies lint test build sec dev

dependencies:
	npm ci

lint: dependencies
	npx prettier --check "src/**/*.ts"
	npx eslint src/

test: dependencies
	npx vitest run

build: dependencies
	npx electron-forge package

sec: dependencies
	npm audit --audit-level=high

dev: dependencies
	npx electron-forge start
