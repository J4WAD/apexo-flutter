#!/bin/bash

# Download Flutter
git clone https://github.com/flutter/flutter.git -b stable _flutter
export PATH="$PATH:`pwd`/_flutter/bin"

# Configure Flutter
flutter precache
flutter config --no-analytics
flutter config --enable-web

# Build
flutter pub get
flutter build web --release