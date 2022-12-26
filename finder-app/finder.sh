#!/bin/bash

search() {
  # Check if first arg is a valid directory
  if [ ! -d "$1" ]; then
    return
  fi

  count=0
  file_count=0

  # Iterate over all files in the directory
  for file in "$1"/*; do
    # Check if file is a regular file
    if [ -f "$file" ]; then
      # Increment files counter
      file_count=$((file_count+1)) 
      # Increment number of matches
      curr_matches=$(grep -c "$2" "$file")
      count=$((count+curr_matches))
    elif [ -d "$file" ]; then
      # Call the search fucntion recursively
      results=$(search "$1" "$2")
      count=$((count+$(echo "$results" | awk '{print $1}')))
      file_count=$((count+$(echo "$results" | awk '{print $2}')))
    fi
  done

  # Return the count and file_count
  echo "$count" "$file_count"
}

FILESDIR="$1"
SEARCHSTR="$2"

if [ $# -ne 2 ]; then
  # Not  2 arguements passed
  echo "Error: Two arguements required."
  exit 1
fi

if [ ! -d $FILESDIR ]; then
  # Check if the file directory actually exist
  echo "$FILESDIR does not exist."
  exit 1
fi

results=$(search $FILESDIR $SEARCHSTR)
num_files=$(echo "$results" | awk '{print $1}')
num_match_lines=$(echo "$results" | awk '{print $2}')
# Print out number of files and matching lines
echo "The number of files are $num_files and the number of matching lines are $num_match_lines"
