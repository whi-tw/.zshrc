__command_is_present nano && {
    export VISUAL="${VISUAL:-nano}"
    export EDITOR="${EDITOR:-${VISUAL}}"
}

__command_is_present ssh-askpass && export SSH_ASKPASS="ssh-askpass"


if [[ -e "${XDG_RUNTIME_DIR}/ssh-agent.socket" ]]; then
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
elif [[ -e "${HOME}/.1password/agent.sock" ]]; then
    export SSH_AUTH_SOCK="${HOME}/.1password/agent.sock"
elif [[ -e "${HOME}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" ]]; then
    export SSH_AUTH_SOCK="${HOME}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
fi

__command_is_present bat && export PAGER="bat --style=plain"

export RYE_HOME="${HOME}/.rye"
