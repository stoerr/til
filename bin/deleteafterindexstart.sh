#!/bin/bash
# Deletes in a file everything after <!-- index start -->

# abort if $1 is not a file
if [ ! -f "$1" ]; then
  echo "File $1 not found"
  exit 1
fi

sed -i -e '/<!-- index start -->/,$c\
<!-- index start -->\
\
' $1
rm $1-e || true
