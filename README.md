# bigelectrons

[![Build and Deploy](https://github.com/joesan/joesan-me/actions/workflows/main.yml/badge.svg)](https://github.com/joesan/joesan-me/actions/workflows/main.yml)

:no_entry: Source code for my [blogging website](https://www.bigelectrons.com)

## Topics that I'm currently working on
Please [find here](https://github.com/joesan/joesan-me/blob/draft-status/draftStatus.txt) is the list of topics / blog articles that I'm currently working on!

## Credits
- [Hugo](https://gohugo.io/)
- [Hugo Clarity](https://github.com/chipzoller/hugo-clarity)

## How to CI?
This project uses GitHub Actions to do CI & CD. [Have a look here](https://github.com/joesan/joesan-me/blob/master/.github/workflows/main.yml) for the CI / CD pipeline.

**Step 1:** Check for valid HTTP links across all the markdown files.

**Step 2:** If Step 1 is successful (currently I just log and ignore), check all the markdown content that is in draft status as I do not want to publish 
anything that is still in a draft version. Draft status blog filenames are written to a [file in a separate branch](https://github.com/joesan/joesan-me/blob/draft-status/draftStatus.txt).

**Step 3:** Finally, the project is built using Hugo and the resulting HTML pages are published to
the [gh-pages branch](https://github.com/joesan/joesan-me/tree/gh-pages) from where the GitHub pages serve my website.

## How to serve?
To be able to run and serve the project locally, grab a copy of this project, install Hugo, from the root folder type `hugo server`. You should see your new 
site at `localhost:1313` or at `127.0.0.1:1313`

**NOTE**: you must provide the theme options variables in `config.toml` to serve a functioning site

## Deployment
[Hugo](https://gohugo.io/) already has a great documentation for deploying to [Github Pages](https://gohugo.io/hosting-and-deployment/hosting-on-github/)

The GitHub pages is configured to map to my domain name (bigelectrons). The build pipeline compiles the markdown content to a static html, pushes it to a
branch [gh-pages](https://github.com/joesan/joesan-me/tree/gh-pages) from where the content is served.

I will leave you with a punch line - Amateurs talk strategy, professionals talk logistics - Not said by me, but that statement means a lot and
is applicable to our every single day. Strategy is important, but strategy alone is just not enough!

## Tools & Useful References

For documentation purposes, I'm summarizing here the list of tools that I use for writing my blog content:

1. Convert LaTeX to PNG images       - http://latex2png.com/
2. To Serve this static Blog Website - https://www.getzola.org/
3. Draw circuits & convert to PNG    - https://fritzing.org/
4. Online LaTeX Editor               - https://cocalc.com/doc/latex-editor.html
5. Draw LaTeX Symbols                - http://detexify.kirelabs.org/
6. Online Markdown Editor            - https://dillinger.io/
7. Markdown Emojis                   - https://gist.github.com/rxaviers/7360908
