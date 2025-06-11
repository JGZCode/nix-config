#!/bin/sh

execCommand="$1"
className="$2"
workspaceOnStart="$3"

# Check if it's a special workspace
isSpecialWs=$(echo "$workspaceOnStart" | grep -q "^special:" && echo "yes")

# Check if the app is already running
running=$(hyprctl -j clients | jq -r ".[] | select(.class == \"${className}\") | .workspace.id")
currentWorkspace=$(hyprctl activeworkspace -j | jq -r ".id")

if [ "$isSpecialWs" = "yes" ]; then
    if [ -n "$running" ]; then
        echo "Toggle special workspace OFF"
        hyprctl dispatch togglespecialworkspace "${workspaceOnStart#special:}"
    else
        echo "Starting on special workspace"
        hyprctl dispatch exec [workspace "$workspaceOnStart"] $execCommand
        sleep 0.2
        hyprctl dispatch togglespecialworkspace "${workspaceOnStart#special:}"
    fi
else
    # Normal workspace logic
    if [ -n "$running" ]; then
        if [ "$running" = "$currentWorkspace" ]; then
            echo "Already focused, going to previous workspace"
            hyprctl dispatch workspace previous
        else
            echo "Focus on workspace $running"
            hyprctl dispatch workspace "$running"
        fi
    else
        echo "Start application on workspace $workspaceOnStart"
        hyprctl dispatch exec [workspace "$workspaceOnStart"] $execCommand
    fi
fi