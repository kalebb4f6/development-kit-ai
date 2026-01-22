.PHONY: test lint install help release

# Default target
help:
	@echo "kb-ai Makefile"
	@echo ""
	@echo "Usage:"
	@echo "  make test      Run tests"
	@echo "  make lint      Run shellcheck linting"
	@echo "  make install   Install kb-ai to ~/.local/bin"
	@echo "  make release   Create a new release (usage: make release VERSION=1.0.1)"
	@echo ""

# Run tests
test:
	@chmod +x tests/test_cli.sh
	@./tests/test_cli.sh

# Lint bash scripts
lint:
	@echo "Linting bin/kb-ai..."
	@shellcheck bin/kb-ai || true
	@echo ""
	@echo "Linting scripts/kb-ai..."
	@shellcheck scripts/kb-ai || true

# Install CLI
install:
	@echo "Installing kb-ai to ~/.local/bin..."
	@mkdir -p ~/.local/bin
	@cp bin/kb-ai ~/.local/bin/kb-ai
	@chmod +x ~/.local/bin/kb-ai
	@echo "Done! Make sure ~/.local/bin is in your PATH"

# Create a release tag
release:
ifndef VERSION
	$(error VERSION is required. Usage: make release VERSION=1.0.1)
endif
	@echo "Creating release v$(VERSION)..."
	@git tag -a "v$(VERSION)" -m "Release v$(VERSION)"
	@echo "Tag created. Push with: git push origin v$(VERSION)"
