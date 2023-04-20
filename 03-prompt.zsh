# Description: Additions to the p10k prompt

function prompt_paas_subshell_target() {
    local state
    local fg_color
    local icon="󱇲" # nf-md-cloud_lock_outline

    local fmt_prefix=""
    local fmt_suffix=""
    local fmt_prefix_bold="%B"
    local fmt_suffix_bold="%b"

    test -z "${CF_SUBSHELL_TARGET}" && return # Not in a subshell - don't show anything

    case "${CF_SUBSHELL_TARGET}" in
    prod*)
        state="PROD"
        fg_color="196" # Red
        fmt_prefix="${fmt_prefix_bold}"
        fmt_suffix="${fmt_suffix_bold}"
        ;;
    stg*)
        state="STAGING"
        fg_color="#F9A825" # Orange
        ;;
    dev*)
        state="DEV"
        fg_color="#8BC34A" # Green
        ;;
    *)
        state="UNKNOWN"
        fg_color="#CE93D8" # Purple
        ;;
    esac

    p10k segment -s "${state}" -f "${fg_color}" -i "${icon}" -t "${fmt_prefix}${CF_SUBSHELL_TARGET}${fmt_suffix}"

}
if [[ -z "${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS_1[(r)paas_subshell_target]}" ]]; then
    local addition_index="$(( ${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS_1[(i)background_jobs]} + 1))"
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS_1["${addition_index}"]=(paas_subshell_target "${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS_1["${addition_index}"]}")
    unset addition_index
fi
