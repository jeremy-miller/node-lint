# Node Lint
Docker image used to lint external source code files.  This image uses NodeJS as a base for these linting tools.
Configuration files are included as well.

## Currently Installed Tools
- [Dockerfilelint](https://www.npmjs.com/package/dockerfilelint)
- [ESLint](https://www.npmjs.com/package/eslint)
  - [eslint-config-airbnb-base](https://www.npmjs.com/package/eslint-config-airbnb-base)
  - [eslint-config-prettier](https://www.npmjs.com/package/eslint-config-prettier)
  - [eslint-plugin-import](https://www.npmjs.com/package/eslint-plugin-import)
  - [eslint-plugin-prettier](https://www.npmjs.com/package/eslint-plugin-prettier)
- [htmllint](https://www.npmjs.com/package/htmllint)
  - [htmllint-cli](https://www.npmjs.com/package/htmllint-cli)
- [markdownlint](https://www.npmjs.com/package/markdownlint)
  - [markdownlint-cli](https://www.npmjs.com/package/markdownlint-cli)
- [Prettier](https://www.npmjs.com/package/prettier) (via ESLint)
- [stylelint](https://www.npmjs.com/package/stylelint)
  - [stylelint-config-standard](https://www.npmjs.com/package/stylelint-config-standard)

## Usage
This image mounts a directory containing the source code files to be linted inside the container at `/usr/src/app`,
then executes the linting tool on the files within the mounted directory.  By default it uses the current
working directory (`$PWD`) as the host directory to be mounted, however, this can be modified.  Note it must be
an *absolute* path.

The working directory inside the Docker image is `/usr/src`, which is also where the configuration files for the linting
tools are stored.  This means the `app/` path must be prepended in the commands when specifying source code file locations.

To use these tools, you must first pull the latest Docker image: ```docker pull jeremymiller/node-lint```

### Dockerfilelint
To use dockerfilelint, execute the following command:
```docker run -it --rm -v $PWD:/usr/src/app jeremymiller/node-lint dockerfile_lint -r .dockerfilelintrc -f app/Dockerfile```

### ESLint
To use ESLint, execute the following command:
```docker run -it --rm -v $PWD:/usr/src/app jeremymiller/node-lint eslint lib/** static/js/** test/** --fix```

### htmllint
To use htmllint, execute the following command:
```docker run -it --rm -v $PWD:/usr/src/app jeremymiller/node-lint htmllint index.html```

If no files are specified, the mounted directory and all of its sub-directories will be searched for `.html` files to lint.

### markdownlint
To use markdownlint, execute the following command:
```docker run -it --rm -v $PWD:/usr/src/app jeremymiller/node-lint markdownlint app/<.md files to be linted>```

If no files are specified, the mounted directory and all of its sub-directories will be searched for `.md` files to lint.

### stylelint
To use stylelint, execute the following command:
```docker run -it --rm -v $PWD:/usr/src/app jeremymiller/node-lint stylelint static/css/**/*.css```
