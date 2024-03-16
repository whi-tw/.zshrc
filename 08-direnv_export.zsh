# Description: export env vars before instant prompt fires
(( $+commands[direnv] )) && emulate zsh -c "$(direnv export zsh)"
