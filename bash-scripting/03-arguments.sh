#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: ./03-arguments.sh <name> [age]"
  exit 1
fi

name="$1"
age="$2"

echo "Hello, $name!"

if [ -n "$age" ]; then
  if [ "$age" -ge 18 ]; then
    echo "You are an adult."
  else
    echo "You are under 18."
  fi
fi
