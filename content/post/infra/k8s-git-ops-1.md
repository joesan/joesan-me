+++
title="GitOps with K8s"
description="The way DevOps should have been"
date=2020-02-28

categories = ["Technical Stuff"]
tags = ["k8s"]
+++


Some time around the summer of 2019, I came across a blog post where I read about GitOps and I was flattened by the idea itself and ever since I wanted to 
give it a try on some serious projects but never had the chance to do it professionally. I had a chat about this with many of my colleagues at work and my 
team, they seemed ro like the idea but were a bit reluctant to employ this concept in their projects. In this blog post I will attempt to explain what 
GitOps is all about and will probably give a reference to one of my private projects which I made GitOps ready!

**GitOps** - As the name would say, use git for operations tasks. Simply put, you define your desired state of your infrastructure (let's limit ourselves to 
cloud native) and have this desired state pushed into your beloved git repos (BitBucket or GitLab or GitHub or whatever that supports Git version control). 
Then on the cloud side you will have your typical orchestrator (k8s or docker swarm) that will then wait for these changes that you make in the Git and once 
it sees the changes in your Git repo, it immediately pulls those changes and applies it on your production environment. It is as simple as that. This is 
exactly how k8s works. Isn't it. Just match the desired state on your production runtime.

Ok so now we know what GitOps is, let us see how it could be beneficial! We have been over the past couple of years talking about CI & CD pipelines, but I 
have seen from my experience that it is not CI & CD happening right after, but there is a huge gap between a CI and a CD. You know what I mean? You do CI more 
often than you do CD. So this would imply that you have to have perhaps additional tools to do CD work for your applications and more importantly the 
developer is no longer in charge of the CD process. It is left to some infrastructure operator (that classical ops guy or the notoriously famous site 
reliability guy for your cloud).

Here are some really <b>tangible benefits</b> that GitOps (<i>Pull-Based deployments</i>) brings to the projects:

1. **Credential Management** - How many times did you have to distribute your prod credentials into some other tool that is not your production 
   environment? With GitOps, it is not going to be the case anymore. Your production credentials stays where it belongs - In your prod environment. This 
   solves a very basic, but rather very important aspect for an organization - The Security! Yep! No more prod credentials on your developers machines 
   or on your developer tools!
   
2. **Revert with confidence in case of problems** - Since Git is versioning every bit of your repo, it makes reverting to an old desired state painless and 
   effortless. It is as easy as saying git revert to any desired version or state you want your production to be.
   
Now if you want to ship code more often to your production, this would mean that you should have a solid code base - One that is having a very good code 
coverage (unit testing, integration testing, e2e tests etc.,). When you employ GitOps, you commit yourself to deploy code more often and this would 
implicitly mean that you have to make your code base rigid with every subsequent release. I see the following implicit benefits:

1. You will improve your code quality (Given the fear factor that you might break something in production because of poor untested code when pushing more 
   often to prod)
   
2. You will have confidence in your overall application landscape as you exactly know what's in Git is what is in your production.

From my point of view GitOps is the way to go towards automising CD and keeping CD close to CI.

I tried this on [one of my project](https://github.com/joesan/plant-simulator) and its [deployment project](https://github.com/joesan/plant-simulator-deployment) 
where I ran a Minikube cluster with the Flux operator installed on my Minikube cluster. It damn works! GitOps is the way to go!