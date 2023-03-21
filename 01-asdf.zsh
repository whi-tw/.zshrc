[[ -f ~/.asdf/asdf.sh ]] || {
    git clone --branch v0.11.0 -- \
        https://github.com/asdf-vm/asdf.git ~/.asdf
}
source $HOME/.asdf/asdf.sh
