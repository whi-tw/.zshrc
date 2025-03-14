[[ "$TERM_PROGRAM" == "vscode" ]] && {
    local CODE_CMD="${_VSCODE_SHELL_CMD:-code}"
    . "$("${CODE_CMD}" --locate-shell-integration-path zsh)"
    [[ "${CODE_CMD}" != "code" ]] && alias code="${CODE_CMD}"
}
