#!/usr/bin/env sh

# gyb looks for json config files in the same directory where gyb.py exists.
# Those files have to be mounted in elsewhere since we can only mount an entire
# directory at a time, so we copy them at runtime from /etc/gyb/ to /gyb/
if [ -d "/etc/gyb" ]; then
    cp /etc/gyb/* /gyb/
fi;

exec /gyb/gyb.py "$@"
