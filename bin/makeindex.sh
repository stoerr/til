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
    # Get the date of the first commit that changed the file content
    rename_commits=$(git log --follow --diff-filter=R --format='%H' -- $file)
    rename_regex="SDFSEURNEVERMATCH"
    for commit in $rename_commits; do
      rename_regex="$rename_regex|$commit"
    done
    commitdates=$(git log --follow --format="%ad-%H" --date=short -- $file | egrep -v "$rename_regex" | awk -F- '{print $3"-"$2"-"$1}')
    last_commit_date=$(echo "$commitdates" | tac | tail -1)

    echo "* [$(head -n 1 $file | sed 's/# //')]($file) - ${last_commit_date}"
    # and sort that by the date newest first - the sort key is what comes after --
  done | awk -F' -- ' '{print $2 " -- " $0}' | sort -r | awk -F' -- ' '{print $2}'
  echo
done
