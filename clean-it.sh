#!/bin/bash
#
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# <floyd at floyd dot ch> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return
# floyd http://floyd.ch @floyd_ch <floyd at floyd dot ch>
# July 2013
# ----------------------------------------------------------------------------


if [ $# -ne 1 ]
then
  echo "Usage: `basename $0` dir-to-clean"
  exit 0
fi

DIR=${1%/}

echo "#Cleaning $DIR"

echo "Don't care about .svn stuff"
find "$DIR" -type d -iname ".svn" -exec echo '#Removing {}' \; -exec rm -rf {} \;
echo "Don't care about .DS_Store files"
find "$DIR" -type f -name ".DS_Store" -exec echo '#Removing {}' \; -exec rm -rf {} \;
echo "Don't care about files ending in ~"
find "$DIR" -type f -iname "*~" -exec echo '#Removing {}' \; -exec rm -rf {} \;
echo "Don't care about the Android R.java file (it's autogenerated)"
find "$DIR" -type f -name "R.java" -exec echo '#Removing {}' \; -exec rm -rf {} \;

#delete all empty files and directories
echo "Removing empty files/directories"
find "$DIR" -size 0 -exec echo '#Removing {}' \; -delete
