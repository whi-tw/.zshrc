#
# Variable and option settings
#

# ZSH Options
# http://zsh.sourceforge.net/Doc/Release/Options.html
# setopt autocd               # cd to directory if it's put in on cli
setopt promptsubst            # Allow funky stuff in prompt
setopt auto_list              # ambiguous = list
setopt auto_pushd             # cd = pushd
setopt hash_list_all          # Hash everything before completion
setopt always_to_end          # When completing from the middle of a word, move the cursor to the end of the word
setopt list_ambiguous         # Complete as much of a completion until it gets ambiguous.
setopt auto_menu              # show menu with double tab
setopt complete_in_word       # allows completion midway through a word
setopt interactivecomments    # Treat '#' on cli as a comment
setopt chase_links            # Resolve symlinks
setopt autocd                 # change directory just by typing its name
setopt magicequalsubst        # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch              # hide error message if there is no match for the pattern
setopt notify                 # report the status of background jobs immediately
setopt numericglobsort        # sort filenames numerically when it makes sense

TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P' # configure format of `time` command
PROMPT_EOL_MARK=""                                # hide EOL sign ('%')
WORDCHARS=${WORDCHARS//\/}                        # don't consider '/' part of word


#export TERM="xterm-256color"

export DISABLE_FZF_KEY_BINDINGS="true"

export MCFLY_FUZZY=2
export MCFLY_RESULTS_SORT=LAST_RUN
export MCFLY_DISABLE_MENU=TRUE

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
