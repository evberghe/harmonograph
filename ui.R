# User interface section of a shiny application
# Plots a harmonogram, based on parameters as chosen by the user
# through the interface defined here
# 
# Author: evberghe
###############################################################################


library(shiny)

# get user input to define what plot should be plotted

shinyUI(fluidPage(
				
	# Application title
	titlePanel("Harmonograph"),
				
	# Sidebar with slider input for the 4 parameters per oscillator
	sidebarLayout(
		sidebarPanel( # define inputs/paramters
			h3("Parameter definition"),
			br(),
			tabsetPanel(
				tabPanel("freq.",
					sliderInput("f1", "f1:", min = 0, max = 10,	value = 1, step=0.001),
					sliderInput("f2", "f2:", min = 0, max = 10,	value = 3, step=0.001),
					sliderInput("f3", "f3:", min = 0, max = 10,	value = 5, step=0.001),
					sliderInput("f4", "f4:", min = 0, max = 10,	value = 7, step=0.001)),
				tabPanel("damp.",
					sliderInput("d1", "d1:", min = 0, max = 0.1, value = 0.004),
					sliderInput("d2", "d2:", min = 0, max = 0.1, value = 0.0065),
					sliderInput("d3", "d3:", min = 0, max = 0.1, value = 0.008),
					sliderInput("d4", "d4:", min = 0, max = 0.1, value = 0.019)),
				tabPanel("phase (pi/16)",
					sliderInput("p1", "p1:", min = 0, max = 32,	value = 0),
					sliderInput("p2", "p2:", min = 0, max = 32,	value = 0),
					sliderInput("p3", "p3:", min = 0, max = 32,	value = 8),
					sliderInput("p4", "p4:", min = 0, max = 32,	value = 24))
			)
		),
						
	# Show a plot of the generated graph
		mainPanel( #define outputs to be sent to the main/right panel
			tabsetPanel(
				tabPanel("Plot", plotOutput("harmPlot")), 
				tabPanel("Settings", includeMarkdown("settings.md")),
				tabPanel("About", includeMarkdown("about.md"))
			)
		)
	)
))



