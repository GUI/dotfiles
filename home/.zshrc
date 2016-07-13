#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

path=("/opt/pkg/sbin" "/opt/pkg/bin" $path "/usr/sbin" "/sbin")

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

#echo $PATH
#export PATH="$HOME/.rbenv/bin:/opt/pkg/sbin:/opt/pkg/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
#export DYLD_LIBRARY_PATH="/opt/pkg/lib:$DYLD_LIBRARY_PATH"
export PATH="$HOME/bin:$PATH"
export EDITOR=vim
export VISUAL=vim
export LDFLAGS="-L/opt/pkg/lib"
export CFLAGS="-I/opt/pkg/include"
export CPPFLAGS="-I/opt/pkg/include"

# Don't share history between active terminal sessions.
unsetopt share_history

# Preventing autocomplete slowness with certain Active Directory environment
# user lookups: http://www.zsh.org/mla/users/2006/msg00769.html
unsetopt cdablevars

# Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^f' forward-word

export JRUBY_OPTS="--dev"

export HISTIGNORE="ls:exit:history"

export LESS="--quit-if-one-screen --hilite-search --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS  --hilite-unread --no-init --window=-4"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
