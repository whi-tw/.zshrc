#
# Zplugin Programs
#

zplugin ice wait"2" lucid as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy

zplugin ice wait'1' lucid from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone'\
    pick"direnv" src"zhook.zsh"
zplugin light direnv/direnv

zplugin ice as"program" from"whi-tw@github.com"  mv"gds* -> gds" \
    pick"gds" make"gds"
zplugin light alphagov/gds-cli

zplugin ice from"github" as"program" mv"mykman -> ykman" \
    pick"ykman"
zplugin light whi-tw/mykman
