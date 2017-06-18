#!/bin/bash

# Checks file for typos
# Usage: ./script short? html? < /path/to/file

cd "`dirname "$0"`"
. config.env

export DICPATH

# order is important so user dictionary words woth suffixes like 'word/example' are treated as russian
DICTS=ru_RU,en_US
PERSONAL="`pwd`/user-words.txt"

COMMAND="$1"
FLAGS=""

for flag in "$*"; do 
    if [ "$flag" == "html" ]; then
        FLAGS="$FLAGS -H"
    fi
done

if [ "$COMMAND" == "short" ]; then 
    hunspell -d "$DICTS" -p "$PERSONAL" $FLAGS | egrep -v '^($|\*|\+)' | sed -r 's!^[&#] ([^ ]+) .*$!\1!g'
elif [ "$COMMAND" == "full" ]; then
    hunspell -d "$DICTS" -p "$PERSONAL" $FLAGS | egrep -v '^($|\*|\+)' 
else
    echo "Usage: ./script full|short < file"
fi


