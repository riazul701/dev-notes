#!/bin/bash

destination_dir="$HOME/tmp/code/php"

if [ ! -d "$destination_dir" ]; then
    mkdir -p "$destination_dir"
fi

file=$(
    ls | 
    grep '\.php$' | 
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' --preview-window=up:70%
) || exit

text=$(
    grep -v '^[[:space:]]*$' "$file" | 
    awk 'BEGIN { RS="\n==================================================\n"; ORS="\0" } { print }' |
    fzf --read0 --delimiter=$'\r\n' --with-nth=1 --preview 'bat --language=php --color=always --paging=never <<< {}' --preview-window=up:70%
) || exit

code=$(
    echo "$text" |
    sed '/^#/d'
)

echo "$code" > "$destination_dir/index.php"
echo "Written To: $destination_dir/index.php"
