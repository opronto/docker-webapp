#!/bin/sh

# Create webapp config from ENV variables
if [ "$NODE_ENV" == "development" ]; then
  /home/build-config.sh > /src/public/app.config.js
  yarn --cwd /src start
else
  /home/build-config.sh > /app/app.config.js
  # Start nginx in foreground
  nginx -g 'daemon off;'
fi
