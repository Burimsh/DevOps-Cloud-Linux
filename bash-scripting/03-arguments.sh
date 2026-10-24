#!/usr/bin/env bash
# 03-arguments.sh
# Purpose: use command-line arguments and if statements.
# Usage: ./03-arguments.sh <name> [age]

# -z is true when the text is empty. "$1" is the first argument,
# so this checks "did the user forget to give a name?"
if [ -z "$1" ]; then
  # Show how to use the script
  echo "Usage: ./03-arguments.sh <name> [age]"
  # Stop the script. Exit code 1 means "something went wrong"
  exit 1
fi   # "fi" closes an if block

# Save the arguments into named variables to make the code readable
name="$1"   # first argument
age="$2"    # second argument (may be empty)

# Greet the user
echo "Hello, $name!"

# -n is true when the text is NOT empty, so this runs only if
# the user gave an age
if [ -n "$age" ]; then
  # -ge means "greater than or equal to"
  if [ "$age" -ge 18 ]; then
    echo "You are an adult."
  else
    # Runs when the age is below 18
    echo "You are under 18."
  fi
fi
