#!/bin/bash
#
# This script prints the name of the current user.

# --- Strict Mode ---
# Exit immediately if a command exits with a non-zero status.
set -e
# Treat unset variables as an error when substituting.
set -u
# Pipestatus returns the last non-zero exit code in a pipeline, or zero if all commands succeed.
set -o pipefail

# --- Main Logic ---
# The 'whoami' command reliably gets the current user's effective username.
# The script will print this username to standard output.
echo "Current user: $(whoami)"
