#!/bin/sh
set -e
set -x

# Bump this when doing a new release
VERSION=2.6

echo "Deploying version $VERSION"

# IMG=registry.digitalocean.com/pronto/webapp
IMG=opronto/webapp

docker build -t $IMG:dev-${VERSION} --target development .
docker push $IMG:dev-${VERSION}

docker build -t $IMG:prod-${VERSION} --target production .
docker push $IMG:prod-${VERSION}
