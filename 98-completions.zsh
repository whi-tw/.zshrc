#
# Completions
# Some (or all) completion plugins require compinit to be loaded and installed
#

# zsh
zinit wait lucid blockf for \
    zsh-users/zsh-completions

# docker
zinit ice as"completion" if'[[ -n "$commands[docker]" ]]'
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# pamac
zinit ice as"completion" if'[[ -n "$commands[pamac]" ]]'
zinit snippet 'https://aur.archlinux.org/cgit/aur.git/plain/_pamac?h=pamac-zsh-completions'

if [[ -n "$commands[aws_completer]" ]]; then
  zinit wait lucid blockf for \
    /usr/bin/aws_zsh_completer.sh
fi

# Syntax Highlighting (should always be at the end)
zinit wait lucid atload"zpcompinit; zpcdreplay; bashcompinit" for \
    zdharma-continuum/fast-syntax-highlighting

if [[ -n "$commands[mcfly]" ]]; then
    source /usr/share/doc/mcfly/mcfly.zsh
elif [[ -n "$commands[fzf]" ]]; then
    source /usr/share/fzf/completion.zsh
    bindkey "^R" | grep -q undefined && source /usr/share/fzf/key-bindings.zsh
fi

if [[ -n "$commands[op]" ]]; then
    eval "$(op completion zsh)"
fi
