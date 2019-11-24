zplugin ice wait"2" lucid from"github" as"program" \
	pick"bin/govuk-*"
zplugin light alphagov/govuk-guix

zplugin ice wait"0" lucid as"program" from"${GITHUB_USERNAME}@github.com" mv"gds* -> gds" \
	make"!gds" if'[[ -n "$commands[go]" ]] && ! [[ -z "${GITHUB_USERNAME}" ]]' \
	atclone'./gds bash-completion > completion.sh' atpull'%atclone' \
	pick"gds" src'completion.sh'
# zplugin ice wait"0" as"program" from"${GITHUB_USERNAME}:${GITHUB_API_TOKEN}@gh-r-api" mv"gds* -> gds" \
# 	atclone'./gds bash-completion > completion.sh' atpull'%atclone' \
# 	pick"gds" src'completion.sh'
zplugin light alphagov/gds-cli
