
#!/bin/bash

# Check if the user provided a folder argument
if [ "$#" -gt 0 ]; then
    folder="$1"

    # Check if the provided folder exists
    if [ -d "$folder" ]; then
        echo "Organising: $folder"
    else
        echo "Error: Folder '$folder' does not exist." >&2
        exit 1
    fi

else
    # No folder argument was provided
    echo "Error: Please provide a folder to organise." >&2
    exit 1
fi
