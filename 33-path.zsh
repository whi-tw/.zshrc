# Description: Additions to $PATH

# Add krew's bin directory to $PATH (kubectl plugins)
[[ -n "${commands[kubectl - krew]}" ]] && [[ -d "${HOME}/.krew/bin" ]] && {
    export PATH="${PATH}:${HOME}/.krew/bin"
}
