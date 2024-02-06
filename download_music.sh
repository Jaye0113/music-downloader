#!/bin/bash

# Check if there is URL(any input actually)
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 [YouTube-URL]"
	exit 1
fi

# Change to directory of Downloads
cd ~/Downloads

# Use yt-dlp to download the audio file and specify the output template
yt-dlp -x --audio-format mp3 --output "%(title)s.%(ext)s" $1

# Find all downloaded mp3 files and remove the pattern '[***]' from their names
for file in *.mp3; do
	# Use 'mv' to rename the file, removing the unwanted pattern
 	mv "$file" "$(echo $file | sed 's/\[.*\]//g')"
  done
