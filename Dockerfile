# Use a Flutter base image
FROM cirrusci/flutter:latest

# Set working directory
WORKDIR /app

# Copy the Flutter project
COPY . .

# Install dependencies
RUN flutter pub get

# Build the web app
RUN flutter build web

# Set the web server (Use dhttpd or any lightweight server)
CMD ["dhttpd", "-p", "8080", "--path", "build/web"]
