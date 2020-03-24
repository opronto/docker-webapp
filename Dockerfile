# Development
FROM node:12-alpine as development
ENV PORT=80 NODE_ENV=development TS_NODE_PRETTY=true CI=true
RUN apk add libcrypto1.1 --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main && \
    apk add watchman --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk -U --no-cache add bash
CMD ["/home/start.sh"]
WORKDIR /src
COPY *.sh /home/

# Production
FROM nginx:1.17-alpine as production
CMD ["/home/start.sh"]
ENV NODE_ENV=production PORT=80
RUN apk -U --no-cache add bash
RUN mkdir /app
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY *.sh /home/
