#!/usr/bin/env bash
# 04c-table.sh
# Purpose: print the multiplication table for a number.
# Usage: ./04c-table.sh 7

# Check that an argument was given and that it is a whole number.
# [[ ... =~ regex ]] tests text against a pattern:
#   ^[0-9]+$ means "only digits, from start to end"
if [[ ! "$1" =~ ^[0-9]+$ ]]; then
  echo "Usage: ./04c-table.sh <number>"
  exit 1   # stop with an error code
fi

# Save the argument in a readable variable
number="$1"

# Repeat for every value from 1 to 10
for i in {1..10}; do
  # $((...)) does arithmetic. Here: number multiplied by i
  result=$((number * i))
  # Print one line of the table, e.g. "7 x 3 = 21"
  echo "$number x $i = $result"
done
