#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

path=("/opt/local/sbin" "/opt/local/bin" $path "/usr/sbin" "/sbin")

zstyle ":prezto:*:*" color "yes"
zstyle ":prezto:module:editor" key-bindings "vi"
zstyle ":prezto:module:prompt" theme "sorin"

autoload -U compinit
compinit

autoload -U bashcompinit
bashcompinit

source "${HOME}/.zgen/zgen.zsh"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export EDITOR=vim
export VISUAL=vim
export LDFLAGS="-L/opt/local/lib"
export CFLAGS="-I/opt/local/include"
export CPPFLAGS="-I/opt/local/include"

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

# Have "history" output everything in memory (rather than just 15 lines). Also
# add dates.
alias history="fc -il 1"

# Preventing autocomplete slowness with certain Active Directory environment
# user lookups: http://www.zsh.org/mla/users/2006/msg00769.html
unsetopt cdablevars

# Autosuggestions
bindkey '^f' forward-word

export JRUBY_OPTS="--dev"

export LESS="--quit-if-one-screen --hilite-search --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --hilite-unread --no-init --window=-4"

# autoload -Uz compinit && compinit
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

export PATH="$HOME/.yarn/bin:$PATH"
export PATH=".git/safe/../../bin/docker-compose:.git/safe/../../bin:$PATH"

ANDROID_HOME="~/Library/Android/sdk"
export PATH="${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${PATH}"

h() {
  rg --no-filename --no-heading --no-line-number "$@" ~/.zhistory
}

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

  zgen save
fi
