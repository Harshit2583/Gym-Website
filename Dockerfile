# Use a lightweight web server
FROM nginx:alpine

# Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy static website files
COPY . /usr/share/nginx/html

# Expose port
EXPOSE 80
