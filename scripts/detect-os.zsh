#!/usr/bin/env zsh
# Description: Detects the running OS and returns an identifier
set -euo pipefail

print_and_exit() {
    echo "$1"
    exit 0
}

# Kali Linux ('kali')
[[ -d '/usr/share/kali-defaults' ]] && {
    print_and_exit "kali"
}

# macOS ('mac')
[[ -d '/Library/Apple' ]] && {
    print_and_exit "mac"
}

# Ubuntu ('ubuntu')
[[ -f '/etc/os-release' ]] && {
    grep -q "Ubuntu" /etc/os-release && {
        print_and_exit "ubuntu"
    }
}
