# Helper functions
# ----------------
# These are some helper functions to make it easier to check
# the values of environment variables.

function __command_is_present() {
    test -n "${commands[${1}]}"
}

function __command_is_absent() {
    test -z "${commands[${1}]}"
}

function __docker_is_present() {
    __command_is_present docker
}
