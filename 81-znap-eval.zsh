[[ -n "${commands[mcfly]}" ]]   && znap eval mcfly "${commands[mcfly]} init zsh"
[[ -n "${commands[thefuck]}" ]] && znap eval thefuck "${commands[thefuck]} --alias"
[[ -n "${commands[direnv]}" ]]  && znap eval direnv "${commands[direnv]} hook zsh"
