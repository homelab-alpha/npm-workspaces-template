#!/usr/bin/env bash

# Strict Mode
# -e: Exit immediately if a command exits with a non-zero status.
# -o pipefail: The return value of a pipeline is the status of the last command
#    to exit with a non-zero status, or zero if no command exited with a
#    non-zero status.
# -u: Treat unset variables as an error when substituting.

set -eo pipefail
set -u

################################################################################
#                                                                              #
#            ██████╗ ██╗   ██╗██╗ ██████╗██╗  ██╗   ███████╗██╗  ██╗           #
#           ██╔═══██╗██║   ██║██║██╔════╝██║ ██╔╝   ██╔════╝██║  ██║           #
#           ██║   ██║██║   ██║██║██║     █████╔╝    ███████╗███████║           #
#           ██║▄▄ ██║██║   ██║██║██║     ██╔═██╗    ╚════██║██╔══██║           #
#           ╚██████╔╝╚██████╔╝██║╚██████╗██║  ██╗██╗███████║██║  ██║           #
#            ╚══▀▀═╝  ╚═════╝ ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝           #
#                                                                              #
################################################################################


# Filename: quick.sh
# Author: GJS (homelab-alpha)
# Date: 2025-07-31T10:52:23+02:00
# Version: 0.1.0

# Description: This script automates the initial setup and launch of a new
#   project from the 'npm-workspaces-template' repository. It handles cloning
#   the repository, running the initialization script, installing npm
#   dependencies, and optionally launching Visual Studio Code and opening the
#   application in a web browser.

# Usage: ./quick.sh

# --- Initial Setup ---
echo # Blank line for spacing
echo "Cloning repository..."
git clone https://github.com/homelab-alpha/npm-workspaces-template.git
cd npm-workspaces-template

echo # Blank line for spacing
echo "Running initialization script..."
./scripts/init.sh
# Re-evaluate shell's current directory to apply changes from init.sh
cd .

# --- OS-specific Command Setup ---
# Set commands based on the detected Operating System to ensure compatibility.
if [[ "$OSTYPE" == "darwin"* ]]; then # macOS
  SLEEP_CMD="sleep 5"
  OPEN_CMD="open"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then # Windows
  SLEEP_CMD="timeout /T 5 /NOBREAK >nul"
  OPEN_CMD="start"
else # Linux
  SLEEP_CMD="sleep 5"
  OPEN_CMD="xdg-open"
fi

# --- Execution Sequence ---
echo # Blank line for spacing
echo "Installing npm dependencies..."
npm install

# Launch Visual Studio Code if the 'code' command is available.
if command -v code &> /dev/null; then
  echo # Blank line for spacing
  echo "Launching Visual Studio Code..."
  code .
else
  echo # Blank line for spacing
  echo "Visual Studio Code 'code' command not found, skipping."
  eval "$SLEEP_CMD"
fi

echo # Blank line for spacing
echo "Opening application in browser at http://localhost:5173..."
$OPEN_CMD http://localhost:5173/
eval "$SLEEP_CMD"

echo # Blank line for spacing
echo "Starting development server... (Press Ctrl+C to stop)"
npm run dev
