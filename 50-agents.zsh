# Agents
zinit ice wait"0" lucid \
	if'[[ -f "${HOME}/.ssh/config" ]] && [[ ! -S "${XDG_RUNTIME_DIR}/ssh-agent.socket" ]]'
zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

[[ -S "${XDG_RUNTIME_DIR}/ssh-agent.socket" ]] && export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

zinit ice wait"0" lucid \
	if'[[ ! -S "${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent" ]]'
zinit snippet OMZ::plugins/gpg-agent/gpg-agent.plugin.zsh
