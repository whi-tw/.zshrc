zinit ice wait"2" lucid from"github" as"program" \
	pick"bin/govuk-*"
zinit light alphagov/govuk-guix

zinit ice as"program" from"${GITHUB_USERNAME}@github.com" mv"gds* -> gds" \
	make"!gds" if'[[ -n "$commands[go]" ]] && ! [[ -z "${GITHUB_USERNAME}" ]]' \
	atclone'./gds zsh-completion > completion.zsh' atpull'%atclone' \
	pick"gds" src'completion.zsh' nocompile'!'
zinit light alphagov/gds-cli
