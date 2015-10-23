#!/bin/bash

files=$(git diff --name-only; git diff --name-only --cached)
pattern="[^[:space:]]\{40,64\}"

for i in $files; do
	if grep -q $pattern $i; then
		echo "$i contains AWS/DigitalOcean secret config key or private ssh key"
		exit 1	
	fi
done 
