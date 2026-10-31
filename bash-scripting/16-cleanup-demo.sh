#!/usr/bin/env bash
# 16-cleanup-demo.sh
# Purpose: delete .log files older than N days, with a dry-run mode.

# Practice folder. Everything this script touches lives here.
demo="/tmp/cleanup-demo"
DAYS=7                # files older than this many days count as "old"
DRY_RUN=true          # true = only show, false = really delete
if [[ "${1:-}" == "--delete" ]]; then
  DRY_RUN=false
fi 

# Create the practice folder (-p: no error if it already exists)
mkdir -p "$demo"

# Create three fake files of different ages.
# touch creates an empty file; -d sets its modified date.
touch "$demo/new.log"                      # modified now
touch -d "10 days ago" "$demo/old1.log"    # older than 7 days
touch -d "20 days ago" "$demo/old2.log"    # older than 7 days

echo "Files before cleanup:"
ls -l "$demo"
echo

# find <folder> <tests> <action>
#   -name "*.log"   only names ending in .log
#   -mtime +7       modified MORE than 7 days ago
#   -print          show the matching path
#   -delete         remove the matching file
if [[ "$DRY_RUN" == "true" ]]; then
  echo "DRY RUN, would delete:"
  find "$demo" -name "*.log" -mtime +"$DAYS" -print
else
  echo "Deleting:"
  find "$demo" -name "*.log" -mtime +"$DAYS" -print -delete
fi

echo
echo "Files after cleanup:"
ls -l "$demo"
