#!/bin/bash

# Exit script if we encounter any sort of error
set -e

directory=$(pwd)
session_name=$(basename "$directory")

if ! command -v tmux &> /dev/null; then
	echo "Error: tmux is not installed."
	exit 1
fi

if [ -n "$TMUX" ]; then
	echo "Error: don't run tmux in tmux"
	exit 1
fi

if tmux has-session -t "$session_name" &> /dev/null; then
	echo "Error: session '${session_name}' already exists."
	exit 1
fi

# Create new session with two windows
tmux new-session -d -s $session_name
tmux new-window
tmux attach-session -t $session_name
