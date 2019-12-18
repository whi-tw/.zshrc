#
# Zplugin Programs
#

zplugin ice wait"2" lucid as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy

zplugin ice wait'1' lucid from"gh-r" as"program" mv"direnv* -> direnv" \
	if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]' \
	atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
	pick"direnv" src"zhook.zsh"
zplugin light direnv/direnv

zplugin ice from"github" as"program" \
	if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]' \
	atclone'./bin/goenv init - > zhook.zsh' atpull'%atclone' \
	pick"bin/goenv" src"zhook.zsh"
zplugin light syndbg/goenv

zplugin ice wait'1' lucid from"gh-r" as"program"  mv"aws-vault-linux-amd64 -> aws-vault" \
	if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]' \
	pick'aws-vault' ver'v4.7.1' nocompletions
zplugin light 99designs/aws-vault

zplugin ice from"github" as"program" pick"yadm"
zplugin light TheLocehiliosan/yadm

zplugin ice from"gh-r" as"program" pick"lsd" mv'lsd*/lsd -> lsd' \
	if'[[ "${OSTYPE}" =~ "^darwin.*" ]]'
zplugin light Peltoche/lsd

zplugin ice from'gh-r' as'program' mv'*/bin/hub -> hub' \
    atclone'mv */etc/hub.zsh_completion _hub' atpull'%atclone' pick'hub' \
    if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]'
zplugin light github/hub

# lsd aliases
if [[ -n "$commands[lsd]" ]]; then
	alias ls='lsd'
	alias lt='ls --tree'
elif  [[ "${OSTYPE}" =~ "^darwin.*" ]]; then
	alias ls='gls --color=always'
else
	alias ls='ls --color=always'
fi
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
