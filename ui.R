library(shiny)

# shiny web UI object
shinyUI
(
	navbarPage
	(
		title      = "Function and derivative grapher",
		inverse    = T,                 # bar: white text on black background
		theme      = "bootstrap.css",   # in sub-folder "www"
		
		tabPanel
		(
			"Graph",			   
		
			# input panel
			sidebarPanel
			(
				width = 4,
				
				h3('Function'),
				p('Enter a fuction to draw'),
				p('Sample inputs: ', strong('x^2, abs(x), sin(x)')),
				textInput(inputId = "f", label = strong("f(x)= "), value = "sin(x^2)"),
				
				h3('X range'),
				sliderInput(inputId = "rangeX", label = "X range", min = -10, max = 10, value = c(-5,5)),
				
				h3('Derivative'),
				sliderInput(inputId = "d", label = "Draw derivative at x=", min = -10, max = 10, step = 0.01, value = 0.5)
			),

			# output panel
			mainPanel
			(
				width = 8,
				
				h3('Function and derivative graph'),
				textOutput("text1"),
				textOutput("text2"),
				plotOutput("plot1")
			)
		),
		
		tabPanel
		(
			"About",
			
			mainPanel
			(
				includeMarkdown("README.md")
			)
		)
	)
)
