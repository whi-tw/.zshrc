#
# zinit Loading plugins
#

zinit light zdharma-continuum/zinit-annex-submods

if [[ -n "$commands[gdircolors]" ]]; then
	dircolors_cmd='gdircolors'
else
	dircolors_cmd='dircolors'
fi

zinit pack for ls_colors

zinit ice lucid atclone"./libexec/pyenv init -> zpyenv.zsh; ./libexec/pyenv init --path > zpyenvpath.zsh" \
	atinit'export PYENV_ROOT="${HOME}/.pyenv"' atpull"%atclone" \
	as'program' pick'bin/pyenv' multisrc"zpyenv{,path}.zsh" nocompile'!'
zinit light pyenv/pyenv

zinit ice wait'1' lucid atclone"./libexec/rbenv init -> zrbenv.zsh" \
	atinit'export RBENV_ROOT="${HOME}/.rbenv"' atpull"%atclone" \
	as'program' pick'bin/rbenv' src"zrbenv.zsh" nocompile'!'
zinit light rbenv/rbenv

zinit ice wait'1' lucid atclone"ln -s nodeenv.py nodeenv" \
	atpull"%atclone" \
	as'program' pick'nodeenv' nocompile'!'
zinit light whi-tw/nodeenv

zinit wait'1' lucid for \
	light-mode laggardkernel/zsh-thefuck \
	light-mode cda0/zsh-tfenv
export THEFUCK_PRIORITY="git_hook_bypass=1100" # push branch priority

zinit for \
	light-mode "chrissicool/zsh-256color" \
	light-mode peterhurford/git-it-on.zsh \
	light-mode diazod/git-prune \
	light-mode jreese/zsh-titles
