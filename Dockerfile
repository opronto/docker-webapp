# Development
FROM node:12-alpine as development
ENV PORT=80 NODE_ENV=development TS_NODE_PRETTY=true
RUN apk add libcrypto1.1 --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main && \
    apk add watchman --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk -U --no-cache add bash
WORKDIR /src
CMD ["./start.sh"]
COPY . .

# Production
FROM nginx:1.17-alpine as production
WORKDIR /home
ENV NODE_ENV=production PORT=80
RUN apk -U --no-cache add bash
RUN mkdir /app
CMD ["./start.sh"]
COPY --from=development /src /home/
RUN mv /home/nginx.conf /etc/nginx/conf.d/default.conf
