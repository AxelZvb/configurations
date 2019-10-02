#!/bin/bash

move_workspace_to_output() {
    i3 '[workspace="'$1'"]' move workspace to output $2 > /dev/null
}

move_workspace_to_output_and_focus() {
    i3 '[workspace="'$1'"]' move workspace to output $2 > /dev/null
    if [ "$3" == "true" ]
    then
        i3 '[workspace="'$1'"]' focus > /dev/null
    fi
}

get_workspace_output() {
    echo `i3-msg -t get_workspaces \
    | jq '.[] | select(.name=="'$1'").output' \
    | cut -d"\"" -f2`
}

load_workspaces_from_file() {
while IFS=, read -r col1 col2 col3
do
    if [ ! -z "$col1" ]
    then
        echo "Workspace: $col1, Display: $col2, Visible: $col3"
        move_workspace_to_output_and_focus $col1 $col2 $col3
    fi
done < $1
}

save_workspaces_to_file() {
    i3-msg -t get_workspaces \
    | jq '.[] | "\(select(.).name), \(select(.).output), \(select(.).visible)"' \
    | cut -d"\"" -f2 > $1
}

i3_workspace_file=${2:-~/i3_workspace.csv}

if [ ${1:-load} == "save" ]
then 
	echo "Saving workspace..."
	save_workspaces_to_file $i3_workspace_file
	echo "Saved workspace to:" $i3_workspace_file
else
	echo "Loading workspace..."
	load_workspaces_from_file $i3_workspace_file
	echo "Workspace restored from:" $i3_workspace_file
fi
