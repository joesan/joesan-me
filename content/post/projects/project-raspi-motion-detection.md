+++
title = "Raspberry Pi Motion & Face Detection"
description = "Detect motion and face using OpenCV & Raspberry Pi"
date = 2018-11-22
+++


A few weeks after my terrible MTB accident where I tore my ACL on my left knee, I was off from work for a few weeks, and I kind of got bored with just laying in
the bed and was pondering what I could be doing something meaningful. Then this idea stuck my mind, why not try doing a small CCTV camera for my home?

I started to do a bit of research on what hardware I need. Picked up a Raspberry Pi, PIR sensor, a camera and started to assemble the components. Doing a CCTV
camera using PIR is kind of old-fashioned, hence I decided to do it using OpenCV. I started to read some documentation about OpenCV and how I could do some
face detection. Thankfully, the algorithms already exist, I just needed to plug in some Python code, train the model with some live samples and bang I have it.

The goal was to run the face recognition on the Pi and stream that into a computer attached to the network. The Pi monitors and if it detects any movement, it 
captures the face and can send the image to any destination where currently it is configured to send to Dropbox.

This was the challenge as I wanted the whole thing to run as a Docker container. If you could not follow what I mean, why 
not [have a look at the project here](https://github.com/joesan/raspi-motion-detection)
