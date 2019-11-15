#
# Themes and settings
#
zplugin ice from"gh-r" as"program" mv"starship* -> starship" \
  atclone'./starship init zsh --print-full-init > zhook.zsh' atpull'%atclone' \
  pick"direnv" src"zhook.zsh"
zplugin light starship/starship
