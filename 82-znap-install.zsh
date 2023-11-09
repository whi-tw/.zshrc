znap install \
    zsh-users/zsh-completions \
    asdf-vm/asdf

__command_is_present nix && {
    znap install nix-community/nix-zsh-completions
}
