+++
title="CCTV Monitor with Raspberry Pi & OpenCV"
description="Doing face detection with Raspberry Pi & OpenCV"
date=2018-11-13

categories = ["Technical Stuff"]
tags = ["ml"]
+++


I wanted to play around with OpenCV and thought it might be a good idea to try OpenCV with a real life use case. DIY'ing a home camera system that can do motion detection 
and click images when there is some movement in the frame sounded like a cool idea. So I researched on how I could get this set up done.

There were quite a few things that I should decide, like for example., where will I mount such a camera - indoor or outdoors? If outdoor, then what about 
protecting the Pi from the harsh weather conditions? How will I mount the Pi such that it has a power supply? Until I answer these two questions, all what 
I do with my Pi is just going to be installed indoor. So I decided that I will mount my Pi in one of my rooms for the time being and just get to learn the 
software that is needed to get the job done. So it is going to be Python and OpenCV. I'm now spending considerable amount of time to familiarise myself with 
OpenCV. I have done Analytics before, but never had the chance to play with image recognition and processing. Intention is not to dive deep into how the Haar
Cascade classifier in OpenCV works, but rather start with how to use it practically. Later on, I will probably get deeper insights into the algorithm 
itself! 

So for now, the goal is to get the setup up and running! [Here is what I have been up to so far](https://github.com/joesan/raspi-motion-detection)