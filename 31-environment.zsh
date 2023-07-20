__command_is_present nano && {
    export VISUAL="${VISUAL:-nano}"
    export EDITOR="${EDITOR:-${VISUAL}}"
}

__command_is_present ssh-askpass && export SSH_ASKPASS="ssh-askpass"


if [[ -S "${XDG_RUNTIME_DIR}/ssh-agent.socket" ]]
then
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
fi

__command_is_present bat && export PAGER="bat --style=plain"

export RYE_HOME="${HOME}/.rye"
