#!/bin/bash

# Check if there is URL(any input actually)
if [ "$#" -ne 1 ]; then
	echo "format of input: $0 https://www.youtube.com/watch?????"
	exit 1
fi

# Change to directory of Downloads
cd ~/Downloads

# Use yt-dlp to download music file with fixed temple of output file
yt-dlp -x $1

# get the file name with .opus
OPUS_FILE=$(ls -t | grep '\.opus$' | head -n 1)

if [ ! -z "$OPUS_FILE" ]; then
	# Remove the name of extension and ready to transfer
	BASE_NAME="$(OPUS_FILE%.*)"

	# Use ffmpeg to transfer .opus into .mp3
	ffmpeg -i "$OPUS_FILE" "$BASE_NAME.mp3"

	# Delete the original .opus file
	# rm "$OPUS_FILE"

	echo "Completed!"
else
	echo "There is no .opus file, so be skipped."
fi
