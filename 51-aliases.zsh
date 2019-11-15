alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"

function update-gitstuff {
    REPOS=("${HOME}/.zshrc.d" "${HOME}/.password-store")
    for repo in "${REPOS[@]}"
    do
        pushd "${repo}"
        git pull --rebase
        popd
    done
    yadm pull --rebase
}
