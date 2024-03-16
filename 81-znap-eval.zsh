(( $+commands[mcfly] ))   && znap eval mcfly 'mcfly init zsh'
(( $+commands[thefuck] )) && znap eval thefuck 'thefuck --alias'
(( $+commands[direnv] ))  && znap eval direnv_hook 'direnv hook zsh'
(( $+commands[zoxide] ))  && znap eval zoxide 'zoxide init --cmd=z zsh'
