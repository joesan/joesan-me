# bigelectrons

[![Build and Deploy](https://github.com/joesan/joesan-me/actions/workflows/main.yml/badge.svg)](https://github.com/joesan/joesan-me/actions/workflows/main.yml)

:no_entry: Source code for my [blogging website](https://www.bigelectrons.com)

## Credits
- [Zola](https://www.getzola.org)
- [DeepThought](https://github.com/RatanShreshtha/DeepThought)

## How to CI?
This project uses GitHub Actions to do CI & CD. [Have a look here](https://github.com/joesan/joesan-me/blob/master/.github/workflows/main.yml) on how the project is built. It is a simple process where we first check for valid HTTP links across all the markdown files. If that is successful, I then check all the markdown content that is in draft status as I do not want to publish anything that is still in a draft version. I write them to a file in a separate branch. Finally, the project is built using Zola and the resulting HTML pages are published to 
the [gh-pages branch](https://github.com/joesan/joesan-me/tree/gh-pages) from where the GitHub pages serve my website. 

## How to serve?
Install Zola, checkout this project, from the root folder type `zola serve`. You should see your new site at `localhost:1111` or at `127.0.0.1:1111`

**NOTE**: you must provide the theme options variables in `config.toml` to serve a functioning site

## Deployment
[Zola](https://www.getzola.org) already has a great documentation for deploying to [Github Pages](https://www.getzola.org/documentation/deployment/github-pages/)

The GitHub pages is configured to map to my domain name (bigelectrons). The build pipeline compiles the markdown content to a static html, pushes it to a
branch [gh-pages](https://github.com/joesan/joesan-me/tree/gh-pages) from where the content is served.

I will leave you with a punch line - Amateurs talk strategy, professionals talk logistics - Not said by me, but that statement means a lot and 
is applicable to our every single day.
