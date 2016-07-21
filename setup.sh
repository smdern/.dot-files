#!/bin/sh

git submodule init
git submodule update

./fzf/install

./symlink_files.sh

