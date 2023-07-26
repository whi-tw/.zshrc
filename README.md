# .zshrc

Rather than having a single monolithic `~/.zshrc`, I have split it up into multiple files.

To allow for caching and more 'sane' ordering, I build `~/.zshrc` from these files instead of loading the directory recursively.

This has the benefit of allowing os-specific configuration to be selected at build time, rather than at runtime - this has a marginal effect on shell startup time.

## Contents

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

## Organization and file naming

This is somewhat organised with the files having a numeric prefix (`##-something.zsh`). There isn't a _good_ reason why I have named the files as I have. I think it made sense when I first started using this process.

Files are sorted by name with the following rules:

1. the lowest initial integer comes first (ie. `30.1-something` and `30-something` have the same priority)
2. the file with the fewest parent directories comes first (ie. `30-something` = 0, `os-specific/some_os/30-something` = 2)
3. the file with the lowest initial float comes first (ie. `30-something` comes before `30.1-something`)
4. the filenames alphabetically sorted (ie. `30-something` comes before `30-tomething`)

This is done by [sort_files.py][sort-files-script].

Essentially:

- <9: Base requirements (znap, asdf, homebrew config, [things that may write to stdout][powerlevel10k_instant])
- 9: Powerlevel10k instant prompt
- 10-19: Low-level stuff (think `zsh` config) lives in the low numbers (so it is read first)
- 20-29: Misc early-load things
- 30-39: aliases / functions / envars and such
- 40-59: Excluded via `.gitignore` - useful for things which might give too much away about your local machine?
- 60-79: Misc late-load things
- 80-89: `znap` commands (see [znap docs][znap] for usage)
- 90-99: Late-run stuff (kicking off the prompt etc.)

This could be complete rubbish though - I move files around quite often and will likely have forgotten to update this readme.
It's probably mostly right though.

### OS-Specific configuration

OS-specific configuration is located at `os-specific/{os}/*.zsh`. The os is identified at build-time via [detect-os.zsh][detect-os-script]. The naming of these files (and therefore the position in the generated `.zshrc`) is the same as those in the root of the repository (although os-specific files will always be placed after generics with the same name (see: [sort_files.py][sort-files-script])).

[znap]: https://github.com/marlonrichert/zsh-snap "zsh-snap"
[asdf]: https://github.com/asdf-vm/asdf "asdf"
[powerlevel10k]: https://github.com/romkatv/powerlevel10k "Powerlevel10k"
[powerlevel10k_instant]: https://github.com/romkatv/powerlevel10k/tree/master#how-do-i-configure-instant-prompt "Powerlevel10k instant prompt"
[detect-os-script]: scripts/detect-os.zsh "detect-os.zsh"
[sort-files-script]: scripts/sort_files.py "sort-files.py"
