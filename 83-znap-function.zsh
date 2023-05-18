znap function _pip_completion pip 'eval "$( pip completion --zsh )"'
compctl -K _pip_completion pip

znap function _python_argcomplete pipx 'eval "$( register-python-argcomplete pipx  )"'
complete -o nospace -o default -o bashdefault \
    -F _python_argcomplete pipx

znap function _poetry poetry 'eval "$(poetry completions zsh --alias poetry | sed "s/_poetry_.*_complete/_poetry/g")"'
compdef _poetry poetry

# function __rye_run_insertion() {
#     echo "$(date) - CURRENT=${CURRENT} words=${words[@]}" >>/tmp/rye_run_insertion
#     for ((i = 1; i < CURRENT; i++)); do
#         echo "words[i]=${words[i]}" >>/tmp/rye_run_insertion
#         if [[ ${words[i]} == -- ]]; then
#             shift $i words
#             ((CURRENT -= i))
#             _normal
#             return 0
#         fi
#     done
#     return 1
# }

# function __load_rye_completion() {
#     completion_function="$(rye self completion -s zsh)"
#     awk '
#             /\(run\)/ && !flag && !found { flag = 1; found=1; print; next } \
#             flag && /;;/ { flag = 0; print "__rye_run_insertion && ret=1"; print; next } \
#             1
#         ' <<<"${completion_function}"
# }
znap function __not_rye rye 'eval rye self completion -s zsh'
# znap function _rye rye 'eval "$(__load_rye_completion)"'
compdef _rye rye

# workaround for 1password-cli squashing completion functions of plugins
function __my_op_plugin_run() {
    _op_plugin_run
    echo "$(date) - CURRENT=${CURRENT} words=${words[@]}" >>/tmp/op_run_insertion
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
