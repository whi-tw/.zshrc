# Helper functions
# ----------------
# These are some helper functions to make it easier to check
# the values of environment variables.

function __command_is_present() {
    local _cmds=("${@}")
    for _cmd in "${_cmds[@]}"; do
        test -n "${commands[${_cmd}]}" || return 1
    done
    return 0
}

function __command_is_absent() {
    __command_is_present "${@}" && return 1
}

function __docker_is_present() {
    __command_is_present docker
}
