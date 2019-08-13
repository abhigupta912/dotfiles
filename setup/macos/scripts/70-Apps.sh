#!/bin/sh
# vim:filetype=sh
# vim:syntax=sh
# vim:foldlevel=0
# vim:foldmethod=marker
# vim:formatoptions=crqn1j

# AWS CLI {{{
export AWS_SHARED_CREDENTIALS_FILE=${XDG_CONFIG_HOME}/aws/credentials
export AWS_CONFIG_FILE=${XDG_CONFIG_HOME}/aws/config
brew install awscli
# }}}

# Docker {{{
export DOCKER_CONFIG=${XDG_CONFIG_HOME}/docker
export MACHINE_STORAGE_PATH=${XDG_DATA_HOME}/docker-machine
brew tap caskroom/cask
brew cask install docker
# }}}

# Kubernetes {{{
brew install kubernetes-cli
brew install kubernetes-helm
brew link --overwrite kubernetes-cli
# }}}

