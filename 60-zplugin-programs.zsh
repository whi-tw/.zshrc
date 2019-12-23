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

zplugin ice from"github" as"program" mv"completion/yadm.zsh_completion -> _yadm" \
	pick"yadm"
zplugin light TheLocehiliosan/yadm

zplugin ice from'gh-r' as'program' mv'*/bin/hub -> hub' \
    atclone'mv */etc/hub.zsh_completion _hub' atpull'%atclone' pick'hub' \
    if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]'
zplugin light github/hub

zplugin ice from'gh-r' as'program' pick'hugo' bpick'*Linux-64*tar.gz'
zplugin light gohugoio/hugo
