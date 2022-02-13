export _COMPLETION_GEN_CMDNAME=gh
export _COMPLETION_GEN_GENCMD=(gh completion -s zsh)

if ((! $+commands[${_COMPLETION_GEN_CMDNAME}])); then
    return
fi
gen_my_completion
