[[ -x "/opt/homebrew/bin/brew" ]] && znap eval brew "/opt/homebrew/bin/brew shellenv" && export FPATH="${HOMEBREW_PREFIX}/share/zsh/site-functions:${FPATH}"
