if [[ -z "${ZSH_CACHE_DIR}" ]]; then
    if [[ -n "${XDG_CACHE_HOME}" ]]; then
        export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/.zsh"
    else
        export ZSH_CACHE_DIR="${HOME}/.cache/.zsh"
    fi
fi

[[ -d "${ZSH_CACHE_DIR}" ]] || mkdir -p "${ZSH_CACHE_DIR}"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone --depth 1 -- https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

() {
  setopt local_options

  local zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  local zcomp_ttl=1  # how many days to let the zcompdump file live before it must be recompiled
  local lock_timeout=1  # register an error if lock-timeout exceeded
  local lockfile="${zcompdump}.lock"

  autoload -Uz compinit

  # check for lockfile — if the lockfile exists, we cannot run a compinit
  #   if no lockfile, then we will create one, and set a trap on EXIT to remove it;
  #   the trap will trigger after the rest of the function has run.
  if [ -f "${lockfile}" ]
  then

    # error log if the lockfile outlived its timeout
    if [ "$( find "${lockfile}" -mmin $lock_timeout )" ]
    then
      (
        echo "${lockfile} has been held by $(< ${lockfile}) for longer than ${lock_timeout} minute(s)."
        echo "This may indicate a problem with compinit"
      ) >&2
    fi

    # since the zcompdump is still locked, run compinit without generating a new dump
    compinit -D -d "$zcompdump"

    # Exit if there's a lockfile; another process is handling things
    return 1

  else

    # Create the lockfile with this shell's PID for debugging
    echo $$ > "${lockfile}"

    # Ensure the lockfile is removed on exit
    trap "rm -f '${lockfile}'" EXIT

  fi


  # refresh the zcompdump file if needed
  if [ ! -f "$zcompdump" -o "$( find "$zcompdump" -mtime "+${zcomp_ttl}" )" ]
  then
    # if the zcompdump is expired (past its ttl) or absent, we rebuild it
    compinit -d "$zcompdump"

  else

    # load the zcompdump without updating
    compinit -CD -d "$zcompdump"

    # asynchronously rebuild the zcompdump file
    (autoload -Uz compinit; compinit -d "$zcompdump" &);

  fi
}

source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
