+++
title="Moved from Blogger to GH Pages"
description="Simple & a logical step forward"
date=2021-02-14

categories = ["Miscellaneous"]
tags = ["blog", "zola"]
+++


I have been documenting so far with Blogger. Recently I started to do some Robotics projects with ROS. As I was doing it, I was looking for ways to get all what
I do be documented. I know Github offers [GH Pages](https://pages.github.com/), but I was a bit reluctant to try it out. 
So for the [Navo project](https://github.com/navo-org), I decided that GH Pages will be the source for my documentation, hence I wanted to give it a try. 
Honestly, I was not disappointed!

I have been documenting all what I have been doing for the [Navo project](https://github.com/navo-org) with GH Pages and a Jekyll theme. It did not click to
my mind until a day ago that why not I move my personal blogging content as well from Blogger to GH Pages? I took the plunge and started to explore on 
what [Static Site Generator or SSG in short](https://en.wikipedia.org/wiki/Web_template_system#Static_site_generators) platform should I consider. Jekyll is an option, but
I wanted to see what other platforms are available. 

Hugo, Gatsby, Octopress, Wordpress, Pelican, Zola were some platforms that I explored and decided to go with Zola. Well first, I liked the idea
of documenting content for the web using Markdown files. The point here is Markdown is a text-to-HTML conversion tool for web writers, so why not just 
bother about writing the text and leave the conversion of text-to-HTML to some platform of choice. 

Clearly there are a few advantages of using Markdown files for the content:

1. No need of a [WYSIWYG](https://en.wikipedia.org/wiki/WYSIWYG) editor

2. No HTML clutter in my content

3. Platform agnostic, yes that says it all

4. Very lightweight and easy to get started

The most important factor for this migration is that I can focus on the content rather than the HTML formatting that I had to deal with in Blogger!

So my research began, the first SSG platform that I tried was Zola. Rust as a programming language occupies the same spot in my heart as Scala. Zola is built using Rust. Without any
second thought, I decided to give Zola a try. It was the easiest thing to do in this world. Just 3 commands, and your static site is up and running. It took my about 20 minutes, yes, just 
under 20 minutes to try out Zola, choose a theme, get it up and running on my local machine.

It does not stop there, you could compile your Zola content to be served via GH Pages, which is what I wanted. I decided on a theme, thankful to this [one here](https://www.getzola.org/themes/deepthought/).
I created a new project in my GitHub account, migrated all of my content from Blogger (this was a bit of work), organized them into appropriate folder structure.

Does it stop there? No, no no, it does not stop there, since your content is going to be in GitHub, you could apply that CI / CD pipeline. This was exactly my next step where I added a very
[basic HTTP link checker](https://github.com/lycheeverse/lychee-action) which when added to the [GitHub action workflow](https://github.com/joesan/joesan-me/actions) could scan the 
Markdown files recursively and validate all the HTTP links. 

It goes even further by automatically creating an issue with a summary of all the HTTP links that failed to resolve with a HTTP OK status. I do not need
that as it makes sense to have such automation in a team set up. I could also set up a spell checker for my content as I realized during the migration of my content from Blogger is that I had lots
of spelling mistakes / typo errors. Nevertheless, I did not want to overcomplicate this and decided not to add [this action](https://github.com/marketplace/actions/check-spelling-js-vue-html-markdown-text) for spell check.

After a successful HTTP check, the next step in the build pipeline is to compile the Zola source files into HTML's for rendering by GH Pages. There is a [GitHub action](https://github.com/shalzz/zola-deploy-action) 
exactly for this purpose, but I decided not to use it. All I need is the possibility to check out the content, using Zola compile it and commit the compiled sources into a branch under the same
project. This [branch](https://github.com/joesan/joesan-me/tree/gh-pages) will then contain the HTML's that will be integrated with the GH Pages for rendering. 

[Setting up GH Pages](https://docs.github.com/en/github/working-with-github-pages/managing-a-custom-domain-for-your-github-pages-site), and linking it to a custom domain name is pretty 
straightforward. As of today, my content is not yet live as I'm still deciding on organizing my content. Hopefully in a few weeks time, [bigelectrons.com](https://bigelectrons.com) will be
served via Zola and GH Pages. {{ textcolor(color="red" text="EDIT: The website was taken live on 22.02.2021") }}

I will wrap this up here and for me it is Zola and GH Pages for the foreseeable future for all my blogging needs.
