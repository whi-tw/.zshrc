test ! -d ~/.zplugin/bin && git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
# Get zplugin first: git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin
# Symlink .zshrc: cd ~; ln -s ~/.zshrc/.zshrc

#
# Source files
#
for f in "${HOME}"/.zshrc.d/*.zsh; do
  source "${f}"
done

# Source local common environment variables
[ -f "${HOME}"/.env ] && source "${HOME}"/.env
