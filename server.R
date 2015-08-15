# Server section of a shiny application
# Plots a harmonogram, based on parameters as chosen by the user
# through ui.R, the user interface part of the shiny application
# 
# Author: evberghe
###############################################################################

library(shiny)

# Define server logic required to draw a harmonograph plot

shinyServer(function(input, output) {
	
	output$harmPlot <- renderPlot({

		f1 <- input$f1; f2 <- input$f2; f3 <- input$f3; f4 <- input$f4 
		d1 <- input$d1; d2 <- input$d2; d3 <- input$d3; d4 <- input$d4
		p1 <- pi*input$p1/16; p2 <- pi*input$p2/16; p3 <- pi*input$p3/4; p4 <- pi*input$p4/16
	
		xt <- function(t) exp(-d1*t)*sin(t*f1+p1)+exp(-d2*t)*sin(t*f2+p2)
		yt <- function(t) exp(-d3*t)*sin(t*f3+p3)+exp(-d4*t)*sin(t*f4+p4)

		stepsize <- 0.001
		length <- 500
		t <- seq(1, length, by=stepsize)
		dat <- data.frame(t=t, x=xt(t), y=yt(t))
		with(dat, 
				plot(x,y, type="l", 
						xlim =c(-2,2), ylim =c(-2,2), 
						xlab = "", ylab = "", 
						xaxt="n", yaxt="n"
		))

	}, height=600)
	
})
