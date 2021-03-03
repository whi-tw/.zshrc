#
# zinit Programs
#

zinit from"github" as"program" for \
	light-mode if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]' atclone'./bin/goenv init - > zhook.zsh' \
		atpull'%atclone' pick"bin/goenv" src"zhook.zsh" nocompile'!' \
		syndbg/goenv \
	light-mode pick"fasd" atpull"%atclone" src'fasd.zsh' nocompile'!' \
		atclone'./fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install > fasd.zsh' \
		clvv/fasd \
	light-mode mv"completion/yadm.zsh_completion -> _yadm" pick"yadm" nocompile'!' \
		TheLocehiliosan/yadm \
	light-mode pick"bin/git-fuzzy" \
		bigH/git-fuzzy

zinit as"null" wait"2" lucid from"gh-r" for \
	sbin"delta-*/delta" dandavison/delta \
	mv"bat* -> bat" sbin"bat/bat" @sharkdp/bat \
	mv"exa-* -> exa" sbin ogham/exa

zinit as"null" wait"3" lucid for \
    sbin  Fakerr/git-recall \
    sbin  paulirish/git-open \
    sbin  paulirish/git-recent \
    sbin  davidosomething/git-my \
    make"PREFIX=$ZPFX install"  iwata/git-now \
    make"PREFIX=$ZPFX"          tj/git-extras


zinit ice wait'1' lucid from"gh-r" as"program" mv"direnv* -> direnv" \
	if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]' \
	atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
	pick"direnv" src"zhook.zsh" nocompile'!'
zinit light direnv/direnv

zplugin light hlissner/zsh-autopair

alias o='a -e xdg-open'
alias c='a -e code'
alias j='zz'
