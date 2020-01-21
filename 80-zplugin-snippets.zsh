#
# zinit Snippets
#
# zinit ice wait"2" lucid
# zinit snippet OMZ::plugins/rbenv/rbenv.plugin.zsh
zinit ice wait"2" lucid
zinit snippet OMZ::lib/key-bindings.zsh

# Setup fasd with caching from PZT module
# Requirement: Install fasd for this to work
#   Install: https://github.com/clvv/fasd/wiki/Installing-via-Package-Managers#mac-os-x
#   Read more: https://github.com/clvv/fasd
#   Watch tutorial: https://www.youtube.com/watch?v=ur81Y-mV5Us
#
# fasd PZT module uses a cache file for optimization
# The cache file should be located here:
#   >> cache_file="${TMPDIR:-/tmp}/prezto-fasd-cache.$UID.zsh"; cat $cache_file
#   >> rm $cache_file
# Ref: https://github.com/sorin-ionescu/prezto/blob/master/modules/fasd/init.zsh#L22
# Remove it when freshly reinstalling the fasd plugin
# Currently it doesnt' regenerate this file.
zinit ice svn submods"clvv/fasd -> external"
zinit snippet PZT::modules/fasd
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias o='a -e open'
alias c='a -e code'
alias j='zz'

zinit ice wait"2" lucid as'program' if'[[ "${OSTYPE}" =~ "^darwin.*" ]]' \
	mv'cli -> fly' pick'fly'
zinit snippet "https://concourse.whitwell.dev/api/v1/cli?arch=amd64&platform=darwin"
zinit ice wait"2" lucid as'program' if'[[ "${OSTYPE}" =~ "linux-gnu" ]]' \
	mv'cli -> fly' pick'fly'
zinit snippet "https://concourse.whitwell.dev/api/v1/cli?arch=amd64&platform=linux"
