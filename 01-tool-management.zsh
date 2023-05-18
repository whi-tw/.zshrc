# asdf

[[ -f ~/.asdf/asdf.sh ]] || {
    git clone --branch v0.11.0 -- \
        https://github.com/asdf-vm/asdf.git ~/.asdf
}
source $HOME/.asdf/asdf.sh

# rye

[[ -n "${commands[rye]}" ]] && [[ -d "${HOME}/.rye/shims" ]] && {
    RYE_SHIMS_DIR="${HOME}/.rye/shims"
    # remove rye from path, regardless of where it is
    [[ ":$PATH:" == *":${RYE_SHIMS_DIR}:"* ]] && PATH="${PATH//$RYE_SHIMS_DIR:/}"
    # Add rye to the start of $PATH
    export PATH="${RYE_SHIMS_DIR}:${PATH}"
    unset RYE_SHIMS_DIR
}
