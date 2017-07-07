#!/usr/bin/env zsh


if [ "$1" = "personal" ]
then
extra_maildirs=".*/(dad|life)/new"
fi

if [ "$1" = "iris" ]
then
extra_maildirs=".*/(github)/new/.*"
fi

INBOX_MAIL=`find -E $HOME/mail/$1 -regex ".*/inbox/new/.*" | wc -l | awk '{print $1}'`
EXTRA_MAIL=`find -E $HOME/mail/$1 -regex $extra_maildirs | wc -l | awk '{print $1}'`
echo "$INBOX_MAIL/$EXTRA_MAIL"
