#!/bin/bash

destination="$HOME/.steam/root/compatibilitytools.d"

# Fetch the latest release information
releases_url="https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest"
latest_release_info=$(wget -q -O - "$releases_url")
download_url=$(echo "$latest_release_info" | grep -oP '"browser_download_url": "\K[^"]*Proton[^"]*\.tar\.gz')
latest_release_name=$(echo "$latest_release_info" | grep -oP '"tag_name": "\K[^"]*')

if [ -z "$download_url" ]; then
  echo "Failed to fetch the latest release."
  exit 1
fi

# Prompt the user with the latest release name
echo "The latest release is: $latest_release_name"
echo "Do you want to download and install this release? (y/n): "
read -r continue_install

if [ "$continue_install" != "y" ]; then
  echo "Aborted."
  exit 0
fi

# Download the tarball
echo "Downloading the latest release tarball..."
wget -O proton-ge-custom.tar.gz "$download_url"

# Get the downloaded tarball filename
tarball_filename="proton-ge-custom.tar.gz"

# Check for previous releases in the destination directory
previous_releases=$(find "$destination" -maxdepth 1 -type d -name 'GE-Proton*')

if [ -n "$previous_releases" ]; then
  echo "The following previous releases were found:"
  echo "$previous_releases"
  echo "Do you want to remove previous releases? (y/n): "
  read -r remove_previous

  if [ "$remove_previous" = "y" ]; then
    echo "Removing previous releases..."
    rm -rf $previous_releases
  fi
fi

# Extract the tarball
echo "Extracting the tarball..."
tar -xvf "$tarball_filename" -C "$destination"

# Remove the tarball after extraction
rm -f "$tarball_filename"

echo "Done."
