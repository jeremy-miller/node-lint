# Node Lint
Docker image used to lint external source code files.  This image uses NodeJS as a base for these linting tools.
Configuration files are included as well.

## Currently Installed Tools
- [dockerfile_lint](https://www.npmjs.com/package/dockerfilelint)
- [ESLint](https://www.npmjs.com/package/eslint)
  - [eslint-config-airbnb-base](https://www.npmjs.com/package/eslint-config-airbnb-base)
  - [eslint-config-prettier](https://www.npmjs.com/package/eslint-config-prettier)
  - [eslint-plugin-import](https://www.npmjs.com/package/eslint-plugin-import)
  - [eslint-plugin-prettier](https://www.npmjs.com/package/eslint-plugin-prettier)
- [htmllint](https://www.npmjs.com/package/htmllint)
- [markdownlint](https://www.npmjs.com/package/markdownlint)
  - [markdownlint-cli](https://www.npmjs.com/package/markdownlint-cli)
- [Prettier](https://www.npmjs.com/package/prettier) (via ESLint)
- [stylelint](https://www.npmjs.com/package/stylelint)

## Usage
This image mounts a directory containing the source code files to be linted inside the container at `/usr/src/app`,
then executes the linting tool on the files within the mounted directory.  By default it uses the current
working directory (`$PWD`) as the host directory to be mounted, however, this can be modified.  Note it must be
an *absolute* path.

To use these tools, you must first pull the latest Docker image: ```docker pull jeremymiller/node-lint```

### markdownlint
To use markdownlint, execute the following command:
```docker run -it --rm -v $PWD:/usr/src/app jeremymiller/node-lint markdownlint <.md files to be linted>```

If no files are specified, the mounted directory and all of its sub-directories will be searched for `.md` files to lint.
