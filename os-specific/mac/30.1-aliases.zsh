alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

__command_is_present trash && alias rm=trash
