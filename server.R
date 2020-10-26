# This file is part of Interactive_lorenz_curve
# 
# server.R is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# server.R is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with server.R  If not, see <http://www.gnu.org/licenses/>.
# 
# Diese Datei ist Teil von server.R
# 
# server.R ist Freie Software: Sie können es unter den Bedingungen
# der GNU General Public License, wie von der Free Software Foundation,
# Version 3 der Lizenz oder (nach Ihrer Wahl) jeder neueren
# veröffentlichten Version, weiter verteilen und/oder modifizieren.
# 
# server.R wird in der Hoffnung, dass es nützlich sein wird, aber
# OHNE JEDE GEWÄHRLEISTUNG, bereitgestellt; sogar ohne die implizite
# Gewährleistung der MARKTFÄHIGKEIT oder EIGNUNG FÜR EINEN BESTIMMTEN ZWECK.
# Siehe die GNU General Public License für weitere Details.
# 
# Sie sollten eine Kopie der GNU General Public License zusammen mit diesem
# Programm erhalten haben. Wenn nicht, siehe <https://www.gnu.org/licenses/>.
########################################################################################
# @autor Natasza Szczypien
######################################

library(ineq)
library(datasets)

function(input, output) {

  
  observe({
    inputData <- NULL
    
    if(input$radio.btn == "1"){
      inputData <- rnorm(10000,sd=10) +100
      output$lorenzPlot <- renderPlot(plot(Lc(inputData), col="blue",lwd=2))
      output$lorenzTable <- renderTable(data.frame( "L(p)"=Lc(inputData)$L, "p"=Lc(inputData)$p,check.names = FALSE))
      output$distributionPlot <- renderPlot(hist(inputData,breaks = 100,xlim = c(50,150)))
      output$result <- renderText(print(sd(inputData)))
      output$boxplot <- renderPlot(boxplot(inputData,horizontal = TRUE, ylim = c(80, 120), yaxs = "i"))
      return()
    }else if(input$radio.btn == "2"){
      inputData <-  runif(10000)
    }else if(input$radio.btn == "3"){
      inputData <-  c(rep(1,30),rep(2,30),rep(3,30))
    } else if(input$radio.btn == "4"){
      inputData <- rlnorm(1000)
    } else if(input$radio.btn == "5"){
      inputData <- as.numeric(unlist(strsplit(input$inputAttr1,",")))
    }
    output$lorenzPlot <- renderPlot(plot(Lc(inputData), col="blue",lwd=2))
    output$lorenzTable <- renderTable(data.frame( "L(p)"=Lc(inputData)$L, "p"=Lc(inputData)$p,check.names = FALSE))
    output$distributionPlot <- renderPlot(hist(inputData,breaks = 100))
    output$result <- renderText(print(sd(inputData)))
    output$boxplot <- renderPlot(boxplot(inputData,horizontal = TRUE))

  })
  

}

