#!/usr/bin/env bash

RESULT=key.asc

zbarimg --raw $1-aa.png | perl -pe 'chomp if eof' - > $RESULT

for f in $1-ab.gpg $1-ac.gpg $1-ad.gpg; do
  echo $f;
  gpg -dq $f >> $RESULT;
done

# Sanity check
gpg --dearmor $RESULT >/dev/null
