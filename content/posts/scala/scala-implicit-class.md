+++
title="Implicit Classes Scala 2.10 Extension Methods"
description="Extending using Extension Methods"
date=2017-01-16

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


Having worked with C# in the last couple of months, writing extension methods was one of the cool features that I appreciated a lot!

Extension methods are just a way to add new methods to the existing set of types. For example, the double type has several methods as part of
the Scala API. If you now want to add a method that finds the reciprocal of a double, the first thing that comes naturally would be to write
a helper utility function that does this for us. With extension methods, you can make that helper utility function look like as though
it is part of the API itself. So let's see how to write the reciprocal extension method on a double!

```scala
implicit class DoubleExtensions(val d: double) extends AnyVal {
  def reciprocal = 1 / d
}
```

A few points to note on the code snippet
1. The implicit keyword makes the primary constructor of the class available for implicit conversions
2. The implicit classes may be defined inside a trait, class or an object - good practice
3. Only one non-implicit argument is allowed in the primary constructor (the val d: double in the case above)
4. There may not be any method, member or object in scope with the same name as the implicit class

I find this pretty neat and very simple rules surrounding implicit classes!