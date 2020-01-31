#
# zinit Snippets

zinit ice wait"2" lucid
zinit snippet OMZ::lib/key-bindings.zsh

zinit ice wait"2" lucid as'program' if'[[ "${OSTYPE}" =~ "^darwin.*" ]]' \
	mv'cli -> fly' pick'fly'
zinit snippet "https://concourse.whitwell.dev/api/v1/cli?arch=amd64&platform=darwin"
zinit ice wait"2" lucid as'program' if'[[ "${OSTYPE}" =~ "linux-gnu" ]]' \
	mv'cli -> fly' pick'fly'
zinit snippet "https://concourse.whitwell.dev/api/v1/cli?arch=amd64&platform=linux"
