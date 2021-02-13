+++
title="Partial Functions in Scala"
description="Understanding Scala's Partial Functions"
date=2016-09-23

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


Before taking a look at what partial functions in Scala is, let's look at some examples that map an assorted List of elements:

```scala
  val assorted = List(1,2,"joe","san")
  assorted map { case i: Int => i + 1 }
```

The code above when tried results in a match error. The reason being that we have an anonymous function inside the map block that checks against each 
element and since the match is not exhaustive, it explodes with an error. Let's try the same example with the collect method available in the Scala collection
library

```scala
  val assorted = List(1,2,"joe","san")
  assorted collect { case i: Int => i + 1 } // gives List(2,3)
```

Why did map fail while collect did what we wanted? If you look at the method signatures from the Scala API, it is pretty obvious that collect takes in 
something called as a partial function, which becomes the topic of this article. Here is my explanation and understanding of what a partial function is:

A partial function is any function that is defined for a subset of its input domains. Let's take a small example to understand this:

```scala
  def add(i: Int) = i + i
```

The input domain to this simple add function is the set of all integers. The add function holds good for the set of all integers, i.e., across the whole 
integer domain. You pass it any input int value, you will get a result which is also an int in this case. Let's take another case, but remember the fact 
that the function should work for any input in that particular domain and produce us a result.

```scala
  def divide(i: Int) = 1 / i
```

What happens if I call divide(0)? We should have got a result, but that did not happen. Instead we failed with an error or an exception. So how do I define 
this divide function in plain sentence? The divide function divides the input for a set of <strike>all</strike> partial input domains! Does that make sense? 
The divide function works only for a partial set of integer domain. Let's now fix the divide function to make it cope up with the failure (divide(0))... no no not 
with try catch!, but with Scala's built-in support for defining partial functions!

Our refactored divide function as a partial function can be written as below:

```scala
  val divide = new PartialFunction[Int, Int] {
    def apply(x: Int) = 1 / x
    def isDefinedAt(x: Int) = x != 0
  }
```

We have now made the divide function to be a partial function. We can now check if the divide function operates for any of the input domain and decide if we 
call the function or not. The following example illustrate this:

```scala
  divide.isDefinedAt(0) // tells us that it is not supported by returning false!
```

Let's now rewrite the same example but this time with a case block! This is just a Scala shorthand way to define a partial function.

```scala
  val divide: PartialFunction[Int, Int] = {
    case i: Int if i != 0 => 1 / i
  }
```

Where did our apply and isDefinedAt go with our re-written partial function example? If you are just curios, try compiling your code and have a look at 
how this is expanded upon compilation. I'll leave that to you! If you are a bit lazy to look into the 
compiled code, [have a look at this post](http://www.coderanch.com/t/639519/Scala/Scala-Partial-Functions-Short-form#2934391):

The Scala's partial function trait has the following signature:

```scala
    trait PartialFunction[-A, +B] extends (A) ⇒ B
```

The definition as per Scala docs, a partial function is any function where the domain does not necessarily include all values of type A. Anybody who 
implements the partial function trait has to provide implementations for apply and isDefinedAt abstract functions which takes the type A and defines if 
that instance of type A belongs to the domain covered by the partial function. So that wraps our discussion on partial functions in Scala!