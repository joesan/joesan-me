# bigelectrons

[![Build and Deploy](https://github.com/joesan/joesan-me/actions/workflows/main.yml/badge.svg)](https://github.com/joesan/joesan-me/actions/workflows/main.yml)

:no_entry: Source code for my [blogging website](https://www.bigelectrons.com)

## Credits
- [Zola](https://www.getzola.org)
- [DeepThought](https://github.com/RatanShreshtha/DeepThought)

## How to build?
[Have a look here](https://github.com/joesan/joesan-me/blob/master/.github/workflows/main.yml) on how the project is built. We check the HTTP links for all the markdown content,
fetch all markdown content that is in draft status, report them in a file (this is just for me to know which content I should still work on), and then finally build using Zola. 

## How to serve?
Install Zola, checkout this project, from the root folder type `zola serve`. You should see your new site at `localhost:1111` or at `127.0.0.1:1111`

**NOTE**: you must provide the theme options variables in `config.toml` to serve a functioning site

## Deployment
[Zola](https://www.getzola.org) already has a great documentation for deploying to [Github Pages](https://www.getzola.org/documentation/deployment/github-pages/)

The GitHub pages is configured to map to my domain name (bigelectrons). The build pipeline compiles the markdown content to a static html, pushes it to a
branch [gh-pages](https://github.com/joesan/joesan-me/tree/gh-pages) from where the content is served.
