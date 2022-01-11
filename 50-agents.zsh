# Agents
##wsl2
if [[ $(uname -r) =~ '.*microsoft.*' ]]; then
	export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
	ss -a | grep -q $SSH_AUTH_SOCK
	if [ $? -ne 0   ]; then
		rm -f $SSH_AUTH_SOCK
		( setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"$HOME/winhome/scoop/apps/wsl-ssh-agent/current/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork & ) >/dev/null 2>&1
	fi
elif [[ -f "${HOME}/.ssh/config" ]] && [[ ! -f "${HOME}/.config/systemd/user/ssh-agent.service" ]]; then
	zstyle :omz:plugins:ssh-agent identities id_2_ed25519 id_ecdsa id_rsa id_rsa_2048
	zstyle :omz:plugins:ssh-agent identity_dir .ssh2
	zinit ice wait"0" lucid
	zinit snippet https://raw.githubusercontent.com/whi-tw/oh-my-zsh/master/plugins/ssh-agent/ssh-agent.plugin.zsh
else
	export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
fi

# zinit ice wait"0" lucid \
# 	if'[[ ! -S "${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent" ]]'
# zinit snippet OMZ::plugins/gpg-agent/gpg-agent.plugin.zsh

# $HOME/.local/bin/gpg-agent-relay start
# export GPG_AGENT_SOCK=$HOME/.gnupg/S.gpg-agent 
