#!/usr/bin/env zsh

./setup.sh
git submodule init
git submodule update

echo Changing your shell to zsh...
chsh -s /usr/local/bin/zsh

echo Done! Logout and log back in for it to take full effect
