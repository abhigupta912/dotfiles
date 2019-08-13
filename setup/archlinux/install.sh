#!/bin/sh
# vim:filetype=sh

export SYSTEM=$(uname -s)

# XDG Directories
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if [ ! -w ${XDG_RUNTIME_DIR:-"/run/user/$UID"} ]; then
    echo "\$XDG_RUNTIME_DIR ($XDG_RUNTIME_DIR) not writable. Setting to /tmp/xdg-${USER}." >&2
    XDG_RUNTIME_DIR=/tmp/xdg-$USER
fi

export XDG_RUNTIME_DIR

mkdir -p ${XDG_CONFIG_HOME}
mkdir -p ${XDG_CACHE_HOME}
mkdir -p ${XDG_DATA_HOME}
mkdir -p ${XDG_RUNTIME_DIR}

mkdir -p ${XDG_CONFIG_HOME}/less
mkdir -p ${XDG_CACHE_HOME}/less

mkdir -p ${XDG_CONFIG_HOME}/pg
mkdir -p ${XDG_CACHE_HOME}/pg

mkdir -p ${XDG_DATA_HOME}/vim/{undo,swap,backup}

dircolors --print-database > ${XDG_CONFIG_HOME}/dircolors

