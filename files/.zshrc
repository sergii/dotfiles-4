##########
# History
##########

setopt HIST_IGNORE_DUPS     # Ignore adjacent duplication command history list
setopt HIST_IGNORE_SPACE    # Don't store commands with a leading space into history
setopt INC_APPEND_HISTORY   # write history on each command
# setopt SHARE_HISTORY        # share history across sessions
setopt EXTENDED_HISTORY     # add more info
export HISTFILE=~/.zsh_history
export SAVEHIST=100000
export HISTSIZE=100000

# Get Z going
. `brew --prefix`/etc/profile.d/z.sh

#########
# Prompt
#########

autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
#  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
#  xcode         # Xcode section
#  swift         # Swift section
#  golang        # Go section
#  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
#  julia         # Julia section
#  docker        # Docker section
  aws           # Amazon Web Services section
  awsvault
#  venv          # virtualenv section
#  conda         # conda virtualenv section
#  pyenv         # Pyenv section
#  dotnet        # .NET section
  ember         # Ember.js section
#  kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_TIME_SHOW=true
SPACESHIP_EXIT_CODE_SHOW=true

# AWS Vault

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_AWSVAULT_SHOW="${SPACESHIP_AWSVAULT_SHOW=true}"
SPACESHIP_AWSVAULT_PREFIX="${SPACESHIP_AWSVAULT_PREFIX=""}"
SPACESHIP_AWSVAULT_SUFFIX="${SPACESHIP_AWSVAULT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_AWSVAULT_SYMBOL="${SPACESHIP_AWSVAULT_SYMBOL="☁️ "}"
SPACESHIP_AWSVAULT_COLOR="${SPACESHIP_AWSVAULT_COLOR="208"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Shows selected AWS-cli profile.
spaceship_awsvault() {
  [[ $SPACESHIP_AWSVAULT_SHOW == false ]] && return

  # Check to see if we're in an AWS VAULT section
  [[ -z $AWS_VAULT ]] && return

  # Show prompt section
  spaceship::section \
    "$SPACESHIP_AWSVAULT_COLOR" \
    "$SPACESHIP_AWSVAULT_PREFIX" \
    "${SPACESHIP_AWSVAULT_SYMBOL}$AWS_VAULT" \
    "$SPACESHIP_AWSVAULT_SUFFIX"
}

##########
# Plugins
##########

[[ -r /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

###############
# Corrections
###############

setopt NOCORRECT    # I don't want corrections
setopt NOCORRECTALL # Only correct commands not args

# Ignore dups in the directory stack
setopt PUSHDIGNOREDUPS

# Correctly escape pasted URLs
autoload url-quote-magic
zle -N self-insert url-quote-magic

setopt CLOBBER      # Allow redirect to clobber files
export NULLCMD=:           # Allow for file truncation

export REPORTTIME=10       # Show elapsed time if command took more than X seconds
export LISTMAX=0           # Ask to complete if top of list would scroll off screen

###############
# Completions
###############

# Load completions for Ruby, Git, etc.
fpath=("/usr/local/share/zsh/site-functions" $fpath)
autoload compinit
compinit

# Make CTRL-W delete after other chars, not just spaces
export WORDCHARS='*?[]~=&;!#$%^(){}'

# Emacs key bindings
bindkey -e

bindkey "\e[1~" beginning-of-line
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\eOd" backward-word
bindkey "\eOc" forward-word

# Get my aliases
source ~/.zsh/aliases.zsh

# Oblique Strategies for MOTD
function obliq () {
  if [ -e ~/.obliq.txt ]; then
      local rnd=1
      fn=~/.obliq.txt
      lns=$(wc -l $fn | sed 's|[ ]*\([0-9]*\).*|\1|')
      if [ "$lns" = 0 ]; then
        rnd=1
      else
        rnd=$(( (RANDOM % (lns + 1)) + 1 ))
      fi
      sed -n ${rnd}p $fn
  fi
}

# Enable history in iex
export ERL_AFLAGS="-kernel shell_history enabled"

# Source host specific config
HOSTRC="$HOME/.zsh/$(hostname).zsh"
[[ -r $HOSTRC ]] && source $HOSTRC

[[ -r ~/.iterm2_shell_integration.zsh ]] && source ~/.iterm2_shell_integration.zsh

if type direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

[[ -r /usr/local/opt/asdf/asdf.sh ]] && source /usr/local/opt/asdf/asdf.sh

[[ -r "$HOME/.secrets" ]] && source "$HOME/.secrets"

