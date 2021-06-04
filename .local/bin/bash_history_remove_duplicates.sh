#!/bin/bash
T=$(mktemp); tac "$HOME/.bash_history" | awk '!x[$0]++' | tac > "$T" && mv "$T" "$HOME/.bash_history"

