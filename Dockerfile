FROM node:latest
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN npm install -g dockerfile_lint eslint \
    eslint-config-airbnb-base eslint-config-prettier \
    eslint-plugin-import eslint-plugin-prettier \
    htmllint markdownlint markdownlint-cli \
    prettier stylelint
COPY . /usr/src/app
