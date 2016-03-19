#!/bin/sh

git submodule init
git submodule update

./symlink_files.sh

