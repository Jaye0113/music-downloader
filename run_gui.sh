#!/bin/bash
# run_gui.sh

# Use osascript command to recall AppleScript to make the first input window
link=$(osascript -e 'Tell application "System Events" to display dialog "Put your link here: " default answer""' -e 'text returned of result' 2>/dev/null)

# Check if user input link
if [ -n "$link" ]; then
    # if there is a link already input, then recall hello.sh as script to be parameter
    /Users/yaoyaoliu/Documents/Github/music-downloader/download_music.sh "$link"
else
    echo "there is no link."
fi
#there is no change here