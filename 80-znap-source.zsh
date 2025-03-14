zinit wait lucid for \
        light-mode \
    jreese/zsh-titles \
        light-mode \
    chrissicool/zsh-256color \
        light-mode \
    hlissner/zsh-autopair

zinit snippet OMZP::jenv/jenv.plugin.zsh

zinit for \
        light-mode \
        atload'export ZSH_AUTOSUGGEST_STRATEGY=(history completion)' \
    zsh-users/zsh-autosuggestions \
        light-mode \
        atload'bindkey "^[[A" history-substring-search-up' \
        atload'bindkey "^[[B" history-substring-search-down' \
        atload'export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1' \
    zsh-users/zsh-history-substring-search

# zinit light marlonrichert/zsh-autocomplete ## This is always a mistake. stop it.
