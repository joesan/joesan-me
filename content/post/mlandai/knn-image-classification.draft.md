+++
title="Classifying Images Using K-NN algo"
description="Tell me who your neighbours are, I'll tell you who you are"
date=2021-08-29
draft=true

categories = ["Technical Stuff"]
tags = ["ml"]
+++

In this blog article, we will focus on understanding using K-NN algorithm to classify images. We will wrap up the article
with a simple K-NN algorithm implementation that can classify dogs and cats from a given image.

## Introduction

Classifying images based on the content of the image is an interesting concept and has applications in many fields. There are
several ways and numerous algorithms (using CNN) that can be used to classify images, but here we will stick with the 
simplest of them, the K-NN algorithm which simply works by calculating the distance between feature vectors. So the basic
idea is that similar feature vectors lie closer together.

K-NN is a supervised learning algorithm as it relies on labeled input data to learn. The assumption is that similar things
exist in proximity.

## Pre-Requisite

To be able to apply the K-NN on our image set, we first need an image set. There are quite a few sources for obtaining images, 
but to keep things simple, we will just use images of dogs and cats and try to classify them. Head over to [Kaggle](https://www.kaggle.com/datasets?search=cats) 
and you should be presented with tons of image sets for test purposes.

Apart from the image themselves, one of the basic requirement for the image dataset is that they should have the same fixed
feature vector size. For the images, this just means that they should have a similar width & height.

## Image PreProcessing

## K-NN

As mentioned earlier in the Introduction, the K-NN algorithm relies on the distance between similar things, but how do we 
actually calculate distances? There is something called a distance metric and there are a few available distance metrics as listed
below:

1. Euclidean Distance
2. Manhattan Distance

There are a few more, but I'm limiting myself to explaining these two!

### Euclidean Distance

In simple terms, it is a measure of the true straight line distance between two points in the Euclidean space. The basic idea
actually stems from [Pythagorean theorem](https://en.wikipedia.org/wiki/Pythagorean_theorem). Let us explore a bit on this
distance function. Have a look at the graph below:

It is evident from the graph that the distance if given by the formula:

![Bloom Filter 1](/images/mlandai/mlandai-distance-formula.jpg)

where xi are horizontal distances, yi are vertical distances

## Data Loading

TODO

## The Algorithm

TODO

## Train & Validate

TODO

## Test

TODO

