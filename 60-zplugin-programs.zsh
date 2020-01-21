#
# zinit Programs
#

zinit ice wait"2" lucid as"program" pick"bin/git-dsf"
zinit light zdharma/zsh-diff-so-fancy

zinit ice wait'1' lucid from"gh-r" as"program" mv"direnv* -> direnv" \
	if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]' \
	atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
	pick"direnv" src"zhook.zsh"
zinit light direnv/direnv

zinit ice from"github" as"program" \
	if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]' \
	atclone'./bin/goenv init - > zhook.zsh' atpull'%atclone' \
	pick"bin/goenv" src"zhook.zsh"
zinit light syndbg/goenv

zinit ice wait'1' lucid from"gh-r" as"program"  mv"aws-vault-linux-amd64 -> aws-vault" \
	if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]' \
	pick'aws-vault' nocompletions
zinit light 99designs/aws-vault

zinit ice from"github" as"program" mv"completion/yadm.zsh_completion -> _yadm" \
	pick"yadm"
zinit light TheLocehiliosan/yadm

zinit ice from'gh-r' as'program' mv'*/bin/hub -> hub' \
    atclone'mv */etc/hub.zsh_completion _hub && chown "${USER}":"$(id -gn ${USER})" _hub && chmod 644 _hub' atpull'%atclone' pick'hub' \
    if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]'
zinit light github/hub

zinit ice from'gh-r' as'program' pick'hugo' bpick'*Linux-64*tar.gz'
zinit light gohugoio/hugo

zinit ice from'gh-r' as'program' pick'docker-credential-pass' \
	if'[[ -n "$commands[pass]" ]] && [[ -n "$commands[docker]" ]]' bpick'docker-credential-pass*amd64*tar.gz'
zinit light docker/docker-credential-helpers