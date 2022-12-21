[[ -d '/usr/share/kali-defaults' ]] && source "${INSTALLDIR}"/os-specific/kali.zsh
[[ -d '/Library/Apple' ]] && source "${INSTALLDIR}"/os-specific/mac.zsh
[[ -f '/etc/os-release' ]] && {
    cat /etc/os-release | grep -q "Ubuntu" && source "${INSTALLDIR}"/os-specific/ubuntu.zsh
}
unset INSTALLDIR
