# spaceship theme settings
spaceship_default() {
  SPACESHIP_CHAR_SYMBOL="$ "
  SPACESHIP_CHAR_SYMBOL_SECONDARY="❯ "
  SPACESHIP_CHAR_SYMBOL_ROOT="# "
  SPACESHIP_PROMPT_ORDER=(
    user
    dir
    host
    git
    ruby
    golang
    docker
    venv
    pyenv
    exec_time
    line_sep
    battery
    jobs
    exit_code
    char
  )
}

# Configures the spaceship prompt
config_spaceship_prompt() {
    spaceship_default
}

#
# Themes and settings
#

zplugin env-whitelist 'SPACESHIP_*'

# spaceship theme
# Load custom `config_spaceship_prompt` function above
zplugin ice atinit"config_spaceship_prompt"
zplugin light denysdovhan/spaceship-prompt
