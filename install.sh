#!/bin/bash

# Set the installation directory
INSTALL_DIR="/usr/local/bin"

# Copy the main script to the installation directory
cp clouduploader.sh $INSTALL_DIR

# Provide execute permissions
chmod +x $INSTALL_DIR/clouduploader.sh

echo "CloudUploader is now installed."
echo "You can use it by running 'clouduploader.sh' ."


