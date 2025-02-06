if [[ -z "${ZSH_CACHE_DIR}" ]]; then
    if [[ -n "${XDG_CACHE_HOME}" ]]; then
        export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/.zsh"
    else
        export ZSH_CACHE_DIR="${HOME}/.cache/.zsh"
    fi
fi

[[ -d "${ZSH_CACHE_DIR}" ]] || mkdir -p "${ZSH_CACHE_DIR}"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone --depth 1 -- https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
