# Based on ssh-***REMOVED***ent code

local GPG_ENV=$HOME/.gnupg/gpg-***REMOVED***ent.env

function start_***REMOVED***ent {
  /usr/bin/env gpg-***REMOVED***ent --daemon --enable-ssh-support --write-env-file ${GPG_ENV} > /dev/null
  chmod 600 ${GPG_ENV}
  . ${GPG_ENV} > /dev/null
}

# Source GPG ***REMOVED***ent settings, if applicable
if [ -f "${GPG_ENV}" ]; then
  . ${GPG_ENV} > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep gpg-***REMOVED***ent > /dev/null || {
    start_***REMOVED***ent;
  }
else
  start_***REMOVED***ent;
fi

export GPG_AGENT_INFO
export SSH_AUTH_SOCK
export SSH_AGENT_PID

GPG_TTY=$(tty)
export GPG_TTY
