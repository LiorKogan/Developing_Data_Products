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
		f <- function(x) { eval(parse(text = input$f )) } # convert input from string to function

		z <- tryCatch(
			{
				if (is.numeric(f(0))) 
					0 
				else
					3                                  # when input$f is empty / contains just a function name (e.g. "sin")
			},
			warning = function(cond) { return(1) },    # warning produced if f(0) generates NaNs (e.g. sqrt(x-2))
			error   = function(cond) { return(2) } )   # error when input is not a valid function

		if (z>1) # function is not valid
		{
			output$text1 <- renderText("Error in function")
			output$text2 <- renderText("")
			return(0)
		}
			
		pts <- 5000; # number of points to render
		s   <- seq(input$rangeX[1], input$rangeX[2], length.out= pts)
		
		if (sum(is.nan(f(s))) == pts) # all points in range are NaN (note that we may subsample!)
		{
			output$text1 <- renderText(paste("f(x) is not defined between ", input$rangeX[1], " and ", input$rangeX[2]))
			output$text2 <- renderText("")
			return(0)
		}
		
		output$text1 <- renderText(paste("Plot of f(x) = ", input$f, " for x between ", input$rangeX[1], " and ", input$rangeX[2], ":"))

		g <- ggplot(data.frame(x=c(input$rangeX[1], input$rangeX[2])), aes(x)) + 
			ylab("f(x)") +
			stat_function(fun = f, n = pts, color = "blue", na.rm=T);

		x1<-0; y1<-0; slope<-0; intercept<-0
		
		z <- tryCatch(
			{
				x1        <- input$d
				y1        <- f(x1)              # the value of f(x) at x=x1
 				slope     <- grad(f, x1)		# the derivative of f at x1
				intercept <- y1 - slope*x1      # the intercept of the slope line
				0
			},
			warning = function(cond) { return(1) },
			error   = function(cond) { return(2) } ) 
			
		if (z==0)
		{
			output$text2 <- renderText(paste("The derivative of f(x) at (", x1, ",", signif(y1,3), ") is ", signif(slope, 3)))
			
			g <- g +
				geom_abline(intercept = intercept, slope = slope , color = "red", lwd = 1) +
				geom_point (x = x1, y = y1, color = "green")
		}
		else
			output$text2 <- renderText(paste("f(x) is not derivable at x = ", x1))

		g
	})
})
