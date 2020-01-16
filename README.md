# Webapp base image

Docker image for react apps

## Usage

Example of Dockerfile:

```Dockerfile
# DEVELOPMENT
FROM opronto/webapp:dev as development
COPY package.json yarn.lock .npmrc /src/
RUN yarn install
COPY . .

# PRODUCTION BUILD
FROM development as production-build
ENV NODE_ENV=production
RUN yarn build

# PRODUCTION
FROM opronto/webapp:prod as production
COPY .env /src/
COPY --from=production-build /src/build /app/
```

## New releases

To build and push updates to docker hub:

    ./release.sh
