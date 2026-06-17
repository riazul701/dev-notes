#!/bin/bash

destination_root="$HOME/tmp/code/laravel/laravel-13"

if [ ! -d "$destination_root" ]; then
    parent_dir="${destination_root%/*}"
    mkdir -p "$parent_dir"
    if [[ ($(php -m | grep openssl) == '') || ($(php -m | grep fileinfo) == '') || ($(php -m | grep sqlite) == '') ]]
    then
        echo -e "\033[1;31m Enable Required PHP Extension - openssl, fileinfo, sqlite! \033[0m"
        echo -e "\033[1;31m Open php.ini file and uncomment 'extension=openssl', 'extension=fileinfo', 'extension=pdo_sqlite' line \033[0m" 
        php --ini
        exit
    fi
    composer create-project laravel/laravel:^13.8.0 "$destination_root"
    git init
    git commit -m "Initial Commit"
fi

dir_level_1=$(
    fd --type d --max-depth 1 --hidden --follow --exclude .git --exclude node_modules . | 
    fzf --preview 'eza -la --git --icons --group-directories-first {}' --preview-window=up:70%
) || exit

# normalize Windows backslashes -> Unix slashes
dir_level_1="${dir_level_1//\\//}"
dir_level_1="$PWD/$dir_level_1"

cd "$dir_level_1"

#--------------------------------Start: dir-level-2------------------------------
# dir_level_2=$(
#     fd --type d --max-depth 1 --hidden --follow --exclude .git --exclude node_modules . | 
#     fzf --preview 'eza -la --git --icons --group-directories-first {}' --preview-window=up:70%
# ) || exit

# # normalize Windows backslashes -> Unix slashes
# dir_level_2="${dir_level_2//\\//}"
# dir_level_2="$PWD/$dir_level_2"

# cd "$dir_level_2"
#--------------------------------End: dir-level-2------------------------------

selected_list=$(
    fd --type f --hidden --follow --exclude .git --exclude node_modules . | 
    fzf --multi --preview 'bat --color=always --style=numbers {}' --preview-window=up:70%
) || exit

mapfile -t files < <(echo "$selected_list")

first_run=true
for file in "${files[@]}"; do
    if $first_run; then
        echo "This runs only once"
        first_run=false
    fi
    source_absolute="$PWD/$file"
    destination_relative=$(head -n 1 "$source_absolute")
    destination_relative=$(tr -d '>>' <<< "$destination_relative")
    destination_absolute="$destination_root/$destination_relative"

    mkdir -p "$(dirname "$destination_absolute")"
    tail -n +2 "$source_absolute" > "$destination_absolute"
    echo "Written To: $destination_absolute"
done
