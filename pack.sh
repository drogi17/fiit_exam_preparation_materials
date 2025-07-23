#!/bin/bash

PASSWORD="FiitPleaseHelp"
ALL_SUCCESS=true

echo "Starting individual file packing process..."

find . -type f \
    -not -path "./.git/*" \
    -not -name "*.zip" \
    -not -name "pack.sh" \
    -not -name "unpack.sh" \
    -not -name "README.md" \
    -not -name ".gitignore" \
    -print0 | while IFS= read -r -d $'\0' file_path; do

    echo "Processing file: $file_path"

    DIR_PATH=$(dirname "$file_path")
    BASE_NAME=$(basename "$file_path")
    FILE_NAME_NO_EXT="${BASE_NAME%.*}"

    ZIP_FILE="$DIR_PATH/$FILE_NAME_NO_EXT.zip"

    if [ -f "$ZIP_FILE" ]; then
        echo "Warning: ZIP file '$ZIP_FILE' already exists for '$file_path'. Skipping this file."
        continue
    fi

    (
        cd "$DIR_PATH" || { echo "Failed to change directory to $DIR_PATH"; ALL_SUCCESS=false; continue; }

        echo "Packing '$BASE_NAME' into '$ZIP_FILE'..."
        zip -e -P "$PASSWORD" "$FILE_NAME_NO_EXT.zip" "$BASE_NAME"
        
        if [ $? -eq 0 ]; then
            echo "Successfully packed: $BASE_NAME into $ZIP_FILE"
            echo "Deleting original file: $file_path..."
            rm -v "$BASE_NAME"
        else
            echo "Error packing $file_path."
            ALL_SUCCESS=false
        fi
    )
done

if "$ALL_SUCCESS"; then
    echo "All eligible files processed and packed successfully."
else
    echo "Some files were not packed due to errors."
fi

echo "Packing process completed."
