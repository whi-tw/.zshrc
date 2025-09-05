export HISTFILE="${HOME}/.zsh_history"
export SAVEHIST=100000
zmodload zsh/mathfunc
export HISTSIZE=$(( int(SAVEHIST * 1.2) ))

setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt hist_find_no_dups      # don't show duplicates when searching history
setopt hist_save_no_dups      # don't save consecutive duplicates
setopt hist_fcntl_lock        # use fcntl to lock history file for better concurrent access

unsetopt hist_reduce_blanks   #  Don't trim blanks

zinit ice as"command" from"gh-r" bpick"atuin-*.tar.gz" mv"atuin*/atuin -> atuin" \
    atclone"./atuin init zsh > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
    atpull"%atclone" src"init.zsh"
zinit light atuinsh/atuin
