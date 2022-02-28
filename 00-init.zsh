[[ -f ~/.znap/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/zsh-snap
source ~/.znap/zsh-snap/znap.zsh

[[ -f ~/.asdf/asdf.sh ]] ||
    git clone --branch v0.9.0 -- \
        https://github.com/asdf-vm/asdf.git ~/.asdf
source $HOME/.asdf/asdf.sh
