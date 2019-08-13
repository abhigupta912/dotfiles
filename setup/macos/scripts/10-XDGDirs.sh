#!/bin/sh
# vim:filetype=sh
# vim:syntax=sh

mkdir -pv ${XDG_CONFIG_HOME}
mkdir -pv ${XDG_CACHE_HOME}
mkdir -pv ${XDG_DATA_HOME}
mkdir -pv ${XDG_RUNTIME_DIR}
chmod 700 ${XDG_RUNTIME_DIR}

mkdir -pv ${XDG_CONFIG_HOME}/less
mkdir -pv ${XDG_CACHE_HOME}/less

mkdir -pv ${XDG_CONFIG_HOME}/pg
mkdir -pv ${XDG_CACHE_HOME}/pg

mkdir -pv ${XDG_DATA_HOME}/vim/{undo,swap,backup}

