# Description: Finalize Powerlevel10k
#   1. add the os icon to the left prompt if we are using SSH
#   2. set the location of the config file for using the wizard to make changes
#   3. source the theme (pulling it from the repo if missing).

# If we are using SSH, add the os icon to the left prompt
test -n "${SSH_CONNECTION}" && \
    typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ${POWERLEVEL9K_LEFT_PROMPT_ELEMENTS[@]})

typeset -g POWERLEVEL9K_CONFIG_FILE="${__ZSHRC_SOURCE_DIR}/97-configure-p10k.zsh"
unset __ZSHRC_SOURCE_DIR

zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k
