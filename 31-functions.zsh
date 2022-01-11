function config() {
	REPOS=("${HOME}/.zshrc.d" "${HOME}/.password-store")
	for repo in "${REPOS[@]}"; do
		test ! -d "${repo}" && continue
		pushd "${repo}"
		git "${@}"
		popd
	done
	test -d "${HOME}/.config/yadm/repo.git" && yadm "${@}"
}

function kali() {
	test -z "${commands[docker]}" && echo "no docker" && return 1
	docker pull kalilinux/kali-rolling
	docker run --rm -it -v${PWD}:${PWD} -w${PWD} kalilinux/kali-rolling /bin/bash -x
}

function history() {
	if [ ${#} -eq 0 ]; then
		builtin history 1
	else
		builtin history ${@}
	fi
}

function update-zshrc() {
	pushd ${HOME}/.zshrc.d
	git pull
	popd
}
