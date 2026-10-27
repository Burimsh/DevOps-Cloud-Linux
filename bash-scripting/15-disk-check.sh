#!/usr/bin/env bash
# Purpose: warn if the root disk usage is above a limit.

THRESHOLD="${1:-80}"          # warn at 80% or more

# df / shows disk usage; awk takes the 5th column of line 2 (e.g. "37%");
# tr removes the % sign so we can compare it as a number
usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Disk usage on /: ${usage}%"

# (( )) is for number comparisons
if (( usage >= THRESHOLD )); then
  echo "WARNING: disk is almost full"
  exit 1             # non-zero exit code = problem
else
  echo "OK"
fi
