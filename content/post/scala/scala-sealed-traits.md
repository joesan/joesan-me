+++
title="Sealed Traits in Scala"
description="Sealed traits, and the Compiler help"
date=2016-04-06

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


You probably know the idea behind using case classes and pattern matching them. Sometimes you might want the help of the compiler to tell you if you have 
pattern matched correctly by covering all possible cases. You can now get this sort of compiler support by creating a superclass for the case classes 
and marking them as sealed.

```scala
sealed trait Person
case class Student(name: String) extends Person
case class Teacher(name: String) extends Person
case class Author(name: String) extends Person
case class Bertender(name: String) extends Person
...
...
def printAPerson(person: Person) = person match {
  case p @@ Student(_) => println(p)
  case p @@ Teacher(_) => println(p)
}
```

With the code above, the compiler would now tell us that the match is not exhaustive and would show us the following:

```
warning: match may not be exhaustive.
It would fail on the following inputs: Author(_), Bertender(_)
def printAPerson(person: Person) = person match {...}
```

Sealed traits or abstract classes is a guarantee for the compiler to know that all the classes that implement
the sealed trait or sealed abstract class should be declared in the same file. This way, the compiler knows
for sure that all the possible subclasses is in the same file and can therefore provide us with the warning
message on our pattern match logic.

Now it's time for you to go figure out the meaning of the following code snippet:

```scala
def printAPerson(person: Person) = (person: @@unchecked) match {
  case p @@ Student(_) => println(p)
  case p @@ Teacher(_) => println(p)
}
```
