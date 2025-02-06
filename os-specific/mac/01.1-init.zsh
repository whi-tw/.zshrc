[[ -x "/opt/homebrew/bin/brew" ]] && {
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export fpath=( ${HOMEBREW_PREFIX}/share/zsh/site-functions $fpath )
}
