#!/bin/bash

# Check if there is URL(any input actually)
if [ "$#" -ne 1 ]; then
	echo "format of input: $0 https://www.youtube.com/watch?????"
	exit 1
fi

# Change to directory of Downloads
cd ~/Downloads

# Use yt-dlp to download music file with fixed temple of output file
yt-dlp -x --audio-format mp3 $1
