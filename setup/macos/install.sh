#!/bin/sh
# vim:filetype=sh
# vim:syntax=sh

export SYSTEM=$(uname -s)

# XDG Directories {{{
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if [ ! -w ${XDG_RUNTIME_DIR:-"/run/user/$UID"} ]; then
    echo "\$XDG_RUNTIME_DIR ($XDG_RUNTIME_DIR) not writable. Setting to /tmp/xdg-${USER}." >&2
    XDG_RUNTIME_DIR=/tmp/xdg-$USER
fi

export XDG_RUNTIME_DIR
# }}}

# Install Directories {{{
CurrDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
ScriptsDir="$(cd "${CurrDir}/scripts" >/dev/null 2>&1 && pwd)"
SetupDir="$(cd "${CurrDir%/*}" >/dev/null 2>&1 && pwd)"
ConfigDir="$(cd "${SetupDir%/*}/config" >/dev/null 2>&1 && pwd)"
export CONFIG_DIR=${ConfigDir}
# }}}

# Execute Scripts {{{
for file in $(find ${ScriptsDir} -maxdepth 1 -type f | sort)
do
    if [ -x "$file" ]; then
        echo "------------------------------------------------------------------------"
        echo "Executing: $file"
        echo "------------------------------------------------------------------------"
        "$file"
    fi
done
# }}}

