# Docker for mac completion scripts
test -d /Applications/Docker.app/Contents/Resources/etc && {
    test -f /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion && {
        znap function _docker docker "source /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion"
        compdef       _docker docker
    }
    test -f /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion && {
        znap function _docker-compose docker-compose "source /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion"
        compdef       _docker-compose docker-compose
    }
}
