#!/bin/bash

file=$(
    ls | 
    grep '\.sql$' | 
    grep -v -- '-sample\.sql$' | 
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' --preview-window=up:70%
) || exit

query=$(
    awk 'BEGIN { RS="\n==================================================\n"; ORS="\0" } { sub(/^[ \t]*\n+/, ""); print }' "$file" |
    fzf --read0 --delimiter=$'\r\n' --with-nth=1 --preview 'bat --language=sql --color=always --paging=never <<< {}' --preview-window=up:70%
) || exit

sql=$(
    echo "$query" | 
    grep -v '^[[:space:]]*$' | 
    sed '/^#/d' | 
    tr '\n' ' ' | 
    tr '"' "'"
)

usql w3schools --command "$sql"
