#
# Zplugin Loading plugins
#

zplugin ice wait'0' lucid
zplugin light zdharma/z-p-submods

zplugin ice wait'1' lucid \
    atclone"gdircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh"
zplugin light trapd00r/LS_COLORS
alias ls='gls --color=always'   # To enable the coloring on ls

zstyle ':completion:*:default' list-colors \
    ${(s.:.)LS_COLORS} # To enable the coloring on completion


zplugin ice wait'0' atload'_zsh_autosuggest_start' lucid
zplugin light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

zplugin ice wait'1' lucid atclone"./libexec/pyenv init - > zpyenv.zsh" \
    atinit'export PYENV_ROOT="${HOME}/.pyenv"' atpull"%atclone" \
    as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zplugin light pyenv/pyenv

zplugin ice wait'1' lucid
zplugin light laggardkernel/zsh-thefuck

zplugin light "chrissicool/zsh-256color"
