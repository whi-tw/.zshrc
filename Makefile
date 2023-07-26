OS := $(shell scripts/detect-os.zsh)
OS_SPECIFIC_FILES := $(wildcard ./os-specific/$(OS)/*.zsh)
FILES := $(wildcard ./*.zsh)

BUILD_DIR := ./build

OUTPUT_FILE := $(HOME)/.zshrc
export SOURCE_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: build
build: $(OUTPUT_FILE)

.PHONY: profiling
profiling: FILES += $(wildcard ./.profiling/*.zsh)
profiling: build

$(OUTPUT_FILE): $(BUILD_DIR)/.zshrc
	@echo "-- Copying $(BUILD_DIR)/.zshrc to $(OUTPUT_FILE)"
	@install -m400 $(BUILD_DIR)/.zshrc $(OUTPUT_FILE)

$(BUILD_DIR)/.zshrc: .FORCE
	@echo "-- Building .zshrc for $(OS)"
	@scripts/build_zshrc.zsh $$(scripts/sort_files.py $(FILES) $(OS_SPECIFIC_FILES)) > $(BUILD_DIR)/.zshrc

clean:
	@echo "-- Cleaning up .zshrc (not $(OUTPUT_FILE)!)"
	@rm -f .zshrc

.FORCE:
