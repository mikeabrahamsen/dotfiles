#
# INSTRUCTIONS
#
#   To enabled ***REMOVED***ent forwarding support add the following to
#   your .zshrc file:
#
#     zstyle :omz:plugins:ssh-***REMOVED***ent ***REMOVED***ent-forwarding on
#
#   To load multiple identies use the identities style, For
#   example:
#
#     zstyle :omz:plugins:ssh-***REMOVED***ent id_rsa id_rsa2 id_github
#
#
# CREDITS
#
#   Based on code from Joseph M. Re***REMOVED***le
#   http://www.cygwin.com/ml/cygwin/2001-06/msg00537.html
#
#   Agent forwarding support based on ideas from
#   Florent Thoumie and Jonas Pfenniger
#

local _plugin__ssh_env=$HOME/.ssh/environment-$HOST
local _plugin__forwarding

function _plugin__start_***REMOVED***ent()
{
  local -a identities

  # start ssh-***REMOVED***ent and setup environment
  /usr/bin/env ssh-***REMOVED***ent | sed 's/^echo/#echo/' > ${_plugin__ssh_env}
  chmod 600 ${_plugin__ssh_env}
  . ${_plugin__ssh_env} > /dev/null

  # load identies
  zstyle -a :omz:plugins:ssh-***REMOVED***ent identities identities 
  echo starting...
  /usr/bin/ssh-add $HOME/.ssh/${^identities}
}

# test if ***REMOVED***ent-forwarding is enabled
zstyle -b :omz:plugins:ssh-***REMOVED***ent ***REMOVED***ent-forwarding _plugin__forwarding
if [[ ${_plugin__forwarding} == "yes" && -n "$SSH_AUTH_SOCK" ]]; then
  # Add a nifty symlink for screen/tmux if ***REMOVED***ent forwarding
  [[ -L $SSH_AUTH_SOCK ]] || ln -sf "$SSH_AUTH_SOCK" /tmp/ssh-***REMOVED***ent-$USER-screen

elif [ -f "${_plugin__ssh_env}" ]; then
  # Source SSH settings, if applicable
  . ${_plugin__ssh_env} > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-***REMOVED***ent$ > /dev/null || {
    _plugin__start_***REMOVED***ent;
  }
else
  _plugin__start_***REMOVED***ent;
fi

# tidy up after ourselves
unfunction _plugin__start_***REMOVED***ent
unset _plugin__forwarding
unset _plugin__ssh_env

