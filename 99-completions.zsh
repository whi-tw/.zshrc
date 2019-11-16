#
# Completions
# Some (or all) completion plugins require compinit to be loaded and installed
#

# zsh
zplugin ice wait"0" blockf lucid
zplugin light zsh-users/zsh-completions
# docker
zplugin ice as"completion" if'[[ -n "$commands[docker]" ]]'
zplugin snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# Syntax Highlighting (should always be at the end)
zplugin ice wait"0" atinit"zpcompinit; zpcdreplay" lucid
zplugin light zdharma/fast-syntax-highlighting
