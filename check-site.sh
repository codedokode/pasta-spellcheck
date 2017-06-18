#!/bin/bash

cd "`dirname "$0"`"
. config.env

COMMAND="$1"

if [[ -z "$COMMAND" ]]; then 
    echo "Usage: ./script full|short"
    exit 1
fi

files="$SITE_FILES_PATH"
PHP=php.bat

find "$files" -type f -name '*.html' | while read name 
do 
    echo "Checking $name..."
    $PHP ./strip-code-html.php < "$name" | ./check-file.sh "$COMMAND" html
done 
