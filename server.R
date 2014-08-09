# library used to build the interactive web application
library(shiny)

# library used to calculate the derivative at a given point
library(numDeriv)

# library used to generate the function graph
library(ggplot2)

# library used to render README.md
library(markdown)

# =========================================

shinyServer(function(input, output, session)
{
	output$plot1 <- renderPlot(
	{
		f<-0; x1<-0; y1<-0; slope<-0; intercept<-0
		
		z <- tryCatch(
			{
				f         <- function(x) { eval(parse(text = input$f )) } # convert input from string to function
				x1        <- input$d
				y1        <- f(x1)              # the value of f(x) at x=x1
				slope     <- grad(f, x1)		# the derivative of f at x1
				intercept <- y1 - slope*x1      # the intercept of the slope line
				0
			},
			error   = function(cond) { return(1) }, 
			warning = function(cond) { return(2) } 	)
	
		if (z>0) # function is not valid
		{
			output$text1 <- renderText("Error in function")
			output$text2 <- renderText("")
		}
		else    # function is valid
		{
			output$text1 <- renderText(paste("Plot of f(x) = ", input$f, " for x between ", input$rangeX[1],  "and ", input$rangeX[2], ":"))
			output$text2 <- renderText(paste("The derivative of f(x) at (", x1, ",", signif(y1,3), ") is ", signif(slope, 3)))
				
			# using basic plot:
			#	curve(f, input$rangeX[1], input$rangeX[2], n = 5000, col = "blue")
			#	abline(intercept, slope, col = "red", lwd = 2)
			#	points(x1, y1)
		
			# using ggplot:
			ggplot(data.frame(x=c(input$rangeX[1], input$rangeX[2])), aes(x)) + 
				ylab("f(x)") +
				stat_function(fun = f, n = 5000, color = "blue") + 
				geom_abline(intercept = intercept, slope = slope , color = "red", lwd = 1) +
				geom_point (x = x1, y = y1, color = "green")
		}
	})
})
