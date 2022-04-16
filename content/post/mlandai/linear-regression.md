+++
title="Math behind simple Linear Regression"
description="Entry ticket into the world of ML"
date=2021-09-25
draft=true

categories = ["Technical Stuff"]
tags = ["ml"]
+++

I have been wondering on how the math behind a Linear regression looks like as in most of the ML books that you encounter, the focus will be on giving you a
linear equation and just plugging this equation in a Python library to solve for the slope and bias and then use it to predict the new values. It is very
rare that they show you how to find the m and b values. So here in this blog article, I have made an attempt to understand and document it. I have written a very
brief [article about it few years ago](https://bigelectrons.com/posts/math/linear-regression/), but that was just not detailed enough, so I thought to add some 
more juice to it.

Use this article as a reference as long as the world in linear!

## Introduction

Linear Regression is a simple technique that deals with linear dependant functions. What I mean by that is, given a variable that is independent and another
variable that is dependant, then you can express the relationship between them as an equation. For example., let us consider the relationship between house price
and the size of the house. From intuition, it should be obvious that the price of the house depends on the size of the house, so here size of the house
is an independent variable while the price of the house is a dependent variable.

This relationship (possibly linear) could be expressed in a very nice equation as:

$ y = mx + b $

where:

m - is the slope of the line (rise divided by run)
b - is the y-intercept (meaning the point on the y-axis where x = 0)

The figure below neatly summarizes this:

TODO.... Show the house size vs price linear graph

With this understanding, let us delve deep into finding out how to do Machine Learning for simple linear regression!

## Residual Sum of Squares (RSS)

Generally, the slope and the y-intercept are unknown, so before we can use the linear equation to predict what we want, we first need to identity what
the values for the Coefficients are. 

In plain english, we want to find m and b such that the resulting line is as close as possible to the observed data. There are numerous ways to find and measure
this closeness, but here we will stick with the simplest of all of them, the least squares method. Let us see how we use this to derive a formula to find m and b.

Let us assume that the equation below represents the prediction of the dependant variable y for a given ith value of the independent variable x:

$ \hat{y_i} = \hat{m}x_i + \hat{b} $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

Since this is just a prediction, we can say that there is some amount of error between the predicted value, and the actual observed value which is given by:

$ e = y_i - \hat{y_i} $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

where,

$ y_i $ represents the observed value for an ith element

$ \hat{y_i} $ represents the predicted value for an ith element

We can then generalize that the sum of all the errors across all observed data points would be:

$ RSS = e_1 + e_2 + e_3 + e_4.....+ e_n $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

We square the error term to avoid any negative effects, think about it, where the predicted value might be..... TODO answer why we square????????

## Cost Function

The cost function, or the hypothesis will be the measure of what we want to optimize so that the predicted value is closer to the observed value. So here with
linear regression, our goal will be to minimize the difference between the predicted value, and the observed value as given by the equation below:

$ ERROR = \y{hat} - y_i $

So with linear regression, our first goal is to minimize this cost function

## Estimating the Coefficients

So we now know what the cost function is, so let us try to find out the values for m and b such that the cost function is minimum, or in other words let us
try to find the values for m and b such that there is very little residual error, which in turn implies that our predicted line fits the dataset much better.

It becomes obvious to the mind that we are now dealing with a minimization problem where our goal is to minimize the cost function:

$ J_{(m, b)} = {\sum_{i=1}^{n}(y_i - \hat{y_i})^2} $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

As it can be seen from the eq. 1 is that the cost function J depends on m and b, so in order for us to evaluate the values for m and b, we will use partial 
derivatives. To find out m, we take the partial derivative of the Error function, or the Cost function with respect to m which is:

$ \frac{\partial J}{\partial m} = \frac{\partial J}{\partial ERROR} * \frac{\partial ERROR}{\partial m} $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

Hope that eq. 2 makes sense, if not here is an attempt to explain it:

The cost function J depends on the ERROR, where the ERROR itself depends on m and b. This basically follows from the chain rule of differentiation where
say having a function chain like:

x -> y where x is a function that depends on y

y -> z where y is a function that depends on z

Now, to find the partial derivative of x with respect to z, we do:

$ \frac{\partial x}{\partial z} = \frac{\partial x}{\partial y} * \frac{\partial y}{\partial z} $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

With this very same idea, in our case, we have a Cost function J that depends on the ERROR function, the ERROR function in turn depends on m and b, so
to find the partial derivative of J with respect to m, we use the chain rule and hence we end up with eq. TODO. Hope it was clear enough.

Now let us apply the partial derivatives to find out the values for m. Let us do it step by step. So looking at eq. TODO, we will first find the partial derivative of 
J with respect to ERROR. So using the power rule, we then have:

$ \frac{\partial J}{\partial ERROR} = 2 * ERROR $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

As a next step, let's find out the partial derivative of the ERROR function with respect to m. There is one important point to note here which is the fact that
wh....

$ \frac{\partial ERROR}{\partial m} = {\sum_{i=1}^{n}(y_i - \hat{y_i})} $

$ = {\sum_{i=1}^{n}(y_i - (\hat{m}x_i + \hat{b}))} $

$ = -x_i $

If you are wondering about it, the derivative of a constant is zero and here everything else other than m is a constant, hence their derivatives is zero

Now, by applying the values into eq TODO, we get the following:

$ \frac{\partial J}{\partial m} = 2 * ERROR * (-x_i) $

Rearranging we get,

$ \frac{\partial J}{\partial m} = \sum_{i=1}^{n} -2 * x_i * (y_i -  \hat{m}x_i - \hat{b}) $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

As a next step, we have to now find the partial derivative of J with respect to b. We will follow the same steps as before where,

$ \frac{\partial J}{\partial b} = \frac{\partial J}{\partial ERROR} * \frac{\partial ERROR}{\partial b} $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

First let us find the partial derivative of J with respect to ERROR which is

$ \frac{\partial J}{\partial ERROR} = 2 * ERROR $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

We will now find the partial derivative of ERROR with respect to b which is

$ \frac{\partial ERROR}{\partial b} = {\sum_{i=1}^{n}(y_i - \hat{y_i})} $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

$ = {\sum_{i=1}^{n}(y_i - \hat{m}x_i - \hat{b}}) $

$ = {\sum_{i=1}^{n}(y_i - \hat{m}x_i - \hat{b}}) $

$ = -1 $

Hope I do not have to explain how we got -1. Now let us as usual plug in the values into the equations where we get,

$ \frac{\partial J}{\partial b} = 2 * ERROR * (-1) $

Rearranging we get,

$ \frac{\partial J}{\partial b} = \sum_{i=1}^{n} -2 * (y_i - \hat{m}x_i - \hat{b}) $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

Are we sweating? I hope not! Wait! Wasn't the title of this blog post called "Simple Linear Regression......" Whoa! 

Let us once more write both these equations next to each other, as these will be the equations that we will need to work out the values
for m and b

$ \frac{\partial J}{\partial m} = \sum_{i=1}^{n} -2 * x_i * (y_i -  \hat{m}x_i - \hat{b}) = 0 $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

$ \frac{\partial J}{\partial b} = \sum_{i=1}^{n} -2 * (y_i - \hat{m}x_i - \hat{b}) = 0 $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

Wait a second, what the feck? From where did that equating to zero come from in the above two equations? Remember we are finding a minimum value for m and b and
it is obvious that the minimum happens at 0 or in other words the closer the values of m and b are to 0, the less total error for each of the
predicted data points will be. Hope it is clear!

So far so good! We now have these two equations that we can use to find one value from the other. Let's now do exactly that.

From eq. TODO, we have

$ \sum_{i=1}^{n} -2 * (y_i - \hat{m}x_i - \hat{b}) = 0 $

Bringing the Summation inside and getting rid of the constant -2, we get

$ \sum_{i=1}^{n} y_i - \sum_{i=1}^{n} \hat{m}x_i - \sum_{i=1}^{n} \hat{b} = 0 $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

There is one interesting fact that we can use which is the summation of 1 to n is simply n multiplied by its mean,

$ \sum_{i=1}^{n} x = n * \bar{x} $

Using this fact and applying it to the eq. TODO we get,

$ n * \bar{y_i} - n * \hat{m} * \bar{x_i} - n * b = 0 $

After rearranging, we get:

$ b = \bar{y_i} - \hat{m} * \bar{x_i} $

So finally, we have solved for the coefficient b. We need to do the same for m. Let us do that now!

$ \sum_{i=1}^{n} -2 * (x_i * y_i - x_i * (\bar{y_i} - \hat{m} * \bar{x_i}) - m * x_i^2) = 0 $

I will leave it to you to rearrange the above equation and just post the result here which is,

$ m = \sum_{i=1}^{n} (x_i * y_i - \bar{y} * x_i) / \sum_{i=1}^{n} (x_i^2 - \bar{x} * x_i) $

So there we have, let us for once write both these equations together:

$ b = \bar{y_i} - \hat{m} * \bar{x_i} $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

$ m = \sum_{i=1}^{n} (x_i * y_i - \bar{y} * x_i) / \sum_{i=1}^{n} (x_i^2 - \bar{x)} * x_i) $ {{ textcolor(color="red" text="-----> *eq (TODO)*") }}

The two equations above is what we have been aiming for, and we have it derived finally.
