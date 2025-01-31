[[ -x "/opt/homebrew/bin/brew" ]] && {
    if ASDF_SRC_FILE="$(brew --prefix asdf)/libexec/asdf.sh" && test -f "$ASDF_SRC_FILE"; then
        source "$ASDF_SRC_FILE"
    fi
}
