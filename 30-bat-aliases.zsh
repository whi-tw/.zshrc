alias batjson="bat -l json"

function jqbat() {
    jq "${@}" | batjson --style=plain #--file-name '`'"$(get_pipe_parent_cmdline) | jq ${@}"'`' 
}
compdef jqbat='jq'

alias batyaml="bat -l yaml"

function yqbat() {
    yq "${@}" | batyaml --style=plain
}
compdef yqbat='yq'
