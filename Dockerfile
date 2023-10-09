FROM ubuntu:18.04

ENV TERM=xterm-256color

RUN apt-get update -qy && \
    apt-get install curl -qy && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

COPY . /app
WORKDIR /app

RUN npm install

ENTRYPOINT [ "node", "./node_modules/.bin/mocha" ]