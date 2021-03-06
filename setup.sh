#!/bin/bash

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/bin/install_plugins
fi

cd "$(dirname "$0")" || exit 1
F=$(pwd |sed -e "s#$HOME/\?##")

for P in *
do
  # skip setup
  if [[ "$P" == setup* ]]; then continue; fi
  if [ "$P" = "symlink_files.sh" ]; then continue; fi
  if [ "$P" = "profile-startup.sh" ]; then continue; fi
  if [ "$P" = "zgen" ]; then continue; fi
  if [ "$P" = "README.md" ]; then continue; fi

  # ensure permissions
  chmod -R o-rwx,g-rwx $P

  # skip existing links
  if [ -h "$HOME/.$P" ]; then continue; fi

  # move existing dir out of the way
  if [ -e "$HOME/.$P" ]; then
    if [ -e "$HOME/__$P" ]; then
      echo "want to override $HOME/.$P but backup exists"
      continue;
    fi

    echo -n "Backup "
    mv -v "$HOME/.$P" "$HOME/__$P"
  fi

  # create link
  echo -n "Link "
  ln -v -s "$F/$P" "$HOME/.$P"
done
