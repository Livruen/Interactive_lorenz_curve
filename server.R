# @autor Natasza Szczypien

library(ineq)

function(input, output) {
  

  output$lorenzPlot <- renderPlot({
    inputData <- as.numeric(unlist(strsplit(input$inputAttr1,",")))
    plot(Lc(inputData), col="blue",lwd=2)
  })
  
  output$p <- renderText({
    inputData <- as.numeric(unlist(strsplit(input$inputAttr1,",")))
    Lc(inputData)$p
  })
  
  output$Lp <- renderText({
    inputData <- as.numeric(unlist(strsplit(input$inputAttr1,",")))
    Lc(inputData)$L
  })
  
  output$lorenzTable <- renderTable({
    inputData <- as.numeric(unlist(strsplit(input$inputAttr1,",")))
    data.frame( "L(p)"=Lc(inputData)$L, "p"=Lc(inputData)$p,check.names = FALSE)
  },digits = 6)
}

