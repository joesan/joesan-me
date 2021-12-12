+++
title = "Plant-Simulator"
description = "Simulating the operations of a power producing unit"
date = 2017-08-31

tags = ["vpp", "akka", "monix"]
+++

If you are in the Energy & utilities industry, you might have probably heard about a concept called [Virtual Power Plant](https://en.wikipedia.org/wiki/Virtual_power_plant)

The idea is not new, but it is gaining importance as more and more power producing units (also power consuming units) gets distributed. What does it mean?
It just means that the internet offers the possibility to command and control remote power units. The way it works is relatively simple. One of the main uses
for such a virtual power plant is to provide flexibility services to the grid so that the grid is stable. 

Normally, the grid works by predicting the demand ahead, but as you know it is just a prediction from a historical value which means there is going to be a delta
plus or minus and this is not good for the grid. The grid has to be operated at it's set frequency otherwise there will be a blackout. This is exactly where
the virtual power plant's can be used.

The core of a virtual power plant is the software which aggregates smaller power producing units and virtually projects it as a big power plant which can then be
integrated to the grid. The grid operators are given this aggregated capacity (often called as flexibility) and can be used to offset grid imbalances.

So with that basic understanding of the virtual power plant, I created a simple simulator (a.k.a Virtual Power Plant or in general Digital Twin) that can aggregate and steer such power plants. It is not some system
that does some random simulation, but a real production ready code base that can take a beating. It is built truly on the principles of reactive programming.
I tried to incorporate all the best practices that could be attributed. For example., the application has the following features:

1. It is being kept updated for its dependencies using a bot
2. It is capable of working with any relational database, just change the DB configuration (Oracle, Postgress or MySQL)
3. It is extremely scalable
4. It has in-built alerting & monitoring with no additional dependency on any external library
5. It has a very good unit test coverage
6. It has an automated deployment mechanism (using GitOps)
7. It has deployment files that are run through CI / CD steps
8. It has streaming API's
9. It has back-pressure where necessary

On top of all that, it is built using Scala, Akka & Monix. Who needs Kafka? [Have a look here for the project](https://github.com/joesan/plant-simulator)
