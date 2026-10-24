#!/usr/bin/env bash
# 04-loops.sh
# Purpose: practice for loops and while loops in bash.

# ------------------------------------------------------------
# 1. For loop over a fixed list of words
# ------------------------------------------------------------
echo "--- For loop over a list ---"

# "fruit" is the loop variable. On each round it takes the next
# word from the list: apple, then banana, then cherry.
for fruit in apple banana cherry; do
  # $fruit holds the current word, so this runs 3 times
  echo "I like $fruit"
done   # "done" closes the loop

# ------------------------------------------------------------
# 2. For loop with a number range
# ------------------------------------------------------------
echo "--- For loop with a counter ---"

# {1..5} is expanded by bash into: 1 2 3 4 5
for i in {1..5}; do
  echo "Number $i"
done

# ------------------------------------------------------------
# 3. For loop over files
# ------------------------------------------------------------
echo "--- Loop over files ---"

# *.sh is a wildcard. Bash replaces it with every file in the
# current folder whose name ends in .sh
for file in *.sh; do
  echo "Found script: $file"
done

# ------------------------------------------------------------
# 4. While loop
# ------------------------------------------------------------
echo "--- While loop ---"

# Start the counter at 1 (no spaces around the = sign)
count=1

# Keep repeating as long as the condition is true.
# -le means "less than or equal to", so this runs while count <= 3.
while [ "$count" -le 3 ]; do
  echo "Count is $count"

  # Add 1 to count. Without this line the condition would never
  # become false and the loop would run forever (Ctrl+C stops it).
  count=$((count + 1))
done
