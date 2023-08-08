#!/bin/bash
# replace in README.md the lines after
# <!-- index start -->
# with the output of bin/makeindex.sh

# abort if there is no README.md and no bin/makeindex.sh
if [ ! -f README.md -o ! -f bin/makeindex.sh ]; then
  echo "Probably wrong directory - no README.md and bin/makeindex.sh found"
  exit 1
fi

# delete everything after <!-- index start --> in README.md
sed -i -e '/<!-- index start -->/,$c\
<!-- index start -->\
\
' README.md
bin/makeindex.sh >> README.md

rm README.md-e || true
