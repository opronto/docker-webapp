#!/bin/sh
set -e
set -x

# Bump this when doing a new release
VERSION=1.3.0

echo "Deploying version $VERSION"

docker build -t opronto/webapp:dev-${VERSION} --target development .
docker push opronto/webapp:dev-${VERSION}

docker build -t opronto/webapp:prod-${VERSION} --target production .
docker push opronto/webapp:prod-${VERSION}
