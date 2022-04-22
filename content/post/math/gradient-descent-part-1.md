+++
title="Math behind the optimizer which is behind a Neural Net"
description="Gradient Descent, a mathematical meaning"
date=2022-04-20
draft=true

categories = ["math"]
+++


## What is Gradient? What is descent?

To understand the mathematics behind gradient descent, you need to understand what a gradient is and what a descent is. Let us
spend some time to get this straight! If you know the equation that represents a linear function which looks like this:

TODO: Show y = mx + b

Where m is the slope of the function and b is the intercept, you can see that the slope, or the gradient is the property
of a linear function that indicates an increase, or a decrease while descent means moving downwards. So effectively a gradient descent 
is all about moving in a certain direction such that the value of a property is descending so that it descends to a minimum.

I hope that was enough for now! Let us now move on to deriving the equations for a gradient descent. 

## Intuition behind Gradient descent

To be able to derive the equations to calculate the gradient descent, let us consider the following equation which represents the function:

y = x²

A plot of this function would look like this:

![Plot of y = x²](/images/mlandai/mlandai-y-x2-plot.png)

Let us now pay attention to the different points marked in the graph (P1, P2, P3 and so on). Upon observation, it can be seen
that the steepness of the tangential line at points P1, P2, P3 differs and as we move closer to the point Px, where the steepness
is at its minimum. 

:bulb: The intuition behind doing gradient descent is to iteratively approach to this global minima where we need some way to identify
in which direction to go and how far in that direction to go. That is all to it.

Let us now delve a bit deeper into understanding how we can do gradient descent.

## The Error Function a.k.a The Cost Function

To keep the terminology simple, we will use the following:

:arrow_right: Loss Function - Computes the error for a single training example

:arrow_right: Cost Function - Computes the error over the average of the loss function across all the training examples

To be able to do gradient descent, we need to understand linear regression. I have written a blog content about linear regression
already [here](/post/math/linear-regression/), but I will walk through some basics here again.

A straight line is always represented using the following equation:

y = mx + b

where m is the slope, b is the y intercept at x = 0

With that understanding let us look at the following graph that shows some data or more precisely shows the relation between
a dependant variable (y) the price to the independent variable (x), the year

![Scatter Plot](/images/mlandai/mlandai-scatter-plot.jpg)

It can be seen that there is a linear relationship between both the variables. Now what would be the best fit line that
can be drawn in the plot such that it fits the data points? In other words, which line do you think is the best fit in the
graph below? The red line, blue line or the green line?

TODO: Show the data points with red, blue and green lines

To evaluate the best fit line, we define something called the cost function which is simply put the difference between the 
measured value, and the actual observed value at any given data point.

TODO: Show the Error graph

TODO: Show the cost function

There are various other ways to calculate the error / cost such as:

SSE (Standard Error of Estimate), RMS (Root Mean Squared Error), MAE (Mean Absolute Error), RSE (Relative Standard Error), but
for our case here, we will stick to the MSE (Mean Squared Error) function as our cost function.

The target would be now to minimize this cost function or in other words minimize the error and that line that gives us the
minimum error is actually the best fit line.here. But how do we not go about finding that best fit line? This is where we 
use the iterative approach optimization - The Gradient Descent!

## Here comes the Gradient Descent

Following up from the discussion above, the goal would be to calculate the error for a given value of m and b and then to
adjust the values of m and b in such a way that we can minimize the overall cost.

Now, if you take the values for the slope (m), and the y intercept (b), and plot it against the MSE, we will always end
up with a graph like below:

![MSE Plat Against m and b (Excuse me for the hand crafted graph, please assume that it is a 3-D graph :smile:](/images/mlandai/mlandai-mse-plot-vs-m-and-b.jpg)

TODO: Show the method of least squares linear regression graph
