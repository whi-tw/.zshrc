#
# Completions
# Some (or all) completion plugins require compinit to be loaded and installed
#

# zsh
zinit wait lucid blockf for \
    zsh-users/zsh-completions

zinit ice as "completion"
zinit light blimmer/zsh-aws-vault

# docker
zinit ice as"completion" if'[[ -n "${commands[docker]}" ]]'
zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# docker-compose
zinit ice as"completion" if'[[ -n "$commands[docker-compose]" ]]'
zinit snippet https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose

# pamac
zinit ice as"completion" if'[[ -n "${commands[pamac]}" ]]'
zinit snippet 'https://aur.archlinux.org/cgit/aur.git/plain/_pamac?h=pamac-zsh-completions'

# openshift cli
zinit ice as"completion" if'[[ -n "${commands[oc]}" ]]'
zinit snippet https://raw.githubusercontent.com/chmouel/oh-my-zsh-openshift/master/_oc

zinit snippet OMZP::helm
zinit snippet OMZP::kubectl
test -n "${commands[fzf]}" && zinit snippet OMZP::fzf

export COMPLETIONS_DIR="$(dirname ${(%):-%x})/completions.d"
if [ -d "${COMPLETIONS_DIR}" ]; then
    command mkdir -p "$ZSH_CACHE_DIR/completions"
    (( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)
    [[ "${COMPLETIONS_DIR}"/.complete_base.zsh.zwc -nt "${COMPLETIONS_DIR}"/.complete_base.zsh ]] || zcompile "${COMPLETIONS_DIR}"/.complete_base.zsh
    source "${COMPLETIONS_DIR}"/.complete_base.zsh
    for f in "${COMPLETIONS_DIR}"/*.zsh; do
        [[ "${f}.zwc" -nt "${f}" ]] || zcompile "${f}"
        source "${f}"
    done
    unset gen_my_completion _COMPLETION_GEN_CMDNAME _COMPLETION_GEN_GENCMD
fi
unset COMPLETIONS_DIR
if [[ -n "${commands[aws_completer]}" ]]; then
    complete -C "${commands[aws_completer]}" aws
fi

# Syntax Highlighting (should always be at the end)
zinit wait lucid atload"zpcompinit; zpcdreplay; bashcompinit" for \
    zdharma-continuum/fast-syntax-highlighting
