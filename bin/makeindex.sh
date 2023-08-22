#!/bin/bash
# for all directories in the current directory we print the name of the directory
if [ -z "$1" ]; then
  dirs=*/

  echo "## Topics list"
  echo
  # make a list of links named after the directory without the trailing slash
  for dir in $dirs; do
    # if there is a markdown file in there
    if [ -n "$(ls -A $dir/*.md 2>/dev/null)" ]; then
      echo -n " [${dir%/}](#${dir%/})"
    fi
  done
  echo
  echo
else
  dirs=$1
fi

for dir in $dirs; do
  # if there is no md file in the directory, we skip it
  if [ -z "$(ls -A $dir/*.md 2>/dev/null)" ]; then
    continue
  fi
  # print the directory name without the trailing slash
  echo "## [${dir%/}](#${dir%/})"
  echo
  for file in ${dir}*.md; do
    # print e.g. * [title](dirname/file.md) - 2020-04-19
    # where the title is the first line of the file without the '# ' and the date is the date of the last commit
    echo "* [$(head -n 1 $file | sed 's/# //')]($file) - $(git log -1 --format=%cd --date=format:'%Y-%m-%d' -- $file)"
    # and sort that by the date newest first - the sort key is what comes after --
  done | awk -F' -- ' '{print $2 " -- " $0}' | sort -r | awk -F' -- ' '{print $2}'
  echo
done
