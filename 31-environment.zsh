if [[ -n "${commands[nano]}" ]] && [[ "${TERM_PROGRAM}" != "vscode" ]]; then
    export VISUAL="${commands[nano]}"
    export EDITOR="${VISUAL}"
fi

if [[ -n "${commands[ssh-askpass]}" ]]; then
    export SSH_ASKPASS="${commands[ssh-askpass]}"
fi

if [[ -e "${HOME}/.1password/agent.sock" ]]; then
    export SSH_AUTH_SOCK="${HOME}/.1password/agent.sock"
elif [[ -e "${HOME}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" ]]; then
    export SSH_AUTH_SOCK="${HOME}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
elif [[ -f "${HOME}/.config/systemd/user/ssh-add.service" ]]; then
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
    export SSH_ASKPASS="/usr/bin/ksshaskpass"
fi

if [[ -n "${commands[kwallet-query]}" ]]; then
    export AWS_VAULT_BACKEND="kwallet"
fi
