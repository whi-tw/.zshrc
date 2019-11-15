alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"

function pull_config {
    REPOS=("${HOME}/.zshrc.d" "${HOME}/.password-store")
    for repo in "${REPOS[@]}"
    do
        pushd "${repo}"
        git pull --rebase
        popd
    done
    yadm pull --rebase
}
function push_config {
    REPOS=("${HOME}/.zshrc.d" "${HOME}/.password-store")
    for repo in "${REPOS[@]}"
    do
        pushd "${repo}"
        git push
        popd
    done
    yadm push
}
