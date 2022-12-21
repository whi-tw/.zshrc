alias batjson="bat -l json"

function jqbat() {
    jq "${@}" | batjson --style=plain
}
[[ -n "${_comps[jq]}" ]] && compdef jqbat=jq

alias batyaml="bat -l yaml"

function yqbat() {
    yq "${@}" | batyaml --style=plain
}

[[ -n "${_comps[yq]}" ]] && compdef yqbat=yq
