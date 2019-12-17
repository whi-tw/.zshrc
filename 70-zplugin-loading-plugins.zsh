#
# Zplugin Loading plugins
#

zplugin light zdharma/z-p-submods

if [[ -n "$commands[gdircolors]" ]]; then
	dircolors_cmd='gdircolors'
else
	dircolors_cmd='dircolors'
fi

zplugin ice wait'1' lucid \
	atclone"${dircolors_cmd} -b LS_COLORS > clrs.zsh" \
	atpull'%atclone' src"clrs.zsh"
zplugin light trapd00r/LS_COLORS

zstyle ':completion:*:default' list-colors \
	${(s.:.)LS_COLORS} # To enable the coloring on completion

zplugin ice wait'0' atload'_zsh_autosuggest_start' lucid
zplugin light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

zplugin ice wait'1' lucid atclone"./libexec/pyenv init -> zpyenv.zsh" \
	atinit'export PYENV_ROOT="${HOME}/.pyenv"' atpull"%atclone" \
	as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zplugin light pyenv/pyenv

zplugin ice wait'1' lucid
zplugin light laggardkernel/zsh-thefuck

zplugin light "chrissicool/zsh-256color"

zplugin light peterhurford/git-it-on.zsh

zplugin light whi-tw/git-prune

zplugin light jreese/zsh-titles
