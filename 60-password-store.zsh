if [[ -n "${commands[pass]}" ]]; then
    for i in ${HOME}/.*-pass; do
        source_file="${i}/.load.zsh"
        if [[ -f "${source_file}" ]]; then
            if [[ "${source_file}" -nt "${source_file}.zwc" ]] || [[ ! -f "${source_file}.zwc" ]]; then
                zcompile "${source_file}"
            fi
            source "${source_file}"
        fi
    done
fi
