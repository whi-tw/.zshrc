# zinit ice from"gh-r" as"program" \
# 	bpick'*.tar.gz' \
# 	atclone'./starship init zsh --print-full-init > zhook.zsh' atpull'%atclone' \
# 	pick"direnv" src"zhook.zsh" if'! [[ "${OSTYPE}" =~ "^linux-android.*" ]]' \
# 	nocompile'!'
# zinit light starship/starship
