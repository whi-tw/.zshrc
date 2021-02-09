# Agents
if [[ -f "${HOME}/.ssh/config" ]] && [[ ! -f "${HOME}/.config/systemd/user/ssh-agent.service" ]]; then
	zstyle :omz:plugins:ssh-agent identities id_2_ed25519 id_ecdsa id_rsa id_rsa_2048
	zstyle :omz:plugins:ssh-agent identity_dir .ssh2
	zinit ice wait"0" lucid
	zinit snippet https://raw.githubusercontent.com/whi-tw/oh-my-zsh/master/plugins/ssh-agent/ssh-agent.plugin.zsh
else
	export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
fi

zinit ice wait"0" lucid \
	if'[[ ! -S "${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent" ]]'
zinit snippet OMZ::plugins/gpg-agent/gpg-agent.plugin.zsh
