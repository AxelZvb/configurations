#!/bin/bash

move_workspace_to_output() {
    i3 '[workspace="'$1'"]' move workspace to output $2 > /dev/null
}

get_workspace_output() {
    echo `i3-msg -t get_workspaces \
    | jq '.[] | select(.name=="'$1'").output' \
    | cut -d"\"" -f2`
}

load_workspaces_from_file() {
while IFS=, read -r col1 col2
do
    if [ ! -z "$col1" ]
    then
        echo "Workspace: $col1, Display: $col2"
        move_workspace_to_output $col1 $col2
    fi
done < $1
}

save_workspaces_to_file() {
    i3-msg -t get_workspaces \
    | jq '.[] | "\(select(.).name), \(select(.).output)"' \
    | cut -d"\"" -f2 > $1
}

#name=1
#var=$(get_workspace_output "$name")
#echo "$var"

if [ ! -z "$1" ] && [ ! -z "$2" ]
then
    if [ $1 == "save" ]
    then 
        echo "save"
        save_workspaces_to_file $2
    else
        if [ $1 == "load" ]
        then
            echo "load"
            load_workspaces_from_file $2
        else
            echo "incorrect args"
        fi
    fi
   else
    echo "incorrect args"
fi
