+++
title="Pattern Matching Scala Collections"
description="Doesn't the title say it all?"
date=2017-01-04

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


One of the astonishing features that Scala has is the pattern matching mechanism. Think of it like a Java Switch statement on Steroids. Pattern matching 
is such a powerful concept in Scala. Once you start using them, you'll find it inevitable to not using them. Let's look at some examples

You want to pattern match a List based on the number of elements in the List : 

```scala
def patternMatch = {
  val matchResult = List(1,2,3,4,5) match {
    case Nil => "Matches an empty List"
    case head :: Nil => "Matches a List that has exactly one element"
    case head :: tail => "Matches a List that hast at-least one element"
  }
}
```

What is happening in the above code snippet is that, the myList is run through the case blocks. It is obvious that myList has more than one element in it 
and hence the last case statement is matched where the following statement is returned as the matchResult.

If you are wondering what the case syntax is all about, here is a quick description of what it is:</p>

```scala
case <i>pattern</i> => <i>expression</i>
```

The case is a Scala keyword, the pattern is what you specify for the supplied value to be checked against and the expression is what you
want to be returned if the pattern matches. Simple or?