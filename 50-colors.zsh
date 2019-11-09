if [[ $OSTYPE = (darwin|freebsd)* ]]; then
    #export CLICOLOR="YES" # Equivalent to passing -G to ls.
    #export LSCOLORS="exgxdHdHcxaHaHhBhDeaec"
    #export LS_OPTIONS='-G'
    export CLICOLOR=true
    export LSCOLORS='exfxcxdxbxGxDxabagacad'

    #[ -d "/opt/local/bin" ] && export PATH="/opt/local/bin:$PATH"

    ## Prefer GNU version, since it respects dircolors.
    #if (( $+commands[gls] )); then
    #   alias ls='() { $(whence -p gls) -Ctr --file-type --color=auto $@ }'
    #else
    #   alias ls='() { $(whence -p ls) -CFtr $@ }'
    #fi
fi

if [[ $OSTYPE = (linux)* ]]; then
    export LS_OPTIONS='--color=auto'
fi
