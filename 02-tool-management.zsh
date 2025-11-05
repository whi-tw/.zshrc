(( ! $+commands[usage] )) && zinit as="command" lucid from="gh-r" for \
    id-as="usage" \
    atpull="%atclone" \
    jdx/usage

if [[ -z ${commands[mise]} ]]; then
    zinit as="command" lucid from="gh-r" for \
        id-as="mise" mv="mise* -> mise" \
        atclone="./mise* completion zsh > _mise" \
        atpull="%atclone" \
        atload='eval "$(mise activate zsh)"' \
        jdx/mise
else
    eval "$(mise activate zsh)"
fi
