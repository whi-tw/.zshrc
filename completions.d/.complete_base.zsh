gen_my_completion() {
    # If the completion file does not exist, generate it and then source it
    # Otherwise, source it and regenerate in the background
    if [[ ! -f "${ZSH_CACHE_DIR}/completions/_${_COMPLETION_GEN_CMDNAME}" ]]; then
        ${_COMPLETION_GEN_GENCMD[@]}  >| "${ZSH_CACHE_DIR}/completions/_${_COMPLETION_GEN_CMDNAME}"
        source "${ZSH_CACHE_DIR}/completions/_${_COMPLETION_GEN_CMDNAME}"
    else
        source "${ZSH_CACHE_DIR}/completions/_${_COMPLETION_GEN_CMDNAME}"
        ${_COMPLETION_GEN_GENCMD[@]}  >| "${ZSH_CACHE_DIR}/completions/_${_COMPLETION_GEN_CMDNAME}" &|
    fi
}
