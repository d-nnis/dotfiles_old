#!/bin/sh

static=main
#link=xyz.default
link=f2nzw1sn.default
volatile=/dev/shm/firefox-$USER

IFS=
set -efu

echo $(basename $0):

cd ~/.mozilla/firefox

echo "  targeting ff-profile: `pwd`/$link"

if [ ! -r $volatile ]; then
  echo "  create volatile dir in dev-shm: $volatile"
  mkdir -m0700 $volatile
fi

if [ "$(readlink $link)" != "$volatile" ]; then
  echo "  static ff-profile (backup): `pwd`/$static"
  echo "  creating symlink $link to dev-shm: $volatile"

  mv $link $static
  ln -s $volatile $link
fi

if [ -e $link/.unpacked ]; then
  echo "  syncing ff-profile to hdd (static profile) `pwd`/$static"
	rsync -a --delete --exclude .unpacked ./$link/ ./$static/
else
  echo "  syncing ff-profile to ramdisk $volatile"
	rsync -a ./$static/ ./$link/
	touch $link/.unpacked
fi

