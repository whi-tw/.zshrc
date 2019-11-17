alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"

function config {
    REPOS=("${HOME}/.zshrc.d" "${HOME}/.password-store")
    for repo in "${REPOS[@]}"
    do
        pushd "${repo}"
        git "${@}"
        popd
    done
    yadm "${@}"
}

function kali {
    test -z "${commands[docker]}" && echo "no docker" && return 1
    docker pull kalilinux/kali-rolling
    docker run --rm -it -v${PWD}:${PWD} -w${PWD} kalilinux/kali-rolling /bin/bash -x
}
