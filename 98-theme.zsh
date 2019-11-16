# spaceship theme settings
theme_default() {
  SPACESHIP_DOCKER_SHOW=false
  SPACESHIP_NODE_SHOW=false
  SPACESHIP_KUBECONTEXT_SHOW=false
  SPACESHIP_CONDA_SHOW=false
  SPACESHIP_DOTNET_SHOW=false
  SPACESHIP_RUST_SHOW=false
  SPACESHIP_PHP_SHOW=false
  SPACESHIP_CHAR_SYMBOL="$ "
  SPACESHIP_CHAR_SYMBOL_SECONDARY="❯ "
  SPACESHIP_CHAR_SYMBOL_ROOT="# "
}

# Configures the spaceship prompt
config_spaceship_prompt() {
    theme_default
}

#
# Themes and settings
#

zplugin env-whitelist 'SPACESHIP_*'

# Powerlevel10k theme
# Load custom `config_spaceship_prompt` function above
zplugin ice atinit"config_spaceship_prompt"
zplugin light denysdovhan/spaceship-prompt
