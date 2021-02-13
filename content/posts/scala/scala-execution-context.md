+++
title="What the heck are Scala's ExecutionContext's?"
description="Understanding Scala's Thread Pooling"
date=2016-12-27

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


An ExecutionContext or otherwise called a thread pool is vital when running asynchronous code. In Scala, there is a global ExecutionContext
that you can supply to your asynchronous code blocks. An ExecutionContext is just an Executor of a Task. It executes a Task in such a way that it is
free to execute the Task in a new Thread of its choice.

The Scala's global ExecutionContext uses a ForkJoinPool. The ForkJoinPool is an ExecutorService that executes a Task. Understanding and demystifying the 
ForkJoinPool is out of scope for this blog, but I will just highlight what it does to your asynchronous code block:

1. It makes your execution to run in parallel
2. Unlike other ExecutorService, the ForkJoinPool keeps an explicit association between tasks

So, the bare minimum that you have to know about the ForkJoinPool is that it is able to run small computations with little thread overhead!

Now when you wrap a piece of code in a Future block in Scala, there should be somebody, some thread to run that bit of code that is contained in your 
Future block. So from where does this thread come from? This is exactly where the global ExecutionContext from Scala pitches in.

There is yet another concept that is worth knowing about when using Future's and ExecutionContext's in Scala. Say you have a very slow computation that
might cost you a lot of Thread time, how could you indicate this message about the upcoming slow computation to the run time so that this slow computation
is given a special consideration and is made to run in such a way that you do not run out of threads when you have many of those slow computations waiting 
to happen. Enter the BlockingContext! Whack... yet another XXXContext!!!! Marking a piece of code in Scala in a BlockingContext is as simple as:

```scala
scala.concurrent.blocking { ... }
```

When you wrap your code in the blocking { ... } block, Scala places that block in a BlockingContext. What happens after that is better explained in the 
form of a dialogue that goes as:

BlockingContext - Hey, Current Thread, do you have to do anything before I'm about to start this slow thingy?
Current Thread - Oh... yeah, let me inform the ForkJoinPool about this
ForkJoinPool - I will give a special new Thread to handle this slow thingy, I will also defer this BlockingContext to the managedBlock in my pool

You see, this is essentially one of the best practices that should be followed when dealing with slow running computations. Just remember to wrap them
inside the blocking context!

So effectively Scala's Future's and its global ExecutionContext empowers you to write parallely executing code, keeps your CPU machinery in steam without 
going Thread-frenzy.