+++
title="Monads in Scala"
description="Context around some computation in a sequence"
date=2022-02-02
draft=true

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


Let us debunk this major, but simple functional abstraction called the [Monad](https://en.wikipedia.org/wiki/Monad_(category_theory))

## Intuition behind Monads

The idea stems from [category theory](https://en.wikipedia.org/wiki/Category_theory) and can be readily applied to elegantly
sequence computations around a specific context!

In simple terms, a Monad augments a certain value or more specifically a Type with some additional context. Such context is called effect. 
Some well-known effects are managing the Option[T] type and the Future[T] type which corresponds to managing null and asynchronous effects around
a type or a variable. If you have read my other blog article on [Functors](./scala-monads.md) which kind of revolves around the same idea of having
some context around some computation, with the only difference being that a Functor applies a function to a wrapped value, whereas a Monad
applies a function to another function. If this is not immediately obvious, well it will become obvious as you read along.

So, to be able to qualify as a Monad, we need two things:

1. A mechanism to wrap a value, or a Type around a context
2. A mechanism to sequence computations over a value, or a Type

At this point what needs to be kept in mind is the fact that Monadic operation is nothing but about extract-transform-wrap design pattern.

With this basic understanding of Monads, let us hit the ground with some examples!

## Hitting the ground

We first need a way to wrap a value or a Type in a context, which is when given a Type A, we need to get back a Context[A]. For example.,
this could easily be done with a simple interface in scala as below:

```scala
  trait Monad[M[_]] {
    def wrap[A](value: => A): M[A]
}
```

We have named that function as wrap, but if you pay close attention to it, it is just the identify function, or the unit function which
does nothing other than simply wrapping up the value that it is given into a Monadic context.

What we have done above is that we have created a trait of a higher kinded type (hkt), that takes a type parameter in the form of M[_] which
is like saying, I can construct a Monad implementation by plugging in a value for the type parameter like M[List], M[Option], M [Try] or M[Either] or
literally any effects with which I would like to manipulate my data contained in that effect. For simplicity, let us ignore hkt's for a 
moment and just deal with simple types. So our definition of a Monad will then look like this:

```scala
  trait Monad[A] {
    def apply[A](value: => A): Monad[A]
    def flatMap[B](f: A => Monad[B]): Monad[B]
}
```

 So with that in mind, we could say the 
following:

```scala
  trait Monad[M[_]] {
    def unit[A](value: => A): M[A]
}
```

TODO: Documentation

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

What we have basically done is, we have created a trait that operates on a generic context which is the F[_]. If you follow what
higher kinded types in Scala mean, that signature should be straight forward. It basically says that in the place of F[_], I can plugin
any context or container which itself is a context or a container to a certain type. For example., List, Option, Try, Either all are
containers that can contain a certain type. So they qualify to be the F[_] which can be exemplified as F[List], F[Option], F[Try], F[Either]
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