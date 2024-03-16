(( $+commands[microk8s] )) && {
    function _microk8s_enable_get_command_list() {
        microk8s status --format short | grep ": disabled$" | sed 's/: disabled$//g'
    }
    function _microk8s_enable() {
        compadd -X "MicroK8s Addons" $(_microk8s_enable_get_command_list)
    }
    compdef _microk8s_enable microk8s.enable

    function _microk8s_disable_get_command_list() {
        microk8s status --format short | grep ": enabled$" | sed 's/: enabled$//g'
    }
    function _microk8s_disable() {
        compadd -X "MicroK8s Addons" $(_microk8s_disable_get_command_list)
    }
    compdef _microk8s_disable microk8s.disable

    function _microk8s() {
        local -a commands
        local line

        _arguments -C "1: :->cmds" "2: :->subcmds"

        case "${state}" in
        cmds)
            commands=($(microk8s --help | grep '^[[:space:]]' | tr -d $'\t'))
            _describe 'commands' commands
            ;;
        subcmds)
            case ${line[1]} in
            enable)
                _microk8s_enable
                ;;
            disable)
                _microk8s_disable
                ;;
            *)
                _message -r "No completion available"
                ;;
            esac
            ;;
        esac
    }
    compdef _microk8s microk8s

    (( $+commands[microk8s.kubectl] )) && {
        znap fpath _kubectl 'microk8s.kubectl completion zsh'
        compdef microk8s.kubectl=kubectl
        alias kubectl="microk8s.kubectl"
    }

    (( $+commands[microk8s.helm] )) && {
        znap fpath _helm 'microk8s.helm completion zsh'
        compdef microk8s.helm=helm
        compdef microk8s.helm3=helm
        alias helm="microk8s.helm"
        alias helm3="microk8s.helm3"
    }
}
