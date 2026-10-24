#!/usr/bin/env bash
# 02-variables.sh
# Purpose: store user input in variables and print it.

# read -p shows a prompt, waits for you to type, and saves
# what you typed into the variable "name"
read -p "What is your name? " name

# Same thing, saved into the variable "topic"
read -p "What are you learning? " topic

# $name and $topic are replaced by their values when printed.
# Remember: no spaces around = when assigning variables.
echo "Hello, $name!"
echo "Good luck with $topic."
