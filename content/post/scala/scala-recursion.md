+++
title="Going behind Scala's recursion"
description="Tail and head recursion for writing some elegant and efficient code"
date=2018-09-18

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


There are times when we might want to call a function which calls itself repeatedly n number of times. In my career programming with Java so far, I have 
not written any single recursive functions, the main reason being that writing recursion was hard with Java. Java is best suited for an iterative approach. 
Sometimes a recursive code is a bit hard to read and follow. It is not that self intuitive as with an iteration.

Behind the scenes, during each function call the local variables used within the function are placed on something called a call stack. The stack is 
unfortunately and fortunately limited in size and resources. If our recursive logic spirals out of control, we could very quickly fill up such a stack,
deplete all your resources and bring our entire application down. We certainly want to avoid this from happening, so we write iterative logic which has a 
certain definite exit point, thus preventing us from any stack overflow errors.

A functional language like Scala handles recursion much more elegantly and invites us to favour recursion instead of iteration.

Broadly speaking, there are two kinds of recursion in Scala, the head recursion and the tail recursion. The main difference between the two is in the way 
Scala handles the function evaluation with the function call. In head recursion, the function makes a recursive call, the body of the function is evaluated 
using the result of the recursive call. In case of tail recursion, the function body is evaluated first, the result of the evaluation is used to make the 
recursive call. If there was no concept called tail recursion in Scala, we would have been still left to deal with stack overflows like we experience in 
Java, but tail recursion does some magic behind the scenes for us. Not so clear? Let's look at some practical examples:

```scala
def headRecursive(intList: List[Int]): Int = {
  if (intList.length == 0) 0
  else intList.head + headRecursive(intList.tail)
}

val sumOfInts = headRecursive(List(1,2,3,4,5,6,7,8,9)) // prints 45
```

Other than me defining the method name in the code snippet above to be called headRecursive, we can say that it is a head recursive function. If you take a 
deeper look into the method again, in the else block, to evaluate the line:

```scala
"intList.head + headRecursive(intList.tail)", 
```

a call to the headRecursive(intList.tail) has to return. What happens effectively is that the recursive call is first made, then the head of the List is 
added to the result of the recursive call, the value is then finally returned.

So the runtime needs to know what was the value of the head element in the List, the result of the recursive call and it has to somehow store them into 
something called a call stack. So effectively, there is one call stack per recursive call. There is now an obvious reason to worry about stack overflows 
in case of a relatively huge List.

Let's now understand how tail recursion helps us solve this problem with the same example tweaked a little:

```scala
@@scala.annotation.tailrec
def tailRecursive(intList: List[Int], accumulator: Int): Int = {
  if (intList.length == 0) accumulator
  else tailRecursive(intList.tail, accumulator + intList.head)
}

val sumOfInts = tailRecursive(List(1,2,3,4,5,6,7,8,9), 0) // prints 45
```

The difference now is pretty straight forward, no not just in the method name, but the last call in the method is actually calling itself without any 
additional calculation which expects the method to first return the value and then perform the calculation. In the tail recursive case above, the sum is 
first evaluated (in the accumulator + intList.head) and then the recursive call is made.

This way, there is no need for the runtime to store the local variables during each recursive call in a call stack. The runtime can re-enter the same call 
stack again and again thereby eliminating completely a potential stack overflow error. Was that clear enough?