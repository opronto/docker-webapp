#!/bin/sh
set -e
set -x

docker build -t opronto/webapp:dev --target development .
docker push opronto/webapp:dev

docker build -t opronto/webapp:prod --target production .
docker push opronto/webapp:prod
