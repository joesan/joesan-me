+++
title="Handling cascading failures in an Application jungle"
description="Some proven patterns that actually work"
date=2021-04-06
draft=true

categories = ["Technical Stuff"]
tags = ["distributed systems"]
+++

TODO: Under documentation....

A piece of software is just like a person. It cannot exist alone, it needs other software with which it can and should 
interact with for accomplishing a certain piece of task. This implies that we will have to deal with multiple software 
systems at once and even more, we need to be able to isolate a problem in a Software, or an application such that it's 
effect is not felt by the other applications. In this blog post, I would like to explore a bit on what possibilities
exist to safeguard applications from a cascading failure effect.


