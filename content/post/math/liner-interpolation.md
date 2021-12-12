+++
title="Liner Interpolation"
description="Linear Interpolation in the XY plane using Scala"
date=2016-01-13

categories = ["Technical Stuff", "Math"]
tags = ["blog"]
+++


In mathematics, linear interpolation is understood as a method of curve fitting using linear polynomials.
A polynomial is just an expression that consists of variables along with their co-efficients. An example of a polynomial would be:

```
x+2y&sup2
```

In the above equation, the variable x has 1 as its coefficient, the variable y has 2 as its coefficient. Let us assume that we have a set of linear 
data points pointing to the x and y-axis:

```
x = {2,5,7,10,11,15,17,19,21,25}
y = {3,6,8,10,14,16,19,21,23,26}
```

Given a value x, we can find the value y. For example., for x = 2, the corresponding y is 3, for x = 11, the
corresponding y is 14. Now we are interested in finding the value of x and y within our set of data points.

What is the value of y for x = 13 or what is the value of x for y = 13. Since the data points for both the x and y
co-ordinates are linear, we can use the linear interpolation technique to find out the values for
the desired data points. Geometrically, the linear interpolant is just a straight line between two known data points.
Let us assume that our two data points are represented as (x0,y0) and (x1,y1). We are interested in
finding the values of x and y that lies between these data points. Since we are in the linear boundary, geometrically
speaking the ratio of the difference between x and y co-ordinates between two data points are equal.

Let us try to ascertain this with some numbers. Let our data points (x0,y0) be (2,3) and (x1,y1) be (5,6). The
ratio y1/x1 should be equal to the ration y0/x0 and in our case, 6/5 == 3/2. Extending this idea, we can
now say that the ratio of the difference between two data points should be geometrically equal between the two
co-ordinates. If we are interested in a data point (x,y) which lies in-between (x0,y0) and (x1,y1), our
formula now becomes:

```
y - y0 / x - x0 = y1 - y0 / x1 - x0 which when solving for y, we get the following equation:
y = y0 + (y1 - y0) * (x - x0) / (x1 - x0)
```

We now have the formula for linear interpolation, let's now implement that in Scala. Let us represent our data
points as a Scala List:

```scala
  val x = List(2,5,7,10,11,15,17,19,21,25)
  val y = List(3,6,8,10,14,16,19,21,23,26)
  val zippedDataPoints = x zip y
```

We define a function that takes these two zipped List of data points and an additional parameter for x. The function
uses the formula to find the value of y for a given x. Here is the function:

```scala
def interpolate(givenX: Int, dataPoints: List[(Int, Int)]) = {
  // edge cases
  val (headX, headY) = dataPoints.head
  val (lastX, lastY) = dataPoints.last
  givenX match {
    case a if givenX >= lastX => lastY
    case b if givenX <= headX => headY
    case c => {
      val (lower,upper) = dataPoints.span { case (x,y) => x < givenX }
      val (x0,y0) = lower.last
      val (x1,y1) = upper.head
      // finally our formula!
      y0 + (y1 - y0) * (givenX - x0) / (x1 - x0)
    }
  }
}
```

Let's now write some tests to test our interpolation (using ScalaTest):

```scala
  interpolate(2, zippedDataPoints)  == 3
  interpolate(4, zippedDataPoints)  == 5
  interpolate(27, zippedDataPoints) == 26
```

So there it is! we have our linear interpolation implemented using Scala!
