FROM node:latest
RUN mkdir -p /usr/src/config
COPY package.json /usr/src/config
RUN npm install
COPY . /usr/src/config
