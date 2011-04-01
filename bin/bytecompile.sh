#!/bin/sh

EMACS_DIR=~/.emacs.d/
TARGET_DIR="elisp init.d"
EXCLUDE="(anything.el|ucs-normalize.el)"

cd $EMACS_DIR
for i in $TARGET_DIR
do
    find $i -type f -name '*.el'
done |
egrep -v $EXCLUDE |
xargs emacs --batch -Q -f batch-byte-compile
