#!/bin/bash

# Function to log messages with a prefix
log() {
  local type="$1"
  shift
  echo "[$type] $*"
}

# Step 1: Check if Tuist is installed
log "INFO" "Checking if Tuist CLI is installed..."
if ! command -v tuist &> /dev/null; then
  log "WARNING" "Tuist is not installed. Installing Tuist using Homebrew..."

  # Check if Homebrew is installed
  if ! command -v brew &> /dev/null; then
    log "ERROR" "Homebrew is not installed. Please install Homebrew first."
    exit 1
  fi

  # Install Tuist via Homebrew
  if brew install tuist; then
    log "INFO" "Tuist installed successfully!"
  else
    log "ERROR" "Failed to install Tuist. Please try installing it manually."
    exit 1
  fi
else
  log "INFO" "Tuist is already installed."
fi

# Step 2: Generate the project
log "INFO" "Generating the Xcode project using Tuist..."
if tuist generate; then
  log "INFO" "Project generated successfully!"
else
  log "ERROR" "Failed to generate the project. Please check your Tuist setup."
  exit 1
fi
