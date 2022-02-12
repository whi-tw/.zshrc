export AWS_VAULT_BACKEND="pass"
export AWS_VAULT_PASS_PREFIX="aws-vault"

if [[ -n "${commands[nano]}" ]] && [[ "${TERM_PROGRAM}" != "vscode" ]]; then
    export VISUAL="${commands[nano]}"
    export EDITOR="${VISUAL}"
fi
