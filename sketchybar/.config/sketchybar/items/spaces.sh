#!/bin/bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

sketchybar --add event aerospace_workspace_change

spaces=$(aerospace list-workspaces --format '%{workspace} %{monitor-id}' --monitor all)
space_order="123456QWER"
sorted_spaces=$(echo "$spaces" | awk -v order="$space_order" '
    BEGIN {
        split(order, order_arr, "")
        for (i=1; i<=length(order); i++) order_index[tolower(order_arr[i])] = i
    }
    {
        key = tolower(substr($1, 1, 1))
        if (key in order_index) {
            lines[order_index[key]] = $0
        }
    }
    END {
        for (i=1; i<=length(order); i++)
            if (i in lines) print lines[i]
    }
')

while read -r space
do
  read sid m <<< $(echo "$space" | awk '{print $1, $2}')
  space=(
    space="$sid"
    icon="$sid"
    display=$m
    label.padding_right=20
    label.font="sketchybar-app-font:Regular:16.0"
    label.y_offset=-1
    background.color=$ITEM_BG_COLOR
    label.color=$WHITE
    icon.color=$WHITE
    script="$PLUGIN_DIR/space.sh $sid"
  )
 
  sketchybar --add space space.$sid left \
              --subscribe space.$sid aerospace_workspace_change \
              --set space.$sid "${space[@]}"
done <<< "${sorted_spaces}"

sketchybar --add item space_separator left                             \
           --set space_separator icon="􀆊"                              \
                                 icon.color=$WHITE                     \
                                 icon.padding_left=4                   \
                                 label.drawing=off                     \
                                 background.drawing=off                \
                                 script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator aerospace_workspace_change

