# Agents
##wsl2
if [ -n "${WSL_DISTRO_NAME}" ]; then
    NPIPERELAY_URL="https://github.com/NZSmartie/npiperelay/releases/download/v0.1/npiperelay.exe"
    APPDATA="$(wslvar localappdata)"
    APPDATA="${APPDATA//\\/\/}"
    NPIPERELAY_WIN="${APPDATA}/wsl2-ssh-gpg-npiperelay.exe"
    NPIPERELAY="$(wslpath "${NPIPERELAY_WIN}")"

    if [ ! -f "${NPIPERELAY}" ]; then
        curl -L -q -o "${NPIPERELAY}" "${NPIPERELAY_URL}"
        chmod +x ${NPIPERELAY}
    fi
    #####
    ## Autorun for the gpg-relay bridge
    ##
    SOCAT_PID_FILE=${HOME}/.gnupg/socat-gpg.pid
    SOCAT_PID_FILE2=${HOME}/.gnupg/socat-gpg.pid.2
    GPG_SOCK=${HOME}/.gnupg/S.gpg-agent
    if ! ss -a | grep -q "${GPG_SOCK}"; then
        rm -f "${GPG_SOCK}"
        mkdir -p "$(dirname "${GPG_SOCK}")"
        setsid --fork socat UNIX-LISTEN:"${GPG_SOCK}",fork EXEC:"${NPIPERELAY} -ei -ep -s -a "'"'"${APPDATA}"/gnupg/S.gpg-agent'"',nofork
    fi

    #####
    ## Autorun for the ssh-relay bridge
    ##
    export SSH_AUTH_SOCK=${HOME}/.ssh/agent.sock
    if ! ss -a | grep -q "${SSH_AUTH_SOCK}"; then
        rm -f "${SSH_AUTH_SOCK}"
        setsid --fork socat UNIX-LISTEN:"${SSH_AUTH_SOCK}",fork EXEC:"${NPIPERELAY} -ei -s //./pipe/openssh-ssh-agent",nofork
    fi
else
    export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
fi
