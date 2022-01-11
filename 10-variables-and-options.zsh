#
# Variable and option settings
#

# ZSH Options
# http://zsh.sourceforge.net/Doc/Release/Options.html
setopt promptsubst            # Allow funky stuff in prompt
setopt autocd                 # cd to directory if it's put in on cli
setopt auto_list              # ambiguous = list
setopt auto_pushd             # cd = pushd
setopt hash_list_all          # Hash everything before completion
setopt always_to_end          # When completing from the middle of a word, move the cursor to the end of the word
setopt list_ambiguous         # Complete as much of a completion until it gets ambiguous.
setopt auto_menu              # show menu with double tab
setopt complete_in_word       # allows completion midway through a word
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_reduce_blanks     # Trim blanks
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt interactivecomments    # Treat '#' on cli as a comment
setopt chase_links            # Resolve symlinks
autoload bashcompinit
bashcompinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=${HISTSIZE}
#export TERM="xterm-256color"


# editor

if [[ -n "$commands[vim]" ]] && [[ "${TERM_PROGRAM}" != "vscode" ]]; then
    export VISUAL="vim"
fi
