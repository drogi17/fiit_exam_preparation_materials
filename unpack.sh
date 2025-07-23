#!/bin/bash

PASSWORD="FiitPleaseHelp"

echo "Starting file decryption process..."

find . -mindepth 1 -maxdepth 2 -type f -name "*.zip" | while read -r zip_file; do
    echo "Decrypting: $zip_file"
    DIR_PATH=$(dirname "$zip_file")

    (
        cd "$DIR_PATH" || { echo "Failed to change directory to $DIR_PATH"; continue; }
        FILE_NAME=$(basename "$zip_file")

        unzip -P "$PASSWORD" -o "$FILE_NAME"
        if [ $? -eq 0 ]; then
            echo "Successfully decrypted: $FILE_NAME in $DIR_PATH"
        else
            echo "Error decrypting $FILE_NAME. Possibly incorrect password or corrupted archive."
        fi
    )
done

echo "Decryption process completed."
