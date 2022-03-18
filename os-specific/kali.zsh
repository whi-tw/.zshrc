if [ -f '/usr/lib/code-oss/bin/code-oss' ] && [ -x '/usr/lib/code-oss/bin/code-oss' ]; then 
    alias code='/usr/lib/code-oss/bin/code-oss'
fi
function prompt_htb_box() {
    local boxdir
    local boxname
    local boxip
    case $PWD/ in
    ${HOME}/htb/boxes/*)
        boxname="$(echo "$PWD" | sed "s@${HOME}/htb/boxes/@@" | cut -d'/' -f1)"
        test -z "${boxname}" && return
        segment_content="${boxname}"
        boxdir="${HOME}/htb/boxes/${boxname}"
        if [ -f "${boxdir}/.ip" ]; then
            boxip="$(head -n1 "${boxdir}/.ip")"
            segment_content="${segment_content} | ${boxip}"
        fi

        p10k segment -b "#1a2332" -f '#9FEF00' -i '' -t "${segment_content}"
        ;;
    esac
}
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS_1+=(htb_box)