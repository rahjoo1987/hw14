#!/bin/bash

create_verbs() {
  for ((i=1; i<=5; i++)); do
    echo "Enter verb $i:"
    read verb
    echo $verb >> verbs.txt
  done
  echo "Five verbs created successfully."
}

add_hello_world() {
  if [ ! -f "verbs.txt" ]; then
    echo "No verb file found. Please create verbs first."
    return
  fi

  sed -i 's/$/ Hello world/' verbs.txt
  echo "Hello world added to each verb."
}

replace_with_bash() {
  if [ ! -f "verbs.txt" ]; then
    echo "No verb file found. Please create verbs first."
    return
  fi

  sed -i 's/world/bash/' verbs.txt
  echo "Word 'world' replaced with 'bash'."
}

display_menu() {
  echo "Menu:"
  echo "1. Create five numbers of verbs"
  echo "2. Add 'Hello world' text to the files"
  echo "3. Replace the word 'world' with 'bash'"
  echo "0. Exit"
  echo "Please enter your choice:"
}

while true; do
  display_menu
  read choice

  case $choice in
    1) create_verbs ;;
    2) add_hello_world ;;
    3) replace_with_bash ;;
    0) break ;;
    *) echo "Invalid option. Please try again." ;;
  esac

  echo
done