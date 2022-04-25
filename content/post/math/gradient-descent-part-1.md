+++
title="Gradient Descent, the engine behind a Neural Net"
description="Math behind the optimizer which is behind a Neural Ne"
date=2022-04-20
draft=true
enableMathNotation = true

categories = ["math"]
+++

WARNING: You will be confronted with hand drawn graphs, be ready to accept it! If you cannot tolerate it, just get out now!

## What is Gradient? What is descent?

To understand the mathematics behind gradient descent, you need to understand what a gradient is and what a descent is. Let us
spend some time to get this straight! If you know the equation that represents a linear function which looks like this:

:arrow_right: y = mx + b

Where m is the slope of the function and b is the y-intercept at x = 0.

With that very basic understanding, let us look at the following examples of a such a straight line:

![Plot of different straight lines](/images/mlandai/mlandai-gradient-plot.jpg)

The image above shows different straight lines with the leftmost image (1) being steeper than to the rightmost image (4). A measure
of how steep a line is, is what is called as the slope or in other words, is called the gradient. A gradient can also indicate
the direction. For example., looking at the image below:

![Decreasing vs Increasing Gradient](/images/mlandai/mlandai-gradient-decrease-increase.jpg)

We can see that the gradient decreases (1), indicating a movement towards down and in (2) the gradient increases, indicating a movement towards
down. A gradient indicates to us how steep a given line is and in which direction is this steepness happening.

:arrow_right: For the graph at (1), the rise or fall is simply the difference between the two y co-ordinates which is P2 - P1 = 3 - 5 = -2

:arrow_right: For the graph at (1), the run is simply the difference between the two x co-ordinates which is P2 - P1 = 5 - 3 = 2

Hence, the slope would be: rise divided by run which would give us -1, indicating a decreasing slope. Likewise, if you calculate the 
slope for the graph at (2), you will get a positive value for the slope indicating that it is an increasing slope. So there 
you have it, gradient explained!

A descent simply tells us by how far the jump from one place in the line happens to the next place in a line or a curve. It will
be clear as we move through some examples. Just read on!

With that being said, the general intuition behind doing gradient descent is to figure out how to arrive at the global minima by
taking a direction and by taking a proportional step towards that direction. For example., paying attention to the image below
should indicate the global minima is at point Px for the function represented by the equation:

y = x² + 0.5

![Plot of y = x² + 0.5](/images/mlandai/mlandai-y-x2-plot.jpg)

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

We know now a straight line is always represented using the following equation y = mx + b, where m is the slope, b is the y intercept at x = 0

With that understanding let us look at the following graph that shows some data or more precisely shows the relation between
a dependant variable (y) the price to the independent variable (x), the year

![Scatter Plot](/images/mlandai/mlandai-scatter-plot.jpg)

It can be seen that there is a linear relationship between both the variables. Now what would be the best fit line that
can be drawn in the plot such that it fits all the data points? In other words, which line do you think is the best fit in the
graph below? The green line, yellow line or the orange line?

![Best Fit Line Plot](/images/mlandai/mlandai-lin-reg-plot.jpg)

To evaluate the best fit line, we define something called the cost function which is simply put the difference between the 
measured value, and the actual observed value at any given data point.

![Best Fit Line With Error](/images/mlandai/mlandai-error-scatter-plot.jpg)

If we assume that the best fit line as shown in the graph above, the error would then be the difference between the actual
observed value, and the predicted value. So for the Point P from the image above, we can say that the error is the difference between
the Pobserved and the Ppredicted

:arrow_right: ERROR = Pobserved - Ppredicted

We have just defined the error for one such measurement, but we need to do that for the whole dataset which is then defined by
the following function:
![](/images/mlandai/mlandai-gradient-error-1.png)
We are not quite there yet, taking a mean value across the error, we arrive at the standard Mean Squared Error (MSE) which is:
![](/images/mlandai/mlandai-gradient-error-2.png)
MSE is one such way to arrive at the error and there are various other ways to calculate the error / cost such as:

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

![](/images/mlandai/mlandai-gradient-partial-1.png)
![](/images/mlandai/mlandai-gradient-partial-2.png)
A few things could be said about the set of equations from above:

1. We use the chain rule for the derivatives, if unsure what it is, take a look [here](https://en.wikipedia.org/wiki/Chain_rule)

![](/images/mlandai/mlandai-gradient-partial-3.png)
So there we have it! The equations eq (1) and eq(2) represents the rate of change of J relative to m and b respectively.

All now is left is to update the values of m and b using:

m = m - L * partial derivative of J relative to m -- eq(3)

b = b - L * partial derivative of J relative to b -- eq(4)

Where L represents the learning rate (remember the descent, this is exactly it). So now we have worked out the Gradient Descent
equations. Now all is left is to convert these equations eq(1) to eq(4) into a function and do this iteratively until
 we have reached the global minima.