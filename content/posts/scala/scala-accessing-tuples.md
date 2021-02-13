+++
title="Accessing Tuples in Scala"
description="Annoyed with accessing Tuples by calling numbers?"
date=2016-05-13

[taxonomies]
categories = ["Technical Stuff"]
tags = ["scala"]
+++


Scala seems to be like a gold mine, the more you dig into, the more you get. While you deal with tuples, when you want to access the elements of a 
tuple, you have to use the default numbering given to you by the Scala compiler. Say for example.,
you have a tuple as defined below:

```scala
val myTuple = (31, "Joesan", "M")
println(myTuple._1) // To access the first element
```

What you could alternatively do is to decompose the tuple into its constituent elements as below:

```scala
val myTuple = (31, "Joesan", "M")
val (age, name, sex) = myTuple
println(age) // To access the age set in myTuple
println(name) // Did you get the idea...
```

I find this way of decomposing the tuple and accessing the elements from it using some meaningful names
much more elegant than fiddling around with numbers which unfortunately does not say much on what you are reading.
