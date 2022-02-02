+++
title="Functors in Scala"
description="Mapping one category in a container to another"
date=2022-02-01

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++

Let us debunk this major, but simple functional abstraction called the [Functor](https://en.wikipedia.org/wiki/Functor)

## Intuition behind Functors

The idea stems from [category theory](https://en.wikipedia.org/wiki/Category_theory) and can be readily applied to elegantly
look inside a container that contains a certain category and apply a function to the contents, thereby producing another category
wrapped inside the same container. The name of a functor sounds very much similar to that of a function and in fact it
is indeed the same, but there is this additional thingy called the container or in other words a context.

You might already be familiar with such contexts like List[A], Seq[A] that can hold zero to many values of type A. List or 
Seq can be said that they are the containers for holding elements or types of type A. Other containers or contexts like Option, 
Either, Future etc., also can be cited. Henceforth, we will use the term context instead of a container, but both mean the same.

## Hitting the ground
To manipulate the data inside a context could be done like this:

```scala
  // Let us use the Option as our context
  val somePerson = Some(Person("firstName", "lastName", salary = 1000000))
  if (somePerson.isDefined) {
    somePerson.get.map(person => person.copy(salary = 20000000))
  }
```

So, with that example., we simply checked if a Person exists and if yes, we manipulated his salary. That piece of code is
like telling to scala how to do, which is basically an imperative style of programming. We instead would want to say to Scala
just what to do and, the programming language should figure out how to do. This is where our Functor intuition could help us out.

Most of scala's context have built in functor like capabilities. Let us get to the following example:

```scala
  val listOfSalary = List(200000, 100000, 400000, 600000, 700000, 350000)
  val bonusFunction: Int => Int = baseSalary => baseSalary + 100000
  val finalSalaries = listOfSalary.map(bonusFunction)
```

With that code snippet, we have instructed Scala what we want which is to map the salaries to bonuses. The map function figures
out how to get the job done. Its signature is like this:

```scala
  trait F[A] {
    def map[A, B](f: A => B): F[B]
  }
```

Here F[A] is our container or context in which we have defined a map function that should know how to map from A -> B

Let us now define a simple Functor. You need three things to do that:

1. The container / context that you will plug in (List, Try, Either, Option etc.,) - F[_]
2. The Type from which you want to go from - A
3. The Type to which you want to go to - B

With that said, let us implement a Functor interface:

```scala
  import scala.language.higherKinds
  trait Functor[F[_]] {
    def map[A, B](fa: F[A])(f: A => B): F[B]
  }
```

What we have basically done is, we have created a trait that operates on a generic context which is the ```F[_]```. If you follow what
higher kinded types in Scala mean, that signature should be straight forward. It basically says that in the place of ```F[_]```, I can plugin
any context which itself is a context around a certain type. For example., List, Option, Try, Either all are
contexts that around a certain type. So they qualify to be the ```F[_]``` which can be exemplified as F[List], F[Option], F[Try], F[Either]
and so on. Have a lok [here for some basic understanding of higher kinded types](https://typelevel.org/blog/2016/08/21/hkts-moving-forward.html)

For the sake of this blog, let us implement a List Functor as below:

```scala
  val listFunctor: Functor[List] = new Functor[List] {
    def map[A, B](fa: List[A])(f: A => B): List[B] = fa.map(f)
  }
```

With that, we have now defined a context around List that knows how to map one category in a List to another category. I hope this
was clear enough.

## Functor laws

To qualify for Functorship, the following laws should be respected:

### Identity
This basically states that when a map is called on a Functor with an identity function, you get the same Functor back. Remember
that an identity function is one that returns the exact same input. So basically, we are saying that:

```
  Functor[X].map(identity) "should be equal to" Functor[X]
```

### Associativity
If f and g are two independent functions, then calling a map on f anf then g is as good as calling a map with g composed f or in other words 
calling g(f(x))

```
Functor[X].map(f).map(g) == Functor[X].map(x => g(f(x))
```

## Wrap up
So essentially a Functor is just doing this:

1. Unwrap a value from a context
2. Apply a function to that context
3. Rewrap that value back into that context
4. Return the new context

That is all what is to Functors. Really simple indeed!