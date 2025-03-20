# Use the official Flutter image
FROM ghcr.io/flutter/flutter:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the Flutter project files
COPY . .

# Enable web support (if not already enabled)
RUN flutter config --enable-web

# Install dependencies
RUN flutter pub get

# Build the web app
RUN flutter build web

# Serve the app using dhttpd (lightweight server)
CMD ["dhttpd", "-p", "8080", "--path", "build/web"]
