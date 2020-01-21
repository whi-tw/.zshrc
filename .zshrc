test ! -d ~/.zinit/bin && git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
# Get zinit first: git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
# Symlink .zshrc: cd ~; ln -s ~/.zshrc.d/.zshrc

#
# Source files
#
# Source local common environment variables
# [ -f "${HOME}"/.env ] && source "${HOME}"/.env
# Removed after discovering the existence of ~/.zshenv

for f in "${HOME}"/.zshrc.d/*.zsh; do
	source "${f}"
done
