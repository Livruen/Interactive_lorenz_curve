# @autor Natasza Szczypien

fluidPage(    
  
 
    column(12,
           fluidRow( style="background-color: #f5f5f5;
                            border: 1px solid #e3e3e3;
                            border-radius: 4px;
                            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
                            box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
                            margin-top:2%;
margin-bottom:2%;
                            padding: 1% 1%",
             textInput("inputAttr1", "Define a vector and separate the numbers with a comma ','."
                       ,value = 1,width = '100%'),
             helpText("L(p) - Proportion of the attribute e.g. income"),
             helpText("p - Proportion of the population")
        
           )
           
           ,
           sidebarPanel(
             tableOutput("lorenzTable")
             
           ),
           mainPanel(
             plotOutput("lorenzPlot") 
             
           )
           )
   
    
  
)

