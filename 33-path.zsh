# Description: Additions to $PATH

# Add krew's bin directory to $PATH (kubectl plugins)
__command_is_present kubectl-krew && [[ -d "${HOME}/.krew/bin" ]] && {
    export PATH="${HOME}/.krew/bin:${PATH}"
}
