znap install \
    zsh-users/zsh-completions \
    asdf-vm/asdf

(( $+commands[nix] )) && {
    znap install nix-community/nix-zsh-completions
}
