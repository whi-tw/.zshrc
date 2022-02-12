#
# Completions
# Some (or all) completion plugins require compinit to be loaded and installed
#

# zsh
zinit wait lucid blockf for \
    zsh-users/zsh-completions

zinit ice as "completion"
zinit light blimmer/zsh-aws-vault

# docker
zinit ice as"completion" if'[[ -n "${commands[docker]}" ]]'
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# docker-compose
zinit ice as"completion" if'[[ -n "$commands[docker-compose]" ]]'
zinit snippet https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose

# pamac
zinit ice as"completion" if'[[ -n "${commands[pamac]}" ]]'
zinit snippet 'https://aur.archlinux.org/cgit/aur.git/plain/_pamac?h=pamac-zsh-completions'

# openshift cli
zinit ice as"completion" if'[[ -n "${commands[oc]}" ]]'
zinit snippet https://raw.githubusercontent.com/chmouel/oh-my-zsh-openshift/master/_oc

zinit snippet OMZP::helm
zinit snippet OMZP::kubectl
zinit snippet OMZP::fzf
zinit snippet https://gist.githubusercontent.com/whi-tw/e1ede8654707b1203d78c4e9d663f803/raw/0bf28ae754366b6f8ccc750c9455b981e69cf8a3/gh.plugin.zsh

if [[ -n "${commands[aws_completer]}" ]]; then
    complete -C "${commands[aws_completer]}" aws
fi

# Syntax Highlighting (should always be at the end)
zinit wait lucid atload"zpcompinit; zpcdreplay; bashcompinit" for \
    zdharma-continuum/fast-syntax-highlighting
