#!/bin/bash

# Check if Imagick package is installed
if ! dpkg -s "imagemagick" >/dev/null 2>&1 ; then
  # If not installed, install it
  echo "Imagick package is not installed. Installing now..."
  sudo apt-get install imagemagick -y
else
  # If installed, update it
  echo "Imagick package is already installed. Updating now..."
  sudo apt-get upgrade imagemagick -y
fi

# Prompt the user for the compression level
read -p "Enter compression level (1-100): " compression

# Prompt the user for the directory path
read -p "Enter directory path: " directory

# Optimize images in the specified directory
find "$directory" -iname "*.jpg" -exec convert "{}" -strip -quality "$compression" "{}" \;
find "$directory" -iname "*.png" -exec convert "{}" -strip -quality "$compression" "{}" \;

echo "Images in directory $directory optimized with compression level $compression."
