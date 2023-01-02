if [[ -z "${ZSH_CACHE_DIR}" ]]; then
    if [[ -n "${XDG_CACHE_HOME}" ]]; then
        export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/.zsh"
    else
        export ZSH_CACHE_DIR="${HOME}/.cache/.zsh"
    fi
fi

[[ -d "${ZSH_CACHE_DIR}" ]] || mkdir -p "${ZSH_CACHE_DIR}"

[[ -f ~/.znap/zsh-snap/znap.zsh ]] || {
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/zsh-snap
}
source ~/.znap/zsh-snap/znap.zsh

[[ -f ~/.asdf/asdf.sh ]] || {
    git clone --branch v0.11.0 -- \
        https://github.com/asdf-vm/asdf.git ~/.asdf
}
source $HOME/.asdf/asdf.sh
