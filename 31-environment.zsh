(( $+commands[nano] )) && {
    export VISUAL="${VISUAL:-nano}"
    export EDITOR="${EDITOR:-${VISUAL}}"
}

(( $+commands[ssh-askpass] )) && export SSH_ASKPASS="ssh-askpass"

if [[ -S "${XDG_RUNTIME_DIR}/ssh-agent.socket" ]]; then
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
fi

(( $+commands[bat] )) && export PAGER="bat --style=plain"

export RYE_HOME="${HOME}/.rye"

export path=("${HOME}/.local/bin" ${path})
