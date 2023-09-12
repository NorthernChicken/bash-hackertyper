#!/bin/bash

tput setaf 2

# Specify the path to the text file containing the code to type
text_file="code_to_type.txt"

# Check if the text file exists
if [ -e "$text_file" ]; then
    # Read the content of the text file into the text_to_type variable
    text_to_type=$(cat "$text_file")
else
    echo "Error: The specified text file '$text_file' does not exist."
    exit 1
fi


index=0

while [ 1 = 1 ]
do
    # Read input with timeout
    read -s -n 1 key

    # Check if a key was pressed
    if [ "$?" = 0 ]; then
        # Print the next character from the predetermined text
        echo -n "${text_to_type:$index:1}"
        index=$(( (index + 1) % ${#text_to_type} ))

    fi
done
