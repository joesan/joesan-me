+++
title="Void NullPointerException with Scala Option"
description="I'm sure you would have gone through the NullPointerException pain"
date=2017-05-22

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


If you tell me that in your programming career, you have never been inflicted at-least once with a NullPointerException, you were simply the best programmer 
out there. <p>During the early days of my career. I can remember times and times again, I ended up hitting NullPointerException's until I really made
it a point to adjust my design to completely get rid of them. It was just me trying to get rid of them, but the NullPointers weren't prepared to 
leave me. Alright, let's look at it in steps!

I have a method called myMethod that returns me a String value after doing some lengthy calculation:

```scala
def myMethod: String = {
  ...
  val retVal = doLengthyCalculation()
  ...
  retVal
}
```

Now imagine that the myMethod is called by another method which would do something with the String value it gets.

```scala
def anotherMethod: String = {
  ...
  myMethod.equals("someValue") // Potential source for NullPointerException
  ...
}
```

From the above code snippet, it is obvious that myMethod could return a null value and when the caller tries to invoke a method on a null value... I don't 
want to say what happens next! You know it! So how does Scala deals with this? Scala, since being a functional programming language, has a concept called
Monad (borrowed from Category Theory). I won't go through what a monad it, but for a one-liner, here is what it is:

A monad is sort of a container of a certain type. You can unpack the container, do some operation on the type, pack the container back and keep doing this 
operation over and over again.

I know you might be scolding me as that definition did not make much sense. Yes I know that! For a detailed look into what Monads are have a 
look at this [wikipedia article](https://en.wikipedia.org/wiki/Monad_(functional_programming))

Now coming back to our code snippet, the method myMethod said to the external world that it is going to return a String but what happened eventually in our scenario is 
that it returned null which is a pure violation of the contract.

Scala solves this elegantly by introducing something called an Option. Now when I apply this Option as a return type to myMethod, it becomes:

```scala
def myMethod: Option[String] = {
  ...
  val retVal = doLengthyCalculation()
  ...
  retVal
}
```

The myMethod contract now says that, I may or may not return a String, so whoever calls me, be prepared to handle this. It is a lot better to know this 
beforehand than to wait until Runtime to beconfronted with a NullPointerException. The caller of myMethod would then handle this as described in the code
snippet below:

```scala
def anotherMethod: String = {
  ...
  myMethod match {
    case Some(strValue) => // Hurray no more NullPointerException's
    case None => // You know what to do
  }
  ...
}
```

Together with the Scala's pattern matching syntax, the Option types are an elegant way of dealing and avoiding NullPointerExceptions.