+++
title="Converting collections to and fro in Scala / Java"
description="Yeah, it is about converting collections"
date=2017-03-14

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


Say that you have to use a Java library in your Scala application and this Java library has a couple of API's that require you to pass a Java collection 
type. Let's see how we can cope with it by looking at the following examples:

Suppose I have a Java ArrayList that contains some Integers that I want to map these List of Integers by incrementing 1 to each of the elements in the 
ArrayList as below:

```scala
scala> val javaList = new java.util.ArrayList[Integer]()
javaList: java.util.ArrayList[Integer] = []

scala> javaList.add(1)
res0: Boolean = true

scala> javaList.add(2)
res1: Boolean = true

scala> javaList map { i => i + 1 }
error: value map is not a member of java.util.ArrayList[Integer]
    javaList map { i => i + 1 }
```

As you can see that the message from the Scala compiler is very clear that there is no map function available to the ArrayList
that we need someway to tell the compiler to treat that as a Scala collection. Java Conversions to the rescue:

```scala
import scala.collection.JavaConversions._

scala> javaList map { i => i + 1 }
res3: scala.collection.mutable.Buffer[Int] = ArrayBuffer(2, 3)
```

What happened above is that we imported the JavaConversions package available in the Scala library to tell the compiler that it should implicitly convert 
the java.util.ArrayList to a closest possible collection type in Scala which in our case happened to be an ArrayBuffer. If you take a look at the
[Scala's API documentation](https://www.scala-lang.org/api/current/scala/collection/convert/index.html) on
JavaConversions</a> there is an implicit method called asScalaBuffer which was used in our example implicitly to convert the
java.util.ArrayList to a Scala collection type.

The JavaConversions package contains a couple of implicit methods to convert between a Java collection to a Scala collection and vice-versa. There is yet 
another package in the scala.collections called JavaConverters. What is the difference? Both the JavaConversions and JavaConverters do more or less the 
same thing, i.e., convert to and fro between a Java / Scala collection. You might be wondering over which one you should prefer. Let's find that out with 
the help of some more examples:

```scala
scala> val scalaMap = Map("A" -> 1)
scalaMap: scala.collection.immutable.Map[String,Int] = Map(A -> 1)

scala> scalaMap.contains(1)
error: type mismatch;
found   : Int(1)
required: String
scalaMap.contains(1)
^
```

What we did just now is instantiated an immutable Map from the Scala library that maps a set of String to Int. Remember, the syntax for Scala Map looks 
like below:

```scala
trait Map[A, +B] extends Iterable[(A, B)] with GenMap[A, B]
    with MapLike[A, B, Map[A, B]]
```

The contains method looks like below:

```scala
def contains(key: A): Boolean
```

What we did with our scalaMap variable above is that we created a Map that took a String as key and Int as value, so when we called the contains method 
and passed it an Int, it failed. The contains method implementation in Scala internally calls the get method to check if the key is contained in the 
collection. Now let's see what happens if we import the JavaConversions:

```scala
scala> import scala.collection.JavaConversions._
import scala.collection.JavaConversions._

scala> scalaMap.contains(1)
res1: Boolean = false
```

It kind of worked and returned false. Practically speaking the variable scalaMap does not contain 1, so returning false would look like the right thing 
to do. What was compromised here is the type safety that we had before importing the JavaConversions. Soon after importing the JavaConversions package, the 
Scala compiler gives an implicit call to the MapWrapper class wherein the MapWrapper class implements the containsKey method from the Java library. The 
implementation looks like this in the Scala library's MapWrapper class

```scala
override def containsKey(key: AnyRef): Boolean = try {
// Note: Subclass of collection.Map with specific key type may redirect generic
// contains to specific contains, which will throw a ClassCastException if the
// wrong type is passed. This is why we need a type cast to A inside a try/catch.
underlying.contains(key.asInstanceOf[A])
} catch {
    case ex: ClassCastException => false
}
```

As it can be seen, the containsKey takes an Object / AnyRef rather than the specific type which in our case is a String. With JavaConversions,
we went down from a stricter type to a more non stricter type. Let's see now how we could retain the stricter type by being a bit
more explicit, using the JavaConverters!

```scala
scala> val scalaMap = Map("A" -> 1)
scalaMap: scala.collection.immutable.Map[String,Int] = Map(A -> 1)

scala> import scala.collection.JavaConverters._
import scala.collection.JavaConverters._

scala> scalaMap.contains(1)
error: type mismatch;
found   : Int(1)
required: String
scalaMap.contains(1)
^
```

Did you see the difference? There is now no implicit conversion between the Java and Scala collection types. If you want the
scalaMap variable to be a java.util.Map, you now have to be explicit as below:

```scala
scala> scalaMap.asJava
res0: java.util.Map[String,Int] = {A=1}
```

So from my point of view, it is better to be explicit which would imply to use the JavaConverters instead of JavaConversions.