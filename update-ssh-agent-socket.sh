#!/bin/bash

echo "Updating ssh-agent socket environment.."
echo "Current value:  $SSH_AUTH_SOCK"

export SSH_AUTH_SOCK=$(find /tmp/ssh-* -user `whoami` -name agent\* -printf '%T@ %p\n' 2>/dev/null | sort -k 1nr | sed 's/^[^ ]* //' | head -n 1)

if [ $? -gt 0 ]; then
 echo "ERROR!"
 exit $?
fi

echo "New value:  $SSH_AUTH_SOCK"
echo "All done!"
