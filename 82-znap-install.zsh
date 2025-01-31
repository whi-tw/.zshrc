znap install \
    zsh-users/zsh-completions

(( $+commands[nix] )) && {
    znap install nix-community/nix-zsh-completions
}
