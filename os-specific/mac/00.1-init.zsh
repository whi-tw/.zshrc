[[ -x "/opt/homebrew/bin/brew" ]] && {
    znap eval brew "/opt/homebrew/bin/brew shellenv"
    export fpath=( ${HOMEBREW_PREFIX}/share/zsh/site-functions $fpath )
}
