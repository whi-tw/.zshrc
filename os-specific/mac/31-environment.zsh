if [[ -S "${HOME}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock" ]]
then
    export SSH_AUTH_SOCK="${HOME}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
elif [[ -S "$(launchctl getenv SSH_AUTH_SOCK)" ]]
then
    export SSH_AUTH_SOCK="$(launchctl getenv SSH_AUTH_SOCK)"
fi
