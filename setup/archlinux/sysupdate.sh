#!/bin/bash

pacman -S --noconfirm archlinux-keyring manjaro-keyring
pacman-key --populate archlinux manjaro
pacman-key --refresh-keys
pacman -Syyu --noconfirm

updatedb

