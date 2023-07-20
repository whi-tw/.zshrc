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
            segment_content="${boxip}"
        fi

        p10k segment -b "#1a2332" -f '#9FEF00' -i '󰆧' -t "${segment_content}"
        ;;
    esac
}
unset POWERLEVEL9K_VPN_IP_CONTENT_EXPANSION
if [[ -z "${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS_1[(r)htb_box]}" ]]; then
    local addition_index="$(( ${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS_1[(i)vpn_ip]} + 1))"
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS_1[${addition_index}]=(htb_box "${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS_1[${addition_index}]}")
    unset addition_index
fi
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS_1+=(htb_box)