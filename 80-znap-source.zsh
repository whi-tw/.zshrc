ZSH_AUTOSUGGEST_STRATEGY=( history )
znap source zsh-users/zsh-autosuggestions
# znap source marlonrichert/zsh-autocomplete
znap source jreese/zsh-titles
znap source hlissner/zsh-autopair
znap source chrissicool/zsh-256color
znap source agkozak/zsh-z

znap source ohmyzsh/ohmyzsh plugins/history-substring-search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
