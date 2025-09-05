zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

zinit from"gh-r" as"program" \
    atclone'./zoxide init --cmd=z zsh > zhook.zsh' atpull'%atclone' \
    pick"zoxide" src="zhook.zsh" for \
        ajeetdsouza/zoxide
