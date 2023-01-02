OS := $(shell scripts/detect-os.zsh)

OS_SPECIFIC_FILES := $(wildcard ./os-specific/$(OS)/*)

FILES := $(wildcard ./*.zsh)

INPUT_FILES := $(shell scripts/sort_files.py $(FILES) $(OS_SPECIFIC_FILES))

OUTPUT_FILE := $(HOME)/.zshrc

.PHONY: build
build: $(OUTPUT_FILE)

.zshrc: $(INPUT_FILES)
	@echo "-- Building.zshrc for $(OS)"
	@scripts/build_zshrc.zsh $^ > $@

$(OUTPUT_FILE): .zshrc
	@echo "-- Copying .zshrc to $@"
	@install -bm600 $^ $@
