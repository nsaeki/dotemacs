#!/bin/sh

#DRY_RUN=1

SRC=~/.emacs.d
DEST=~/Dropbox/config/dotemacs
TARGETS="auto-install bin elisp plugins elpa"
RSYNC_OPTIONS="-auv --delete"

if [ -n "$DRY_RUN" ]; then
	RSYNC_OPTIONS="$RSYNC_OPTIONS -n"
fi

cd $SRC
rsync $RSYNC_OPTIONS $TARGETS $DEST/
