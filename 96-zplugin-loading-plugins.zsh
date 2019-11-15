#
# Zplugin Loading plugins
#

zplugin ice wait'0' lucid
zplugin light zdharma/z-p-submods

zplugin ice atclone"gdircolors -b LS_COLORS > clrs.zsh" atpull'%atclone' pick"clrs.zsh"
zplugin load trapd00r/LS_COLORS
alias ls='gls --color=always'   # To enable the coloring on ls

zstyle ':completion:*:default' list-colors \
       ${(s.:.)LS_COLORS} # To enable the coloring on completion

# Dependent installation of fzf to work
# Check above for better interactive cd utility function
zplugin light changyuheng/zsh-interactive-cd

zplugin ice wait'0' atload'_zsh_autosuggest_start' lucid
zplugin light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

zplugin ice atclone"./libexec/pyenv init - > zpyenv.zsh" \
    atinit'export PYENV_ROOT="${HOME}/.pyenv"' atpull"%atclone" \
    as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
zplugin light pyenv/pyenv

zplugin ice from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone'\
    pick"direnv" src"zhook.zsh"
zplugin light direnv/direnv

zplugin ice as"program" from"${GITHUB_USERNAME}@github.com"  mv"gds* -> gds" \
    pick"gds" make"gds"
zplugin light alphagov/gds-cli

zplugin ice from"github" as"program" mv"mykman -> ykman" \
    pick"ykman"
zplugin light whi-tw/mykman

zplugin ice atclone'brew install thefuck && thefuck --alias >  zhook.zsh' atpull'%atclone'\
     src"zhook.zsh"
zplugin light nvbn/thefuck

zplugin light "chrissicool/zsh-256color"
