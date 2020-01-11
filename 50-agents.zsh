# Agents
zplugin ice wait"0" lucid \
	if'[[ -f "${HOME}/.ssh/config" ]] && [[ ! -S "${XDG_RUNTIME_DIR}/ssh-agent.socket" ]]'
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

[[ -S "${XDG_RUNTIME_DIR}/ssh-agent.socket" ]] && export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

zplugin ice wait"0" lucid \
	if'[[ ! -S "${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent" ]]'
zplugin snippet OMZ::plugins/gpg-agent/gpg-agent.plugin.zsh
