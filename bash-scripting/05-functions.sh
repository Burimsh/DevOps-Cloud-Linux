#!/usr/bin/env bash
# 05-functions.sh
# Purpose: practice defining and calling functions.
# Usage: ./05-functions.sh

# ------------------------------------------------------------
# 1. A simple function with no arguments
# ------------------------------------------------------------
# Define the function. Nothing runs yet, bash only remembers it.
say_hello() {
  echo "Hello from a function!"
}

# Call the function by writing its name (no parentheses when calling)
say_hello
say_hello   # you can call it as many times as you want

# ------------------------------------------------------------
# 2. A function with arguments
# ------------------------------------------------------------
# Inside a function, $1 and $2 are the function's own arguments,
# not the script's arguments.
greet() {
  # "local" keeps the variable inside the function only,
  # so it can't accidentally overwrite a variable elsewhere
  local name="$1"
  local city="$2"
  echo "Hello, $name from $city!"
}

# Call it with two arguments, separated by spaces
greet "Ana" "Pristina"
greet "Besa" "Prizren"

# ------------------------------------------------------------
# 3. A function that returns a result
# ------------------------------------------------------------
# Bash functions don't return values like other languages.
# The usual trick: print the result with echo, then capture it.
add() {
  local a="$1"
  local b="$2"
  # $((...)) does the arithmetic, echo prints the answer
  echo $((a + b))
}

# $(...) runs the function and stores what it printed in "sum"
sum=$(add 5 7)
echo "5 + 7 = $sum"

# ------------------------------------------------------------
# 4. A function that returns success or failure
# ------------------------------------------------------------
# "return 0" means success, any other number means failure.
# This lets you use the function directly inside an if.
is_even() {
  # % is the remainder after division. Even numbers leave 0.
  if [ $(( $1 % 2 )) -eq 0 ]; then
    return 0   # success = "yes, it is even"
  else
    return 1   # failure = "no, it is not"
  fi
}

# The if checks the function's return code
if is_even 10; then
  echo "10 is even"
fi

if ! is_even 7; then   # ! reverses the result
  echo "7 is odd"
fi
