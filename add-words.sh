#!/bin/bash

# Adds words from command line args into user dictionary
# Usage: ./script < words.txt | hunspell -a 
script=""

while read line
do 
    if [[ $line == "" ]]; then
        continue
    fi

    script="$script*$line"$'\n'
done

script="$script#"$'\n'
echo "$script"

