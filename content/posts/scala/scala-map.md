+++
title="Map'em up"
description="Details behind the higher order Map function in Scala"
date=2016-12-27

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++

No, it is not the Map implementation that we are going to talk about. Let me ask you a very simple question. I assume that you have written functions or 
methods or routines or whatever you call it. What do you think that it actually does? ...., 3...., 2...., 1.... TimeUp. Let me answer that for you.

A function or a method maps the thingy on the left to the thingy on the right. The thingy on the left is your function argument, the thingy on the right 
is the value that the function computed for you using the argument you supplied it.

```scala
myFunction(leftThingy) = {
...
val rightThingy = doSomething()
...
rightThingy
}
```

So effectively speaking, a function maps one thing to the other. That's all to it. Now what relevance has this got to do with Scala? In Scala, map 
is a [higher order function](http://en.wikipedia.org/wiki/First-class_function) that applies a function to each of the parameter that you pass to it 
and returns the results. A piece of code snippet is a lot better I suppose.

Let's say you have a List of Int's. You now want to calculate the square of each element in the List and return the result as a List. Let's start with 
defining a square function that takes an Int and returns the square of that Int. Effectively, you are mapping an Int value to the square of it which 
again is an Int value. Your square function maps an Int to an Int (Int => Int in Scala syntax)

```scala
def square(x: Int): Int = x * x
...
...
val myList = List(1,2,3,4)
val mySquareList = myList.map(square)
...
...
println(mySquareList) //would print List(1, 4, 9, 16)
...
...
```

What happened was, you mapped a set of inputs to a set of output by applying a function to each of the input values.
Did you get that? If not, I'm stupid you are brilliant.