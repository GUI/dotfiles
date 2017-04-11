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
export PATH="/usr/local/go/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"
export EDITOR=vim
export VISUAL=vim
export LDFLAGS="-L/opt/pkg/lib"
export CFLAGS="-I/opt/pkg/include"
export CPPFLAGS="-I/opt/pkg/include"

# Don't share history between active terminal sessions.
unsetopt SHARE_HISTORY

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
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^f' forward-word

export JRUBY_OPTS="--dev"

export LESS="--quit-if-one-screen --hilite-search --ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS  --hilite-unread --no-init --window=-4"

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
