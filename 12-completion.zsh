zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

(( $+commands[aws] )) && (( $+commands[aws_completer] )) && \
    complete -C aws_completer aws

function _bind_completion_keys() {
    bindkey "^xh" _complete_help # displays information about context names, tags, and completion functions used when completing at the current cursor position
    echo "Ctrl+x h bound to _complete_help: displays information about context names, tags, and completion functions used when completing at the current cursor position"
    bindkey "^x?" _complete_debug # performs ordinary completion, but captures in a temporary file a trace of the shell commands executed by the completion system
    echo "Ctrl+x ? bound to _complete_debug: performs ordinary completion, but captures in a temporary file a trace of the shell commands executed by the completion system"
}

test -d "${XDG_CONFIG_HOME}/granted/zsh_autocomplete" && {
    fpath=("${XDG_CONFIG_HOME}/granted/zsh_autocomplete"/* $fpath)
}
