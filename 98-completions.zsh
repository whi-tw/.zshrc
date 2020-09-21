#
# Completions
# Some (or all) completion plugins require compinit to be loaded and installed
#

# zsh
zinit ice wait"0" blockf lucid
zinit light zsh-users/zsh-completions

# docker
zinit ice as"completion" if'[[ -n "$commands[docker]" ]]'
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# pamac
zinit ice as"completion" if'[[ -n "$commands[pamac]" ]]'
zinit snippet 'https://aur.archlinux.org/cgit/aur.git/plain/_pamac?h=pamac-zsh-completions'

# Syntax Highlighting (should always be at the end)
zinit ice wait"0" atinit"zpcompinit; zpcdreplay; bashcompinit" lucid
zinit light zdharma/fast-syntax-highlighting

if [[ -n "$commands[mcfly]" ]]; then
    source /usr/share/doc/mcfly/mcfly.zsh
elif [[ -n "$commands[fzf]" ]]; then
    source /usr/share/fzf/completion.zsh
    bindkey "^R" | grep -q undefined && source /usr/share/fzf/key-bindings.zsh
fi
