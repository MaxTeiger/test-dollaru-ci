#!/bin/bash

# Define the string
my_string="apple,banana,orange,grape"

# Use IFS to set the field separator to a comma
IFS=','
my_string="node01,  node06, node13, node02"
# Loop through the string and print each element
for element in $my_string
do
	echo $element
done
