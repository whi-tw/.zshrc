# Description: Additions to $PATH

# Add krew's bin directory to $PATH (kubectl plugins)
__command_is_present kubectl-krew && [[ -d "${HOME}/.krew/bin" ]] && {
    export PATH="${HOME}/.krew/bin:${PATH}"
}

# source rye's env if it's present

[[ -r "${RYE_HOME}/env" ]] && {
    source "${RYE_HOME}/env"
}
