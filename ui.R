library(shiny)

# shiny web UI object
shinyUI(pageWithSidebar(
			headerPanel("Function and derivative grapher"),
			
			# input panel
			sidebarPanel
			(
				h3('Function'),
				p('Enter a fuction to draw'),
				p('Sample inputs: ', strong('x^2, abs(x), sin(x)')),
				textInput(inputId = "f", label = strong("f(x)= "), value = "sin(x^2)"),
				
				h3('X range'),
				sliderInput(inputId = "rangeX", label = "X range", min = -10, max = 10, value = c(-5,5)),
				
				h3('Derivative'),
				sliderInput(inputId = "d", label = "Draw derivative at x=", min = -10, max = 10, step = 0.01, value = 0)
			),

			# output panel
			mainPanel
			(
				h3('Function and derivative graph'),
				textOutput("text1"),
				textOutput("text2"),
				plotOutput("plot1")
			)
       ))
