#!/usr/bin/env zsh
set -euo pipefail

first="true"
for file in "${@}"; do
    [[ "$(cat "${file}" | grep -v '^# Description:' | wc -l | tr -d ' ')" -eq 0 ]] && continue
    description="$(grep '^# Description:' "${file}" | sed 's/# Description: //' || true)"
    if [[ "${first}" == "true" ]]; then
        first="false"
    else
        echo
    fi
    echo "##### ${file} #####"
    if [[ -n "${description}" ]]; then
        echo "# ${description}"
    else
        echo "#"
    fi
    echo "#\n"
    cat "${file}" | grep -v '^# Description:'
done
