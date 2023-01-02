function diff() {
    # Inspiration: https://www.stefanjudis.com/snippets/how-to-use-gits-file-diff-outside-of-git-repositories/

    # If there are two arguments and they are both files, use git diff
    if [[ "${#}" -eq 2 ]] && [[ -f "${1}" ]] && [[ -f "${2}" ]]; then
        git diff --no-index $1 $2;
        return
    fi
    # Otherwise, use the system diff
    command diff "${@}"
}
