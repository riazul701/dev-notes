#!/bin/bash

file=$(
    ls | 
    grep '\.sql$' | 
    grep -v -- '-sample\.sql$' | 
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
) || exit

query=$(
    grep -v '^[[:space:]]*$' "$file" | 
    awk 'BEGIN { RS="\n==================================================\n"; ORS="\0" } { print }' |
    fzf --read0 --delimiter=$'\r\n' --with-nth=1 --preview 'bat --language=sql --color=always --paging=never <<< {}'
) || exit

sql=$(
    echo "$query" |
    sed '/^#/d' |
    tr '\n' ' ' | 
    tr '"' "'"
)

usql w3schools --command "$sql"
