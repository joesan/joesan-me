+++
title="Understanding Back Propagation Neural Network Architectures"
description="Trust me, it is more than easy"
date=2019-12-10
draft=true

tags = ["neural-net"]
+++


Once you understand Feed Forward mechanism which isn't much useful when you do not back propagate to update the weights 
and refine your Neural Network, your Neural Network isn't of much use. So in this blog post, let us understand what is 
back propagation and how could we represent the back propagation mathematically!

Back propagation generally means that you distribute the errors to the hidden layers in a proportionate manner relative 
to how much the weights were contributing to the actual error in the subsequent layer. so the larger the weight, the 
more of the output error is carried back to the hidden layer.

To explain back propagation, let us consider the image below (yeah, hand drawn)

![Neural Network With One Neuron](/images/math-back-propogation-with-one-neuron.jpg)

We have 3 functions to deal with:

1. Loss Function: L = 1/2 (\hat{y} - y)²
2. Activation Function: A = 1 / 1+e⁻x
3. Summation Function: S = $$ \Sigma_{i=1}^n(x_i * w_1 + b) $$

With these 3 functions above, we can see a chain of dependencies between them. It can be said that the Loss Function L
depends on the Activation Function A, the Activation Function A depends on the Summation Function S. The Summation
Function S depends on the Weight inputs. So basically it is a chain of events. This can then be translated to:

A variation of any weight W_i causes the Summation Function S to vary
A variation of the Summation Function S causes the Activation Function to vary
A variation of the Activation Function A causes the Loss function to vary

Differential calculus gives us a neat way to capture and calculate how much are these variations going to be in the form
of a partial derivative and the chain rule.

∂𝓛/∂wᵢ =∂𝓛/∂A * ∂A/∂S * ∂S/∂wᵢ

That equation above calculates the rate of change of the Loss function with respect to a change in a specific weight W, while
keeping everything else in this universe as a constant (in our Neural net, keeping all other weights a constant). As you
can see that L depends on A, A depends on S and S depends on W_i and that explains those 3 partial derivatives from the 
above equation.

To generalize and to represent in a pure mathematical matrix notation, here is a sheet of paper where I have worked out 
the Math (in Matrix representation). I have *vectorised* the back propagation mechanism!

![Feed Forward Neural Network](/images/math-back-propogation-neural-network.jpg)

Now you might wonder from where did I arrive at my Milestone matrix notation. If you expand on 
that W<sup>T</sup><sub>hidden_output</sub> you will find out 
that this weights matrix is just a [Transpose](https://en.wikipedia.org/wiki/Transpose) of the original weights Matrix 
during the forward propagation phase. This is a big step in understanding the way we distribute the errors into the 
subsequent hidden layers of the Neural Networks. 

The hidden_output in my sheet above in the simple 2 layer, 2 node network mean that my hidden layer is also the input 
layer. The reason why I decided to call it as hidden_output is for the fact that a typical Neural Network will not just 
have an input and an output layer, but also several hidden layers. So don't be confused with the hidden_output, well I 
could have as well called it input_output! But nevertheless, you get the message! Don't you?

** APPENDIX **

A bit of terminology to be clear:

In general, the number of rows in the weight matrix represents the number of neurons in the current layer, while the 
number of columns represents the number of neurons in the previous layer. The weight matrix encodes the strength of the 
connections between neurons in the current layer and neurons in the previous layer.

The Input matrix is represented as a vector. If we have just one input with 12 features, then it is a 1x12 vector. If 
there is a batch of N inputs, you can represent the batch as a matrix of dimensions Nx12, where each row corresponds 
to a single input.

w12 -> Weight that goes to the 1st neuron from the 2nd input
