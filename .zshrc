.() {
	[[ "${1}.zwc" -nt "${1}" ]] || zcompile "${1}"
	builtin . "${1}"
}
source() {
	[[ "${1}.zwc" -nt "${1}" ]] || zcompile "${1}"
	builtin source "${1}"
}

if [ -d "${HOME}/.zshrc.d" ]; then
	for f in "${HOME}"/.zshrc.d/*.zsh; do
		source "${f}"
	done
fi
