#!/usr/bin/env bash
# echo search using large language model for "$*"
# update database using bin/llmupdatedb.sh

progfile=$0
if test -L "$progfile"; then
  progfile=$(readlink "$progfile")
fi
progdir=$(dirname "$progfile")/..
cd $progdir

# if db/llmsearch.db does not exist or is older than a week
# then update it using bin/llmupdatedb.sh
if [[ ! -f db/llmsearch.db ]] || [[ $(find db/llmsearch.db -mtime +7) ]]; then
  # echo starting database update
  bin/llmupdatedb.sh >& /dev/null
  # echo finished database update
fi

llm similar til -d db/llmsearch.db -n 20 -c "$*" | fgrep -v /node_modules/
