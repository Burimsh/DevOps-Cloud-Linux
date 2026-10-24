#!/usr/bin/env bash
# 01-hello.sh
# Purpose: print text and the output of a command.

# Print a fixed message to the screen
echo "Hello, world!"

# $(date +%A) runs the "date" command and inserts its output.
# +%A is the format: full weekday name (Monday, Tuesday, ...)
echo "Today is $(date +%A)"
