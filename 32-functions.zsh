function history() {
	if [ ${#} -eq 0 ]; then
		builtin history 0
	else
		builtin history ${@}
	fi
}

