FROM nginx:alpine

# Copy the HTML file and PNG image
COPY escape-room.html /usr/share/nginx/html/index.html
COPY mystery.png /usr/share/nginx/html/mystery.png

# Create a custom nginx config that listens on $PORT (8080)
RUN echo 'server { \
    listen 8080; \
    location / { \
        root /usr/share/nginx/html; \
        try_files $uri /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Expose port 8080
EXPOSE 8080

# Start nginx
CMD ["nginx", "-g", "daemon off;"]