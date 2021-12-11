+++
title="Convert Images to PDF on Ubuntu"
date=2021-07-14
path = "images-to-pdf.md"

[taxonomies]
categories = ["linux"]
tags = ["ubuntu", "images", "pdf"]

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

As usual, img2pdf --help is your friend for additional options on how to use this package. Just for a reference, here is the 
[link to the GitHub](https://github.com/josch/img2pdf) project.

If img2pdf results in a huge file (which it does) size as there is no compression happening. I'm yet to figure out how to 
get the resulting pdf smaller. Here is an alternative that you could use, but it comes with a graphical user interface!

```
sudo apt-get install gscan2pdf
```