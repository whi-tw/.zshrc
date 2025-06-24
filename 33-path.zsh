# Description: Additions to $PATH

# Add krew's bin directory to $PATH (kubectl plugins)
(( $+commands[kubectl-krew] )) && [[ -d "${HOME}/.krew/bin" ]] &&
    export path=("${HOME}/.krew/bin" ${path})
