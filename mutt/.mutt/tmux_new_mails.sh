#!/usr/bin/env bash

maildirs="$HOME/mail/$1/inbox/new/"

find $maildirs -type f | wc -l | awk '{print $1}'
