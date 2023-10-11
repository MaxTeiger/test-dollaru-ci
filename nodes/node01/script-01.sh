#!/bin/bash
set -euo pipefail

# Create a list
list=(apple banana orange apple pear)

# Add an element to the list
list+=("grape")

# Remove duplicates from the list
unique_list=($(echo "${list[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

# Print the unique list
echo "${unique_list[@]}"

list=()
