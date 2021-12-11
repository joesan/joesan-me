+++
title="Test private methods with Scala Test"
description="Private methods are code smell, but let's just test'em"
date=2017-04-26

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


I will not debate upon whether writing private methods are a code smell or not but rather just show how a private method can be unit tested using the Scala Test framework

Here is our test class where we would write a unit test which tests a private method called myPrivateMethod in a class called MyClass

```scala
class MyPrivateTester extends FlatSpec with Matchers with PrivateMethodTester {
  "PrivateMethodTester" should "be able to test a private method in MyClass" in {
    val privateMethod = PrivateMethod[String]('myPrivateMethod)
    val myClass = new MyClass
    val invocationResult: String = myClass.invokePrivate(privateMethod("param1", "param2"))
  }
} 
```

A few points to note about the test code is that we need to extend the PrivateMethodTester trait. The signature for a private method invocation looks like:

```scala
val privateMethod = PrivateMethod[ReturyType_Of_The_Private_Method_That_Is_Tested]('Private_Method_Name')
```

The type PrivateMethod is a type member of the PrivateMethodTester trait. We give it the return type of what the private method is returning together with the 
private method name.

Once we have the PrivateMethod defined, we can use it to actually call our private method on the object or class type that we want ot test. In our example 
above, we wanted to test the private method named myPrivateMethod available in the MyClass object. Assuming that myPrivateMethod takes two String arguments, 
the call to test this method would look like:

```scala
val invocationResult: String = myClass.invokePrivate(privateMethod("param1", "param2"))
```

The invocationResult is the result of calling the private method.