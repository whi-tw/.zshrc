export _COMPLETION_GEN_CMDNAME=yq
export _COMPLETION_GEN_GENCMD=(yq shell-completion zsh)

if ((! $+commands[${_COMPLETION_GEN_CMDNAME}])); then
    return
fi
gen_my_completion
