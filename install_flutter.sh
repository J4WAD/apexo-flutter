#!/bin/bash

# Install necessary tools
apt-get update && apt-get install -y git curl unzip xz-utils

# Download and install Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

# Enable Flutter web
flutter config --enable-web

# Pre-cache Flutter web artifacts
flutter precache --web