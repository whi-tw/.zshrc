# .zshrc


Rather than having a single monolithic `~/.zshrc`, I have split it up into multiple files.

To allow for caching and more 'sane' ordering, I build `~/.zshrc` from these files instead of loading the directory recursively.

This has the benefit of allowing os-specific configuration to be selected at build time, rather than at runtime - this has a marginal effect on shell startup time.

# Contents
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Configuration](#configuration)
- [Setup](#setup)
- [Organization and file naming](#organization-and-file-naming)
  - [OS-Specific configuration](#os-specific-configuration)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Configuration

This uses [zsh-snap][znap] for plugin management, and will setup [asdf][asdf] (via [00-init.zsh](00-init.zsh)).

The prompt is [Powerlevel10k][powerlevel10k]

## Setup

1. Clone this somewhere
1. `make`
1. Manually run the commands in `82-znap-install.zsh` (ie. copy and paste, excluding `false &&`)

## Organization and file naming

This is somewhat organised with the files having a numeric prefix (`##-something.zsh`). There isn't a *good* reason why I have named the files as I have. I think it made sense when I first started using this process.

Essentially:

* <10: Base requirements (znap, asdf, homebrew config, prompt configuration)
* 10-19: Low-level stuff (think `zsh` config) lives in the low numbers (so it is read first)
* 20-29: Misc early-load things
* 30-39: aliases / functions / envars and such
* 40-59: Excluded via `.gitignore` - useful for things which might give too much away about your local machine?
* 60-79: Misc late-load things
* 80-89: `znap` commands (see [znap docs][znap] for usage)
* 90-99: Late-run stuff (kicking off the prompt etc.)

### OS-Specific configuration

OS-specific configuration is located at `os-specific/{os}/*.zsh`. The os is identified at build-time via [detect-os.zsh][detect-os-script]. The naming of these files (and therefore the position in the generated `.zshrc` is the same as those in the root of the repository.

I haven't done much to protect from potential ordering-related foot canons here, so if two files are named the same, it's possible the os-specific one will be written out first. In cases where this could be a problem, a decimal can be added to the filename: `##.#-something.zsh`. This will then be ordered second (see [detect-os.zsh][detect-os-script] for the actual logic).


[comment]: # (External Links)

[znap]: <https://github.com/marlonrichert/zsh-snap> "zsh-snap"
[asdf]: <https://github.com/asdf-vm/asdf> "asdf"
[powerlevel10k]: <https://github.com/romkatv/powerlevel10k> "Powerlevel10k"
[detect-os-script]: <scripts/detect-os.zsh> "detect-os.zsh"
