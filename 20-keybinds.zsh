#
# Key bindings
# On the terminal, press Ctrl+v and then enter the key sequence for the binding
# The Ctrl+v is a special instruction or escape sequence that output the next
# character you press as a "literal unescaped" character.
#
# Eg: On a terminal
#   Ctrl+v + Fn+Del => ^[[3~
#
# You can then bind "^[[3~" to the zsh binding key
#
bindkey "^[[3~" delete-char
bindkey "^E" end-of-line
bindkey "^A" beginning-of-line
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
