
#
# Variable and option settings
#

# ZSH Options
# http://zsh.sourceforge.net/Doc/Release/Options.html
setopt promptsubst              # Allow funky stuff in prompt
setopt autocd
setopt auto_list
setopt auto_pushd
setopt hash_list_all            # Hash everything before completion
setopt completealiases          # Complete alisases
setopt always_to_end            # When completing from the middle of a word, move the cursor to the end of the word
setopt list_ambiguous           # Complete as much of a completion until it gets ambiguous.
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_reduce_blanks       # Trim blanks
setopt inc_append_history
setopt chase_links              # Resolve symlinks
autoload bashcompinit
bashcompinit


zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export TERM="xterm-256color"

# aws-vault
export AWS_VAULT_BACKEND='pass'
export AWS_VAULT_PASS_PREFIX='aws-vault'
