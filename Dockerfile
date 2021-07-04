FROM node:14.15.3-alpine

MAINTAINER Arnaud

# RUN apk add --no-cache python python-dev python3 python3-dev \
#     linux-headers build-base bash git ca-certificates && \
#     python3 -m ensurepip && \
#     rm -r /usr/lib/python*/ensurepip && \
#     pip3 install --upgrade pip setuptools && \
#     if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
#     rm -r /root/.cache

WORKDIR /app
ADD . /app
RUN chown -R node:node /app
USER node

RUN npm install && \
  npm run postinstall && \
  npm run env && \
  npm audit fix

ENV PORT=8080
EXPOSE 8080


CMD ["node", "server.js"]
# COPY package.json .

# COPY . .

