OS := $(shell scripts/detect-os.zsh)
OS_SPECIFIC_FILES := $(wildcard ./os-specific/$(OS)/*.zsh)
FILES := $(wildcard ./*.zsh)
INPUT_FILES := $(shell scripts/sort_files.py $(FILES) $(OS_SPECIFIC_FILES))

NON_ZSHRC_FILES := Makefile $(wildcard ./scripts/*)

OUTPUT_FILE := $(HOME)/.zshrc
export SOURCE_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: build
build: $(OUTPUT_FILE)

.zshrc: $(INPUT_FILES) $(NON_ZSHRC_FILES)
	@echo "-- Building .zshrc for $(OS)"
	@scripts/build_zshrc.zsh $(INPUT_FILES) > .zshrc

$(OUTPUT_FILE): .zshrc
	@echo "-- Copying .zshrc to $(OUTPUT_FILE)"
	@install -bm400 .zshrc $(OUTPUT_FILE)

clean:
	@echo "-- Cleaning up .zshrc (not $(OUTPUT_FILE)!)"
	@rm -f .zshrc
