---
title       : Function and derivative grapher
subtitle    : Developing Data Products - Course Project
author      : Lior Kogan
job         : Coursera student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Function and Derivative Grapher

This web application allows you to

* Input a single-variable function (e.g. f(x)= x^2+sin(x)+3)

* View the graph of the function

* Select a value for x, and view the derivative line of f(x) for that point

<font size="4" color="red">Sounds interesting? read on...</font>

---

## Input Panel ##

<img src="assets/img/Input.png" align="right">

In this panel, the user can:


* Input the function he wants to draw.   
  This should be a single-variable (x) function.   
  The function is evaluated directly by R.
  
* Select the X-range of the graph to be drawn


* Select the value of x for which a derivative-line should be drawn

---

## Output Panel



Plot of f(x) = log(abs(x))+sin(4*x)-cos(x) for x between -5 and 5:   
The derivative of f(x) at (0.5, -0.661) is 0.815   
![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2.png) 

 * Note: this graph is rendered when compiling the presentation (see source)   
   <font color="red">This is not a screen capture!</font>

---

## About Screen

<img src="assets/img/About.png" align="right">
