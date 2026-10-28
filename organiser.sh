
#!/bin/bash

# Check if the user provided a folder argument
if [ "$#" -gt 0 ]; then
    folder="$1"

    # Check if the provided folder exists
    if [ -d "$folder" ]; then
        echo "Organising: $folder"

            #sorting items directily inside the folder.
            for file in "$folder"/*; do

            # Skip items that are not regular files
            if [ -f "$file" ]; then

                # Get the filename from the full path
                filename="${file##*/}"

                # Extract the file extension
                extension="${filename##*.}"

                # Convert the extension to lowercase
                extension="${extension,,}"

                # Determine the category of the file
                if [ "$filename" = "$extension" ]; then
                    category="Other"
                else
                    if [ "$extension" = "jpg" ] || \
                       [ "$extension" = "jpeg" ] || \
                       [ "$extension" = "png" ] || \
                       [ "$extension" = "gif" ] || \
                       [ "$extension" = "webp" ]; then
                        category="Images"

                    elif [ "$extension" = "pdf" ] || \
                         [ "$extension" = "doc" ] || \
                         [ "$extension" = "docx" ] || \
                         [ "$extension" = "txt" ] || \
                         [ "$extension" = "xlsx" ] || \
                         [ "$extension" = "pptx" ]; then
                        category="Documents"

                    elif [ "$extension" = "mp3" ] || \
                         [ "$extension" = "wav" ] || \
                         [ "$extension" = "m4a" ]; then
                        category="Audio"

                    elif [ "$extension" = "mp4" ] || \
                         [ "$extension" = "mkv" ] || \
                         [ "$extension" = "mov" ]; then
                        category="Video"

                    elif [ "$extension" = "zip" ] || \
                         [ "$extension" = "rar" ] || \
                         [ "$extension" = "tar" ] || \
                         [ "$extension" = "gz" ]; then
                        category="Archives"

                    else
                        category="Other"
                    fi
                fi

                # Display the filename and its category
                echo "$filename -> $category"

            fi
        done
    else
        echo "Error: Folder '$folder' does not exist." >&2
        exit 1
    fi

else
    # No folder argument was provided
    echo "Error: Please provide a folder to organise." >&2
    exit 1
fi
