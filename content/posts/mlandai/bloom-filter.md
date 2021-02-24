+++
title="TODO.... Add a proper title"
description="Dealing with False Negative and False Positive"
date=2021-02-26
draft=true

[taxonomies]
categories = ["Technical Stuff"]
tags = ["ml & ai"]

[extra]
toc = true
+++


## Definition
Simply put, a Bloom filter is a space-efficient probabilistic data structure with which we can determine the probable existence of a certain thing in a certain 
data set, and we can determine the non-existence of a certain thing in a certain data set with utmost accuracy. Doing all this is done in a memory space 
efficient way.

In a gist, Bloom filters are about determining if an element <span style="color:red">may be in a set</span> or <span style="color:red">is definitely not 
in a set</span>

## Allowed Operations

You can only do one of the two operations on a given Bloom filter. You could still extend the Bloom filter to remove elements, but we stick to these two
operations for discussion’s sake:

1. To Add new elements

2. To check if an element exist

## Mechanics

The Bloom filter works by populating a bit Vector of a specific length. To understand Bloom filter, we need to understand Hashing. You might have used 
Hashing in a cryptographic context where you take a data of arbitrary size, run it through some algorithm, and you get back a value that is of a fixed 
size or often times called the hash value. Most of the time such hash functions are one way operations. Why do we care about Hashing by the way for 
discussing Bloom filters? Using a simple non-cryptographic hash such as the murmur3 (multiply, rotate, multiply, rotate) is a good choice for doing lookup tasks based on hashes. It is 
a simple and a fast algorithm and finds its usage in common scenarios like checksum, id generators. So this becomes a natural choice for using with Bloom filters.

It is all about doing some math with the following four variables:

- <span style="color:red">n:</span> Represents the number of input elements

- <span style="color:red">m:</span> Represents the memory used by the bit-array or in other words, the size of the array

- <span style="color:red">k:</span> The total number of hash functions to be used

- <span style="color:red">p:</span> The probability of a false positive

![Bloom Filter 1](/images/mlandai-bloom-filter-1.jpg)

## Application & Usage

A definitive article on [Bloom filters could be found here](https://en.wikipedia.org/wiki/Bloom_filter)

## Further Reading

- For an interactive show on how Bloom filters work, [have a look here](https://www.jasondavies.com/bloomfilter/)

- Have a [look here on why murmur3 should not be used in a security context](https://www.anchor.com.au/blog/2012/12/how-to-explain-hash-dos-to-your-parents-by-using-cats/)