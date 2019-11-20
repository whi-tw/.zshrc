#
# Zplugin Programs
#

zplugin ice wait"2" lucid as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy

zplugin ice wait'1' lucid from"gh-r" as"program" mv"direnv* -> direnv" \
	atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
	pick"direnv" src"zhook.zsh"
zplugin light direnv/direnv

zplugin ice as"program" from"${GITHUB_USERNAME}@github.com" mv"gds* -> gds" \
	make"!gds" if'[[ -n "$commands[go]" ]] && ! [[ -z "${GITHUB_USERNAME}" ]]' \
	atclone'./gds bash-completion > completion.sh' atpull'%atclone' \
	pick"gds" src'completion.sh'
zplugin light alphagov/gds-cli

zplugin ice from"github" as"program" mv"mykman -> ykman" \
	pick"ykman"
zplugin light whi-tw/mykman

zplugin ice from"github" as"program" pick"yadm"
zplugin light TheLocehiliosan/yadm

zplugin ice from"gh-r" as"program" pick"lsd" mv'lsd*/lsd -> lsd'
zplugin light Peltoche/lsd
