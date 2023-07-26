# Description: Writes profiling information after .zshrc has finished.
__outfile=/tmp/zprof_$(date +%Y-%m-%dT%H:%M:%S%z)
zprof >"${__outfile}"
print -s cat "${__outfile}"
unset __outfile
zprof -c
