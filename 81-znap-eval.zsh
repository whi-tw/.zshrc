__command_is_present mcfly   && znap eval mcfly "mcfly init zsh"
__command_is_present thefuck && znap eval thefuck "thefuck --alias"
__command_is_present direnv  && znap eval direnv_hook "direnv hook zsh"
__command_is_present zoxide  && znap eval z "zoxide init zsh"
