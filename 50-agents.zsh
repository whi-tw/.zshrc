# Agents
zplugin ice wait"0" lucid \
	if'[[ -f "${HOME}/.ssh/config" ]] && [[ ! -f "${XDG_RUNTIME_DIR}/ssh-agent.env" ]]'
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

[[ -f "${XDG_RUNTIME_DIR}/ssh-agent.env" ]] && source "$XDG_RUNTIME_DIR/ssh-agent.env"

zplugin ice wait"0" lucid
zplugin snippet OMZ::plugins/gpg-agent/gpg-agent.plugin.zsh