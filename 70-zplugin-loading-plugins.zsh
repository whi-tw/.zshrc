#
# zinit Loading plugins
#

zinit light zdharma/z-p-submods

if [[ -n "$commands[gdircolors]" ]]; then
	dircolors_cmd='gdircolors'
else
	dircolors_cmd='dircolors'
fi

zinit ice wait'1' lucid \
	atclone"${dircolors_cmd} -b LS_COLORS > clrs.zsh" \
	atpull'%atclone' src"clrs.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS
zstyle ':completion:*:default' list-colors \
	${(s.:.)LS_COLORS} # To enable the coloring on completion

#zinit ice wait'0' atload'_zsh_autosuggest_start' lucid
#zinit light zsh-users/zsh-autosuggestions
#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

zinit ice wait'1' lucid atclone"./libexec/pyenv init -> zpyenv.zsh" \
	atinit'export PYENV_ROOT="${HOME}/.pyenv"' atpull"%atclone" \
	as'program' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zinit light pyenv/pyenv

zinit ice wait'1' lucid atclone"./libexec/rbenv init -> zrbenv.zsh" \
	atinit'export RBENV_ROOT="${HOME}/.rbenv"' atpull"%atclone" \
	as'program' pick'bin/rbenv' src"zrbenv.zsh" nocompile'!'
zinit light rbenv/rbenv

zinit ice wait'1' lucid
zinit light laggardkernel/zsh-thefuck

zinit ice wait'1' lucid
zinit light cda0/zsh-tfenv

zinit light "chrissicool/zsh-256color"

zinit light peterhurford/git-it-on.zsh

zinit light diazod/git-prune

zinit light jreese/zsh-titles
