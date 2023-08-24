#!/bin/bash

# Loop through all markdown files
for file in */*.md; do
  # Get the date of the first commit that changed the file content
  rename_commits=$(git log --follow --diff-filter=R --format='%H' -- $file)
  rename_regex="SDFSEURNEVERMATCH"
  for commit in $rename_commits; do
    rename_regex="$rename_regex|$commit"
  done
  commitdates=$(git log --follow --format="%ad-%H" --date=short -- $file | egrep -v "$rename_regex" | awk -F- '{print $3"-"$2"-"$1}')

  first_commit_date=$(echo "$commitdates" | tail -1)

  # Get the date of the last commit that changed the file content
  last_commit_date=$(echo "$commitdates" | tac | tail -1)

  # Construct the line to be inserted
  line="Created $first_commit_date, last change $last_commit_date"

  awk '!(NR==2 && $0=="")' $file >tmpfile && mv tmpfile $file
  awk '!(NR==2 && /^Created.*last change.*/)' $file >tmpfile && mv tmpfile $file
  awk '!(NR==2 && $0=="")' $file >tmpfile && mv tmpfile $file
  awk '!(NR==2 && $0=="")' $file >tmpfile && mv tmpfile $file
  awk 'NR==2 {print ""} 1' $file >tmpfile && mv tmpfile $file
  awk -v line="$line" 'NR==2 {print line} 1' $file >tmpfile && mv tmpfile $file
  awk 'NR==2 {print ""} 1' $file >tmpfile && mv tmpfile $file

done
