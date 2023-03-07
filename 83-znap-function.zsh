znap function _pip_completion pip 'eval "$( pip completion --zsh )"'
compctl -K _pip_completion pip

znap function _python_argcomplete pipx 'eval "$( register-python-argcomplete pipx  )"'
complete -o nospace -o default -o bashdefault \
    -F _python_argcomplete pipx

znap function _poetry poetry 'eval "$(poetry completions zsh --alias poetry | sed "s/_poetry_.*_complete/_poetry/g")"'
compdef _poetry poetry

# workaround for 1password-cli squashing completion functions of plugins
function __my_op_plugin_run() {
    _op_plugin_run

    for ((i = 2; i < CURRENT; i++)); do
        if [[ ${words[i]} == -- ]]; then
            shift $i words
            ((CURRENT -= i))
            _normal
            return
        fi
    done

}

function __load_op_completion() {
    completion_function="$(op completion zsh)"
    sed -E 's/^( +)_op_plugin_run/\1__my_op_plugin_run/' <<<"${completion_function}"
}

znap function _op op 'eval "$(__load_op_completion)"'
compdef _op op
