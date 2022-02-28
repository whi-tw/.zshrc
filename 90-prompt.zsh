if [[ -z "${commands[starship]}" ]]; then
    asdf plugin add starship
    asdf install starship latest
    asdf global starship latest
fi
znap eval starship 'starship init zsh --print-full-init'
prompt_starship_precmd
znap prompt starship
