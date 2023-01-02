alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

test -n "${commands[trash]}" && alias rm="${commands[trash]}"
