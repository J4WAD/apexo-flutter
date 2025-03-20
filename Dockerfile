# Build stage
FROM ghcr.io/cirruslabs/flutter:stable AS build-env

# Set up web support
RUN flutter config --enable-web

# Copy app source code
WORKDIR /app
COPY . .

# Build the app for the web
RUN flutter pub get
RUN flutter build web --release

# Production stage
FROM nginx:stable-alpine

# Copy the build output to replace the default nginx contents
COPY --from=build-env /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]