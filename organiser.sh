
#!/bin/bash

# Check how many arguments the user provides
if [ "$#" -gt 0 ]; then
    folder="$1"

    # Check if the provided folder exists
    if [ -d "$folder" ]; then
        echo "Organising: $folder"

        #counting the number of files moved correctly
        count_move=0

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

                # variable for category folder creation
                destination="$folder/$category"

                # Check if the category folder exists
                mkdir -p "$destination"

                # RENAME DUPLICATES = DONOT OVERWRITE
                #================================================

                #define initial path inside destination.
                target="$destination"


                # If a file with this identical name already exists, change the target name
                if [ -e "$target" ]; then
                    counter=1

                    # Separate the filename base from its extension
                    if [ "$filename" != "$extension" ]; then
                        base="${filename%.*}"   # Gets "photo" from "photo.jpg"
                        file_ext="${filename##*.}" # Gets "jpg" from "photo.jpg"
                    else
                        base="$filename"
                        file_ext=""
                    fi

                    # Loop and check files incrementally until we find a free name slot
                    while [ -e "$target" ]; do
                        if [ -n "$file_ext" ]; then
                            target="$destination/$base($counter).$file_ext"
                        else
                            target="$destination/$base($counter)"
                        fi
                        counter=$((counter + 1))
                    done
                fi

                #SAFELY MOVE FILE TO VERIFIED TARGET PATH
                #==========================================

                if mv -- "$file" "$target"; then
                    # Get just the final filename used (handles original)
                    final_name="${target##*/}"
                    echo "$filename -> $category/$final_name"
                    count_move=$((count_move + 1))
                else
                    echo "Error: Failed to move $filename" >&2
                fi

                # Display the filename and its category
                echo "$filename -> $category"

            fi
        done

        # printing final output
        # ========================
        echo "Total files moved: $count_move"
        
    else
        echo "Error: Folder '$folder' does not exist." >&2
        exit 1
    fi

else
    # No folder argument was provided
    echo "Error: Please provide a folder to organise." >&2
    exit 1
fi

