# Description: Prints profiling information after .zshrc has finished.

zprof >/tmp/zprof_$(date +%Y-%m-%dT%H:%M:%S%z)
