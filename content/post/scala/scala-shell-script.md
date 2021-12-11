+++
title="Running Scala from within a shell script"
description="Might be useful at times"
date=2021-04-10

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++

Sometimes you have the need to run a shell script for some basic functions or simple tasks that you want to execute locally on your machine. The goto choice
will be to write some shell script (assuming you are on a Linux). Here is a way to do that but use Scala, your favorite language.

It is actually quite simple as it can be seen from the snippet below:

```
#!/bin/sh
exec scala "$0" "$@"
!#
object HelloShell {
  def main(args: Array[String]) {
    println("Hello, shell! " + args.toList)
  }
}
```

Worth mentioning is this line ```exec scala "$0" "$@"``` where:

0  Expands to the name of the shell script

@  Expands to the positional parameters, starting from one

Calling it is pretty simple! Save it as helloShell and run:

```shell
./helloShell.sh shebang
```

Apart from the [Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)), there is nothing specific to the Shell script! Everything underneath is just pure 
Scala. The goal of this article is to showcase a small need that I had with respect to my blogging content. I frequently have the need to write about certain
topics, but I could not get them completed in one sitting. I often times have to keep these new articles / blogs pending for quite some time, until I get the
time to work on them. Fortunately, [Zola](https://www.getzola.org/) the underlying engine that I use for powering my blogging content, has a neat mechanism
to indicate any unfinished content as a draft. 

As every content here is written as a Markdown content, it starts with some metadata that the Zola engine leverages to generate html. Here is a sample:

```
+++
title="some title"
description="Some description"
date=2021-04-06
draft=true

[taxonomies]
categories = ["Technical Stuff"]
tags = ["distributed systems"]
+++

The actual blog content starts here....

```

Have a [look here](https://github.com/joesan/joesan-me/tree/master/content/posts/scala/scala-shell-script.md) for the content of this page as a Markdown. Ok so what has this 
got to do with this article? Well, nothing much, but I would want to know what all content has been marked with ```draft=true``` so that I know which ones I should come 
back later and finish the writing. My love for Scala forced me to write this search as a script.

You can [find the script here](https://github.com/joesan/joesan-me/tree/master/.github/scripts/list_draft_content). To call the script, we just do:

```shell
./list_draft_content content draftStatus
```

Where, the first argument is the folder where we want to recursively search for markdown files, and the second argument is the name of the file where we want to write all the 
entries that are found! Quite simple!

I have also integrated this in my [GitHub Action workflow](https://github.com/joesan/joesan-me/blob/master/.github/workflows/main.yml) as a job (listDraftContent) which will 
then run this script and write a file called [draftStatus.txt](https://github.com/joesan/joesan-me/blob/draft-status/draftStatus.txt) as a new branch called draft-status. 

Cool or?