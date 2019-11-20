#
# Variable and option settings
#

# ZSH Options
# http://zsh.sourceforge.net/Doc/Release/Options.html
setopt promptsubst         # Allow funky stuff in prompt
setopt autocd              # cd to directory if it's put in on cli
setopt auto_list           # ambiguous = list
setopt auto_pushd          # cd = pushd
setopt hash_list_all       # Hash everything before completion
setopt always_to_end       # When completing from the middle of a word, move the cursor to the end of the word
setopt list_ambiguous      # Complete as much of a completion until it gets ambiguous.
setopt auto_menu           # show menu with double tab
setopt complete_in_word    # allows completion midway through a word
setopt hist_ignore_dups    # Ignore consecutive duplicates.
setopt hist_reduce_blanks  # Trim blanks
setopt share_history       # shared history between tabs
setopt interactivecomments # Treat '#' on cli as a comment
setopt chase_links         # Resolve symlinks
autoload bashcompinit
bashcompinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=${HISTSIZE}
export TERM="xterm-256color"

# aws-vault
export AWS_VAULT_BACKEND='pass'
export AWS_VAULT_PASS_PREFIX='aws-vault'
