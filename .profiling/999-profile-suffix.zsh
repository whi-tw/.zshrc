# Description: Writes profiling information after .zshrc has finished.
__outfile=/tmp/zprof_$(date +%Y-%m-%dT%H:%M:%S%z)
zprof >"${__outfile}"
zprof -c

print -sR "${PAGER}" "${__outfile}"
echo "Profiling information written to ${__outfile}"
unset __outfile
