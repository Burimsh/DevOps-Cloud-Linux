#!/usr/bin/env bash
# 04b-countdown.sh
# Purpose: count down from 5 to 1, then print a final message.

# {5..1} expands to: 5 4 3 2 1 (bash counts down when the
# first number is larger)
for i in {5..1}; do
  # Print the current number
  echo "$i"
  # Pause for 1 second so the countdown feels real
  sleep 1
done

# Runs once, after the loop has finished
echo "Liftoff!"
