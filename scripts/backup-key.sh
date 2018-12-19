#!/usr/bin/env bash

# First export your gpg key like so:
#
# gpg --export-secret-keys -a -o grandcarrot.asc
#
# Then this script will generate 4 qr codes for your key. At this point
# it's up to you what to do with these images.

split -b 2800 $1 grandcarrot-

for file in grandcarrot-??; do
    <"$file" qrencode -o "$file".png
done
