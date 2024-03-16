alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

(( $+commands[trash] )) && alias rm=trash
