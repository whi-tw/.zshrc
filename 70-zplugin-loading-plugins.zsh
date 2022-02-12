#
# zinit Loading plugins
#

zinit light zdharma-continuum/zinit-annex-submods

zinit ice if'[[ -z "${commands[lsd]}" ]]'
zinit pack for ls_colors

zinit ice wait lucid
zinit load redxtech/zsh-asdf-direnv
PATH="${HOME}/.asdf/shims:${PATH}"

zinit light whi-tw/zsh-starship

zinit wait'1' lucid for \
	light-mode laggardkernel/zsh-thefuck

zinit for \
	light-mode "chrissicool/zsh-256color" \
	light-mode peterhurford/git-it-on.zsh \
	light-mode diazod/git-prune \
	light-mode jreese/zsh-titles
