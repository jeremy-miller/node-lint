FROM node:latest
RUN mkdir -p /usr/src/config
WORKDIR /usr/src/config
COPY package.json /usr/src/config
RUN npm install -g
COPY . /usr/src/config
