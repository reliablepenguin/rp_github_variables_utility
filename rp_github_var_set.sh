#!/bin/bash

# Check if required arguments are provided
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <repo-name> <variable-name> <variable-value>"
  exit 1
fi

# Assign command-line arguments to variables
REPO_NAME=$1
VAR_NAME=$2
VAR_VALUE=$3

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
  echo "Error: GitHub CLI (gh) is not installed."
  exit 1
fi

# Set the GitHub Actions variable
gh variable set "$VAR_NAME" --body "$VAR_VALUE" --repo "$REPO_NAME"

# Check if the command succeeded
if [ $? -eq 0 ]; then
  echo "Variable '$VAR_NAME' set successfully in repository '$REPO_NAME'."
else
  echo "Error: Failed to set variable '$VAR_NAME' in repository '$REPO_NAME'."
  exit 1
fi

