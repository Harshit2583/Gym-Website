# Use the official Nginx image as base
FROM nginx:alpine

# Copy your website files to Nginx's default serving directory
COPY . /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80