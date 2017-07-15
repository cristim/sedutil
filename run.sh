#!/bin/sh

# fix broken ownership to be able to install packages
sudo chown tc /usr/local/tce.installed/

# install some prerequisites in the container image
tce-load -wic \
  bash.tcz \
  compiletc.tcz \
  git.tcz \
  gcc.tcz \
  make.tcz \
  ncurses-dev.tcz \
  rsync.tcz

# copy code to /tmp in order to get the right file ownership, avoiding to run
# stuff as another user
rsync -av  /sedutil/ /tmp/sedutil/

# build sedutil-cli and linuxpba
make -C /tmp/sedutil/linux/CLI
make -C /tmp/sedutil/LinuxPBA
