+++
title="Bayes to rule them all"
description="Making sense of conditional probabilities"
date=2021-03-15
draft=true

categories = ["Technical Stuff", "Math"]
tags = ["blog"]
+++


## Definition
There are already tons of information around the internet and tons of other statistics and probability books that do a good length of explaining the Bayes rule or
the Bayes theorem. It was invented by the 18th century British statistician [Thomas Bayes](https://en.wikipedia.org/wiki/Thomas_Bayes), used to calculate or determine
conditional probabilities. Conditional probability is the probability of an outcome based on the previous outcome.

Bayes’ theorem is about determining the validity of a hypothesis based on some observation, where observation is the probability that already happened. In a
mathematical notation, given by the formula:

$ P(H|E) = \frac{P(H) * P(E|H)}{P(E)} $

Where,

P(H|E) -> Probability of our hypothesis given the observation or the evidence E

P(H)   -> Probability of our hypothesis

P(E)   -> Probability of our observation or evidence that already happened

P(E|H) -> Probability of the observation or evidence given the hypothesis B

## Articulation
The Bayes theorem can be articulated as follows:

```
The likelihood of the hypothesis (H) in light of new evidence (E) equals the likelihood of the new evidence being true assuming the hypothesis is also true 
times the likelihood of the hypothesis before the new evidence was observed, all over (divided by) the likelihood of the new evidence
```

A few terms:

Prior Probability - "Prior" means "before", so "prior probability" just means "probability before we see any new evidence". This is where we start!




