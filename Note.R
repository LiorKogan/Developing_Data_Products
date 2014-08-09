install.packages("shiny")
library(shiny)

# tutorial: http://rstudio.github.io/shiny/tutorial

# ui.R     - controls how it looks
# server.R - controls what it does



eval(parse(text="2+2"))
eval(parse(text="x=3;y=x^2;y"))


# derivative
# ======================
D(expression(x^2), "x")
# expression as string:
D(parse(text="x^2"), "x")
# doesn't work for:
D(expression(abs(x)), "x")

# derivative at a point
# ======================
install.packages("numDeriv")
library(numDeriv)
grad(function(x) { x^2 }, 4)
# expression as string:
grad(function(x) { eval(parse(text="abs(x)")) }, 0)


# plotting a function
# ======================
curve(abs(x), -5, 5)

# expression as string:
y <- function(x) {eval(parse(text="abs(x)"))}
curve(y, -5, 5, n= 3000)

# plotting a function using ggplot2
# ======================
library(ggplot2)

y <- function(x) {eval(parse(text="abs(x)"))}
ggplot(data.frame(x=c(-5, 5)), aes(x)) + stat_function(fun = y, color = "blue", lwd = 2) + 
       geom_abline(intercept = 2, slope = 2 , color = "red") +
	   geom_point (x = 2, y = 2, color = "green")


# plotting a function, return error code on error
# ======================
tryCatch( { curve(y, -5, 5, n= 3000); 1 }, error = function(cond) {return(100)}, warning = function(cond) {return(101)})


# ======================
# running app
library(shiny)
runApp()
# or debug:
runApp(display.mode = 'showcase')


# deploying app to https://www.shinyapps.io
library(shinyapps)
deployApp()


