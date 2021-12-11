+++
title="CI for Kubernetes Resources"
description="Why not?"
date=2020-05-20

[taxonomies]
categories = ["Technical Stuff"]
tags = ["k8s"]
+++


Recently I have been exploring more around the Kubernetes tooling, especially the ones that can do some pre-validation on the schema and the state of my 
Kubernetes deployment resources or more precisely the YAML files.

I came across a few of them like conftest, kubeval etc and a wrapper around such set of tools like the kube-tools project which can be used as a GitHub 
Actions in your GitHub project.

So basically what I did was to try this out on one of my projects that I have on my GitHub, the plant-simulator-deployment which contains the Kuebrnetes 
resources to run the plant-simulator application in a Kubernetes cluster.

Since I'm using GitOps for managing my deployments to the production cluster, I wanted to be sure that the YAML files that I write are indeed valid both in 
terms of the schema (Kubeval) and in terms of the state (Conftest). What I want is some kind of CI, test, a failure mechanism that would prevent any 
invalid YAML files getting pushed into the master branch because as soon as anything lands on the master, GitOops kicks in and deploys it immediately. So I 
need to be sure to fail such deployments in case any of my YAML file in invalid. How do I do this?

So here is basically my approach:

1. Under your project repo in GitHub, under Settings / Branches, create a new "Branch protection rule". In our case, we want to protect the master branch as 
   this is the one GitOps looks for!

2. I create a status check to pass before the changes from a feature branch be merged into master (as seen in the screenshot below)
   
   ![k8s ci 1](/images/k8s-ci-1.jpg)

3. To test if this works, I intentionally introduced an error in one of my YAML files and you can see below that it was caught by GitHub Actions:

   ![k8s ci 2](/images/k8s-ci-2.jpg)
   
4. Now I issue a pull request from this branch into master, you can now see from the screenshot below that the YAML validation failure shows up. So the 
   guy who would do the merge / pull request would not merge it into the master! This is what we want!

   ![k8s ci 3](/images/k8s-ci-3.jpg)
