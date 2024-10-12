#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/icon_map.sh"

apps=$(aerospace list-windows --format '{"a": "%{app-name}", "m": "%{monitor-id}", "w": "%{workspace}"}' --all)
spaces=$(aerospace list-workspaces --all)

while read -r space
do
  icon_strip=" "

  while read -r app
  do
    s="$(echo "$app" | jq -r '.w')"
    a="$(echo "$app" | jq -r '.a')"

    if [ "${s}" = "${space}" ]; then
      __icon_map "${a}"
      icon_strip+=" ${icon_result}"
    fi
  done <<< "${apps}"

  if [ "${icon_strip}" = " " ]; then
    icon_strip=" —"
  fi 

  sketchybar --set space.$space label="$icon_strip"
done <<< "${spaces}"

