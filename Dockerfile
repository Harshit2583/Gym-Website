# Use the official Nginx base image
FROM nginx:alpine

# Remove the default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy all your website files into the nginx web root
COPY . /usr/share/nginx/html

# Optional: Fix permissions (useful if you face permission issues)
RUN chmod -R 755 /usr/share/nginx/html

# Expose port 80 to the host
EXPOSE 80

# Nginx is started by default in this image
