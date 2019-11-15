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
