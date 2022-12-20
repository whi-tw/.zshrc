znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'
test -d "${HOME}/.local/iTerm2-shell-integration/utilities" \
    && export PATH="${HOME}/.local/iTerm2-shell-integration/utilities:${PATH}"
test -d "${HOME}/Library/Application Support/JetBrains/Toolbox/scripts" \
    && export PATH="${HOME}/Library/Application Support/JetBrains/Toolbox/scripts:${PATH}"
test -n "${commands[trash]}" && alias rm="${commands[trash]}"

alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

# ssh-add -l &>/dev/null || ssh-add --apple-load-keychain &>/dev/null
