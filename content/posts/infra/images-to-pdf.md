+++
title="Convert Images to PDF on Ubuntu"
date=2021-07-14

[taxonomies]
categories = ["Technical Stuff"]
tags = ["linux", "images", "pdf"]
+++

I had a necessity to generate a PDF document out of a set of jpg images that I had on my local hard drive on my Ubuntu 20.04 
Laptop. I came across this simple step on how to do it. Here it is documented:

1. Install img2pdf 

```
sudo apt-get install -y img2pdf
```

2. Navigate to the folder that contains your images and run the following command

```
img2pdf *.jp* --output your-pdf.pdf
```

As usual, img2pdf --help is your friend for additional options on how to use this package.
