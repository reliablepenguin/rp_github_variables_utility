#!/bin/bash

# Check if required arguments are provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <repo-name>"
  exit 1
fi

# Assign command-line arguments to variables
REPO_NAME=$1

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
  echo "Error: GitHub CLI (gh) is not installed."
  exit 1
fi

# Set the GitHub Actions variable
gh variable list --repo "$REPO_NAME"

# Check if the command succeeded
if [ $? -eq 0 ]; then
  echo ""
else
  echo "Error: Failed to list variables."
  exit 1
fi

