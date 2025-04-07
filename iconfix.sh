#!/bin/bash

# Define variables
EXPECTED_FOLDER="NEOTOKYO"
ZIP_FILE="iconfix.zip"
ICON_FILE="game.ico"
BATCH_FILE="iconfix.bat"
DEST_DIR="NeotokyoSource/resource"
README_FILE="readme_nticonfix.txt"
EXAMPLE_1="example_1.png"
EXAMPLE_2="example_2.png"

# Get the current directory name
CURRENT_FOLDER=$(basename "$PWD")

# Check if the script is running in the NEOTOKYO folder
if [[ "$CURRENT_FOLDER" != "$EXPECTED_FOLDER" ]]; then
    echo "This script must be run inside the NEOTOKYO folder!"
    read -p "Press Enter to exit..."
    exit 1
fi

# Extract the zip file directly
echo "Extracting $ZIP_FILE..."
unzip -o "$ZIP_FILE"

# Move the icon file
if [[ -f "$ICON_FILE" ]]; then
    echo "Moving $ICON_FILE..."
    mv -f "$ICON_FILE" "$DEST_DIR"
else
    echo "$ICON_FILE not found!"
fi

# Delete the zip file
if [[ -f "$ZIP_FILE" ]]; then
    echo "Deleting $ZIP_FILE..."
    rm "$ZIP_FILE"
fi

# Delete the readme file
if [[ -f "$README_FILE" ]]; then
    echo "Deleting $README_FILE..."
    rm "$README_FILE"
fi

# Delete the example images
if [[ -f "$EXAMPLE_1" ]]; then
    echo "Deleting $EXAMPLE_1..."
    rm "$EXAMPLE_1"
fi

# Delete the example images
if [[ -f "$EXAMPLE_2" ]]; then
    echo "Deleting $EXAMPLE_2..."
    rm "$EXAMPLE_2"
fi

# Completion message
echo "Icon fix complete..."
read -p "Press Enter to continue..."

# Delete this script
rm -- "$BATCH_FILE"
rm -- "$0"
