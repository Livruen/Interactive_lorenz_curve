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

fluidPage(    
  headerPanel("Interactive lorenz curve"),
           fluidRow(
             column(2,
                    style="background-color: #f5f5f5;
                            border: 1px solid #e3e3e3;
                            border-radius: 4px;
                            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
                            box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
                            margin-top:2%; 
                            margin-left:2%,
                            padding: 1% 1%",
                    radioButtons("radio.btn", 
                                 label = h3("Choose distribution"), 
                                 choices = list("Normal" = 1, 
                                                "Unif" = 2,
                                                "Perfekt unif" = 3, 
                                                "Left shift" = 4,
                                                "Custom" = 5),
                                 selected = 4)
             ),
             
             column(10,
                    style="background-color: #f5f5f5;
                            border: 1px solid #e3e3e3;
                            border-radius: 4px;
                            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
                            box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
                            margin-top:2%; 
                            margin-bottom:2%;
                            padding: 1% 1%",
                    textInput("inputAttr1", "Define a vector and separate the numbers with a comma ','."
                              ,value = 1
                              ,width = '100%')
             )
           ),

           sidebarPanel(
             helpText("L(p) - Proportion of the attribute e.g. income"),
             helpText("p - Proportion of the population"),
             div(style = 'overflow-y: scroll; overflow-x: scroll; height:595px;'
                 ,tags$hr()
                 ,tableOutput("lorenzTable")
                 ) 
             
           ),
           mainPanel(
             column(6, 
                    
                    
                    plotOutput("lorenzPlot") ,
                    plotOutput("boxplot")
                    ),
             column(6,
                    plotOutput("distributionPlot"))
           )
)

