#!/bin/sh

# Create webapp config from ENV variables
if [ "$NODE_ENV" == "development" ]; then
  ./build-config.sh > public/app.config.js
  yarn start
else
  ./build-config.sh > /app/app.config.js
  # Start nginx in foreground
  nginx -g 'daemon off;'
fi
