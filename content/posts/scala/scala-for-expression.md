+++
title="Scala's for expression"
description="A deeper look into Scala's for expression"
date=2016-06-14

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


This blog article takes a deeper look into Scala's for comprehensions. The for comprehension / expression in Scala has the following syntax:

```scala
  for ( seq ) yield expr
```

In deed a very simple syntax underneath which lies a very strong fundamental concept. The seq in the syntax above could be a sequence of 
*generators*, *definitions*, and *filters* each separated with a semicolon. Let us assume that we have to identify all the Persons 
from a List that matches a certain criteria. Of course this is Scala and there are zillions of way to do this, but the focus of this article is to 
discuss about *for* expressions. Let's now see how we can accomplish this in just 2 lines of code.

```scala
  val persons = List(person1, person2, person3)
  for ( person <- persons; age = person.age; if(age > 18) ) yield person
  // for (generator; definition; filter) yield value
```

In fact that was indeed a one liner. What we did was that we filtered for all persons that are 18 years or more old. Let's focus on each one of 
those sequences. Let's begin with the generator.

The generator syntax *pat <- expr*, where expr typically returns a type that can be iterated over. In simple terms, a generator is anything or 
rather any type that has a method map, flatMap and a filter. Let us verify this ourselves with the help of the following code:

```scala
  val myInt = 10
  for ( i <- myInt; if(i > 10) ) yield i
  error: value filter is not a member of Int
      for ( i <- myInt; if(i > 10)) yield i
                 ^
```

The code above fails for obvious reasons that type Int does not contain a filter method defined and hence does not qualify to be as a generator. Let's now 
modify it slightly and see what happens:

```scala
  val myIntList = List(1,2,3,4,5)
  for ( i <- myIntList; if(i > 4) ) yield i // returns List(5)
```

The myIntList now qualifies as a generator as it satisfies the 3 conditions that we laid out earlier for a generator. Before going further, let me leave 
you with a slightly more complicated example. I will leave it to you so that you can figure that out by yourselves. If you have done nested for loops in 
Java, the answer should be pretty obvious.

```scala
  val list1 = List(0,1,2,3,4)
  val list2 = List(5,6,7,8,9)
  for ( i <- list1; x <- list2; if(i >= 4) ) yield i // ??? What happens?
```

Revisiting our Person list example:

```scala
  val persons = List(person1, person2, person3)
  for {
    person <- persons
    age = person.age
    if (age > 18)
  } yield person
```

The generator iterates through the person list and for each person in the list, the age of that person is extracted into a local val age, the age is 
checked if it is greater than 18, if yes that person is added to the result of the for expression.