#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

path=($path "/usr/sbin" "/sbin")

zstyle ":prezto:*:*" color "yes"
zstyle ":prezto:module:editor" key-bindings "vi"
zstyle ":prezto:module:prompt" theme "sorin"

autoload -U compinit
compinit

autoload -U bashcompinit
bashcompinit

source "${HOME}/.zgen/zgen.zsh"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

export EDITOR=vim
export VISUAL=vim

# Don't share history between active terminal sessions.
unsetopt SHARE_HISTORY

# Write to history file immediately, rather than on terminal close.
setopt INC_APPEND_HISTORY

# Speed up things.
unsetopt HIST_EXPIRE_DUPS_FIRST
unsetopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
unsetopt HIST_FIND_NO_DUPS
unsetopt HIST_IGNORE_SPACE
unsetopt HIST_SAVE_NO_DUPS

# Save more history to the file.
SAVEHIST=999999999

# Cap the amount of history read into memory.
HISTSIZE=5000

HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"

# Shortcut to lowercase uuid.
alias uuidgenl="uuidgen | tr '[:upper:]' '[:lower:]'"

# Shortcut for histdb
alias h="histdb"

# Shortcut for docker-compose
alias dc="docker-compose"

# Preventing autocomplete slowness with certain Active Directory environment
# user lookups: http://www.zsh.org/mla/users/2006/msg00769.html
unsetopt cdablevars

# Autosuggestions
bindkey '^f' forward-word

export JRUBY_OPTS="--dev"

export LESS="--quit-if-one-screen --hilite-search --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --hilite-unread --no-init --window=-4"

case "$OSTYPE" in
  darwin*)
    # Use linux's `column` command to fix longer output:
    # https://github.com/larkery/zsh-histdb/pull/31
    export HISTDB_TABULATE_CMD=("$HOME/.homebrew/opt/util-linux/bin/column" -t -s $'\x1f')

    ANDROID_HOME="~/Library/Android/sdk"
    export PATH="${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${PATH}"

    export PATH="$HOME/.homebrew/sbin:$HOME/.homebrew/bin:$PATH"
    export PATH="$HOME/.homebrew/opt/libpq/bin:$PATH"
    export PATH="$HOME/.homebrew/opt/cf-cli@7/bin:$PATH"
    export LDFLAGS="-L$HOME/.homebrew/opt/libpq/lib"
    export CPPFLAGS="-I$HOME/.homebrew/opt/libpq/include"
    export PKG_CONFIG_PATH="$HOME/.homebrew/opt/libpq/lib/pkgconfig"
    source $HOME/.homebrew/opt/asdf/asdf.sh
    source $HOME/.homebrew/opt/asdf/etc/bash_completion.d/asdf.bash
    ;;
esac

export PATH="$HOME/.krew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH=".git/safe/../../bin/docker-compose:.git/safe/../../bin:$PATH"

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

if ! zgen saved; then
  zgen prezto
  zgen prezto environment
  zgen prezto terminal
  zgen prezto editor
  zgen prezto git
  zgen prezto history
  zgen prezto directory
  zgen prezto spectrum
  zgen prezto utility
  zgen prezto completion
  zgen prezto autosuggestions
  zgen prezto prompt
  zgen prezto ruby
  zgen prezto python

  zgen load johanhaleby/kubetail
  zgen load larkery/zsh-histdb

  zgen save
fi
