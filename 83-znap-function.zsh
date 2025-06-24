# # workaround for 1password-cli squashing completion functions of plugins
# function __my_op_plugin_run() {
#     _op_plugin_run
#     for ((i = 2; i < CURRENT; i++)); do
#         if [[ ${words[i]} == -- ]]; then
#             shift $i words
#             ((CURRENT -= i))
#             _normal
#             return
#         fi
#     done

# }

# function __load_op_completion() {
#     completion_function="$(op completion zsh)"
#     sed -E 's/^( +)_op_plugin_run/\1__my_op_plugin_run/' <<<"${completion_function}"
#     unfunction __load_op_completion
# }

# function _op {
#     unfunction _op
#     eval "$(__load_op_completion)"
#     _op "$@"
# }

# compdef _op op
