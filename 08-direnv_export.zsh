# Description: export env vars before instant prompt fires
__command_is_present direnv && emulate zsh -c "$(direnv export zsh)"
