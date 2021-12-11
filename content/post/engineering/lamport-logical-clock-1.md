+++
title="Lamport's Logical Clock - Ordering Events in a Distributed System"
description="Logical clocks?"
date=2021-01-06

[taxonomies]
categories = ["Technical Stuff"]
tags = ["lamport clock", "distributed systems"]
+++


Basically a distributed system is one in which the components or processes or nodes that comprise a system is distributed across nodes or sometimes even 
across geographies. But these systems need to communicate with each other to accomplish something meaningful. The most efficient, scalable and proven way 
of making these distributed systems communicate is via passing messages, sometimes even having a messaging middleware (like Kafka for example.,) as a 
central component.

Now you can imagine when there is a very big carousel of such applications distributed across several nodes, where each communicate via passing messages, 
we need to somehow find a way to guarantee message ordering. Ok, yo we can rely on the system clock of the node? May be, but may be not. Here is why - 
System clocks struggle from [Clock Skew](https://en.wikipedia.org/wiki/Clock_skew) and [Clock Drift](https://en.wikipedia.org/wiki/Clock_drift). On a 
distributed system, you cannot have something that acts like a global clock as that would one massively bring down scalability and increase your single 
point of failure. So a finesse solution would be to have something like a logical clock that each node in the application tracks and knows how to adapt 
it's clock against it's own message evolution and for the messages that it received from other nodes. One such algorithm is the so 
called [Lamport Logical Clock](https://en.wikipedia.org/wiki/Lamport_timestamp#Lamport's_logical_clock_in_distributed_systems)

I will try to simplify with my explanation on how this algorithm works.

For the sake of simplicity, let us assume that in our world of distributed systems, only 2 nodes exist. I call it Node N1 and Node N2. These Nodes care 
about the following Events:

1. Events that are generated internally in the Nodes - I call them Node Event or simply NE
2. Events that are sent from one Node to the other - I call them Send Event or simply SE
3. Events that are received on a Node from the other Node - I call them Receive Event or simply RE
4. All nodes start with a Zero counter

Lamport's logical clock states that each Node should have some form of incremental value (could be timestamp, or an integer) that can be associated with an 
event and could be compared against another value. So in this case, let us assume that we just have a simple integer counter for our Nodes and this counter 
will be incremented for every event that happens (be it NE, SE or RE), but how it is incremented depends on the following conditions:

For any NE, the counter will be incremented and the new Event will have the incremented counter value

For any SE or RE, the following has to happen:

1. The sender Node need to send the Event with the current counter value that the Event which is being sent has
2. The receiver Node, upon reception of the message, should then check for the counter value and should make sure it satisfies the following conditions:
   2.1 The time of reception should be greater that the time of send
   2.2 The receiver node should check against it's very own logical counter, and use the formula below to update the counter value in the newly received message
   new counter value = max(receive event counter++, local counter)

So what happens at 2.2 is that as soon as a Node receives an Event, it immediately increments the counter value which is in the event and then 
checks / compares against its local counter value and whichever is the maximum, will then be this event's new counter value. The global counter in this 
node is then updated with this latest counter value.

So there you have it, without any pictorial representation, we have the Lamport Logical Clock unbundled!
