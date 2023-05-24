if [[ -z "${ZSH_CACHE_DIR}" ]]; then
    if [[ -n "${XDG_CACHE_HOME}" ]]; then
        export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/.zsh"
    else
        export ZSH_CACHE_DIR="${HOME}/.cache/.zsh"
    fi
fi

[[ -d "${ZSH_CACHE_DIR}" ]] || mkdir -p "${ZSH_CACHE_DIR}"

[[ -r ~/.znap/zsh-snap/znap.zsh ]] || {
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/zsh-snap
}
source ~/.znap/zsh-snap/znap.zsh

fpath=(~/.znap/zsh-snap/functions $fpath) # Workaround for https://github.com/marlonrichert/zsh-snap/issues/249
