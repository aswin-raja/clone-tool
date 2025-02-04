#!/bin/bash

# URL where the binary is hosted (change this to your actual URL)
BINARY_URL="https://github.com/your-username/your-repo/releases/download/v1.0.0/clone_tool"

# Directory to install the binary
INSTALL_DIR="/usr/local/bin"
# Path to add to the user's PATH environment variable
USER_BASHRC="$HOME/.bashrc"

# Download the binary
echo "Downloading clone_tool..."
curl -L "$BINARY_URL" -o "$INSTALL_DIR/clone_tool"

# Make the binary executable
chmod +x "$INSTALL_DIR/clone_tool"

# Add the installation directory to the PATH if it's not already present
if ! grep -q "$INSTALL_DIR" "$USER_BASHRC"; then
    echo "Adding $INSTALL_DIR to PATH..."
    echo "export PATH=\$PATH:$INSTALL_DIR" >> "$USER_BASHRC"
    source "$USER_BASHRC"
    echo "$INSTALL_DIR added to PATH."
else
    echo "$INSTALL_DIR is already in PATH."
fi

# Verify installation
echo "clone_tool installed successfully."
echo "You can now run 'clone_tool' from any directory."
