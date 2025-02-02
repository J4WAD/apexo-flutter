#!/bin/bash

# Download and install Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

# Enable Flutter web
flutter config --enable-web

# Pre-cache Flutter web artifacts
flutter precache --web

[build]
  publish = "build/web"
  command = "./install_flutter.sh && flutter build web"

[context.production.environment]
  PATH = "/opt/buildhome/flutter/bin:$PATH"