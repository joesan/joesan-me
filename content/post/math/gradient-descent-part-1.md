+++
title="Math behind the optimizer which is behind a Neural Net"
description="Gradient Descent, a mathematical meaning"
date=2021-04-15
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

## Error Function a.k.a the Cost Function

To be able to derive the equations to calculate the gradient descent, let us consider the following graph which represents the function:

TODO: Show y = x²

TODO: Show the graph for y = x²

Let us now pay attention to the three points marked in the graph (P1, P2 and P3). What do you think is the slope on these 3 points?
To be a bit more clear, let us put some numbers against the x and y-axis where the graph now looks like below:

TODO: Show the graph for y O= x² with some points P1 P2 and P3

The slope and the points P1, P2 or P3 or as a matter of fact at any given point in the graph is simple the ratio of rise divided by run

TODO: Slope at point P = rise / run

The slope at point P1 represents a negative slope, meaning that the value of y decreases as the value of x increases which is
kind of obvious from the graph. The slope at point P2 represents a positive slope, meaning that the value of y increases as the 
value of x increases and the slope and point P3 represents a constant slope where the value of y remains a constant for changing
values of x.


