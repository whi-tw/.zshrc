test -d '/usr/share/kali-defaults' && source "${INSTALLDIR}"/os-specific/kali.zsh
test -d '/Library/Apple' && source "${INSTALLDIR}"/os-specific/mac.zsh
unset INSTALLDIR
