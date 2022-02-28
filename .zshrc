if [ -d "${HOME}/.zshrc.d" ]; then
    for f in "${HOME}"/.zshrc.d/*.zsh; do
        if [[ ! "${f}.zwc" -nt "${f}" ]]; then
            zcompile "${f}" && touch -h "${HOME}/.zshrc"
        fi
        source "${f}"
    done
fi
