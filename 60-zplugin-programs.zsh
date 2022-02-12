#
# zinit Programs
#

zinit from"github" as"program" for \
	light-mode pick"fasd" atpull"%atclone" src'fasd.zsh' nocompile'!' \
	atclone'./fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install > fasd.zsh' \
	clvv/fasd \
	light-mode pick"bin/git-fuzzy" \
	bigH/git-fuzzy

zinit as"null" wait"3" lucid for \
	sbin Fakerr/git-recall \
	sbin paulirish/git-open \
	sbin paulirish/git-recent \
	sbin davidosomething/git-my \
	make"PREFIX=${ZPFX} install" iwata/git-now \
	make"PREFIX=${ZPFX}" tj/git-extras

zplugin light hlissner/zsh-autopair

alias o='a -e xdg-open'
alias c='a -e code'
alias j='zz'
