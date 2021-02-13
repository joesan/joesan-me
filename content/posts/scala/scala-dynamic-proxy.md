+++
title="Scala's Dynamic Proxy"
description="Adding fields & methods at run time"
date=2017-03-23

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


One of the coolest features since Scala 2.10.3 are the Scala dynamic types. Let's look at what they are!

A dynamic type is a type with which we can dynamically add fields / methods to an existing type. This is better explained with some examples

Assume that we have a scala class as defined below:

```scala
  class MyClass {
    def myMethod(str: String) = println(str)
  }
  ...
  ...
  val myClass1 = new MyClass().myMethod("printme") // Fine!
  val myClass2 = new MyClass().notMyMethod("beep") // Yes you know it!
```

For situations like above, scala dynamic types come to the rescue. They are a mechanism by which we can intercept calls to a non-existing field or 
a method in a class

Let's now modify our MyClass and try to get rind of the compile error when invoking the notMyMethod!

```scala
  import scala.language.dynamics
 
  object MyClass extends Dynamic {
 
    private var myMap = mutable.Map[String, Any]()
   
    def myMethod(str: String) = println(str)
   
    def selectDynamic(args: String) = println("selectDynamic " + args)
   
    def applyDynamic(methodName: String)(args: Any*) = println("applyDynamic " + args)
   
    def applyDynamicNamed(methodName: String)(args: (String, Any)*) = println("applyDynamicNamed " + args)
   
    def updateDynamic(name: String)(value: Any) = { myMap(name) = value } // mutating sounds scary!!!
  }
```

Let's go through each one of those xxxDynamic methods that we added in the example above:

1. applyDynamic - Dynamically creates a method and the arguments as though that method was part of the declared type
2. applyDynamicNamed - Similar to applyDynamic, with the benefit that we can use a named argument
3. selectDynamic - Dynamically invoke a field as though that field was part of the given type (think of a getter)
4. updateDynamic - Dynamically update a field as though that field was part of the given type - (think of a setter)

I wonder why there is the updateDynamic, I would rather refrain from using it for obvious reasons that we all know (avoid mutability damn it!)

Try the following examples and figure out which xxxDynamic method is invoked in each case

```scala
MyClass.showMyAge("my age is", 34) - ???
MyClass.FUCK!! - ???
MyClass.printUser(userName = "Joe", age = "34")  - ???
MyClass
```

If you have got all the above examples correctly, you have understood the basics of Scala's dynamic types!