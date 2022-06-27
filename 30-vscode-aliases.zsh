if [[ -d  "${HOME}/.code_profiles" ]]; then
    for dir in "${HOME}/.code_profiles"/*; do
        if [[ -d "${dir}" ]]; then
            [[ -d "${dir}/exts" ]] || mkdir -p "${dir}/exts"
            [[ -d "${dir}/data" ]] || mkdir -p "${dir}/data"
            alias "$(basename "${dir}")"="code --extensions-dir ${dir}/exts --user-data-dir ${dir}/data"
        fi
    done
fi
