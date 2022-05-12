znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'
test -d "${HOME}/.local/iTerm2-shell-integration/utilities" \
    && export PATH="${HOME}/.local/iTerm2-shell-integration/utilities:${PATH}"
test -d "${HOME}/.local/jetbrains-bin" \
    && export PATH="${HOME}/.local/jetbrains-bin:${PATH}"

test -n "${commands[trash]}" && alias rm="${commands[trash]}"
