zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

zinit from"gh-r" as"program" \
    atclone'./zoxide init --cmd=z zsh > zhook.zsh' atpull'%atclone' \
    pick"zoxide" src="zhook.zsh" for \
        ajeetdsouza/zoxide

zinit ice as"completion"
zinit snippet https://github.com/99designs/aws-vault/raw/master/contrib/completions/zsh/aws-vault.zsh

zinit ice wait"1" lucid
zinit light laggardkernel/zsh-thefuck
