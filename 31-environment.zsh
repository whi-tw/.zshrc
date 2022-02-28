if [[ -n "${commands[nano]}" ]] && [[ "${TERM_PROGRAM}" != "vscode" ]]; then
    export VISUAL="${commands[nano]}"
    export EDITOR="${VISUAL}"
fi

if [[ -f "${HOME}/.config/systemd/user/ssh-add.service" ]]; then
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
    export SSH_ASKPASS="/usr/bin/ksshaskpass"
fi
if [[ -n "${commands[kwallet-query]}" ]]; then
    export AWS_VAULT_BACKEND="kwallet"
fi
