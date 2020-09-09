#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export SSL_CERT_FILE="$HOME/.nrel-certs/ssl/cacert.pem"
export SSL_CERT_DIR="$HOME/.nrel-certs/ssl/certs"
export NODE_OPTIONS="--use-openssl-ca"
