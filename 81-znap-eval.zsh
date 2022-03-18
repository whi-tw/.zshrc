[[ -n "${commands[mcfly]}" ]]   && znap eval mcfly 'mcfly init zsh'
[[ -n "${commands[thefuck]}" ]] && znap eval thefuck 'thefuck --alias'
[[ -n "${commands[direnv]}" ]]  && znap eval direnv 'direnv hook zsh'
