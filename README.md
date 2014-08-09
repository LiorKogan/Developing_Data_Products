Function and derivative grapher
===

This is an R Shiny application that let you visualize a graph of a one-variable function, and its derivative line at a given point.

The UI input is composed of the following elemenents:
- The function: You should input a function such as x^2, sin(x), abs(x)+sin(x), etc.
- The display range: set the display range between -10 to 10
- The value of X for which to draw the derivative line

The UI output is composed of the following elemenents:
- The value of y and the value of the derivative at the given value of x
- The graph of the function and the derivative line

When the function entered is not valid, an error message will be displayed instead of these output elements.



This application is available at http://lior.shinyapps.io/Developing_Data_Products



Alternatively, you can download server.R and ui.R and execute 

library(shiny); runApp("my_app")

from R.



Enjoy!

L.K.
