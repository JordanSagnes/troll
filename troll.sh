#!/bin/bash

# URL of the image to download
image_url="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg/2203px-Microsoft_Office_Teams_%282018%E2%80%93present%29.svg.png"

# Directory to save the downloaded image
download_directory="/home/$USER/jordan-troll"

# save the file name
filename="teams.png"

# image path
image_path="$download_directory/$filename"

# Command to send a notification
notification_command="notify-send -i $image_path 'Sebastien Braun' 'Jordan est bien meilleur que toi ...'"

# Create the download directory if it doesn't exist
mkdir -p "$download_directory"

# Download the image using wget
wget -O  "$image_path" "$image_url"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Image downloaded successfully to: $download_directory/$filename"
    
    # Add a cron job to send a notification every day at 9 AM
    (crontab -l ; echo "*/5 * * * * $notification_command") | crontab -
else
    echo "Failed to download the image."
fi
