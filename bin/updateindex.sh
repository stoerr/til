#!/bin/bash
# replace in index.md the lines after
# <!-- index start -->
# with the output of bin/makeindex.sh

# abort if there is no index.md and no bin/makeindex.sh
if [ ! -f index.md -o ! -f bin/makeindex.sh ]; then
  echo "Probably wrong directory - no index.md and bin/makeindex.sh found"
  exit 1
fi

bin/deleteafterindexstart.sh index.md
bin/makeindex.sh >> index.md
