#!/usr/bin/env zsh

if [ -x "$(command which brew)" ]; then
  alias bcin='brew cask install'
  alias bcrm='brew cask uninstall'
  alias bczp='brew cask zap'
  alias bccl='brew cask cleanup'
  alias bcls='brew cask list'
  alias bcinf='brew cask info'
  alias bcdr='brew cask doctor'
  alias bced='brew cask edit'
  alias bcon='brew cask outdated'
  alias bcog='brew cask outdated --greedy'

  alias bup='brew update && brew upgrade'
  alias bout='brew outdated'
  alias bin='brew install'
  alias brm='brew uninstall'
  alias bcl='brew cleanup'
  alias bls='brew list'
  alias bsr='brew search'
  alias binf='brew info'
  alias bdr='brew doctor'
  alias bed='brew edit'

  function up() {
    # about 'update brew packages'
    brew update
    brew upgrade
    brew cleanup
    ls -l /usr/local/Homebrew/Library/Homebrew | grep homebrew-cask | \
      awk '{print $9}' | for evil_symlink in $(cat -); \
      do rm -v /usr/local/Homebrew/Library/Homebrew/$evil_symlink; done
    brew doctor
  }
fi
