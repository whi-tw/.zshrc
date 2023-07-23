# Description: Set the powerlevel10k configuration file

typeset -g POWERLEVEL9K_CONFIG_FILE="${__ZSHRC_SOURCE_DIR}/03-configure-p10k.zsh"
unset __ZSHRC_SOURCE_DIR

# If we are using SSH, add the os icon to the left prompt
test -n "${SSH_CONNECTION}" && \
    typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ${POWERLEVEL9K_LEFT_PROMPT_ELEMENTS[@]})
