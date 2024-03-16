# Description: Additions to $PATH

# Add krew's bin directory to $PATH (kubectl plugins)
(( $+commands[kubectl-krew] )) && [[ -d "${HOME}/.krew/bin" ]] &&
    export path=("${HOME}/.krew/bin" ${path})

# Add Go's bin directory to $PATH
[[ -d "${HOME}/go/bin" ]] && export path=("${HOME}/go/bin" ${path})

[[ -d "${HOME}/.nix-profile/bin" ]] && export path=("${HOME}/.nix-profile/bin" ${path})
