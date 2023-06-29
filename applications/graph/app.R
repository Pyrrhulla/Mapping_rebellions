library(shinyjs)
library(shinydashboard)
library(dplyr)
library(tidyverse)
library(DT)
library(plotly)
library(ggplot2)
library(data.table)
library(htmltools)
library(shinyBS)
library(htmlwidgets)
library(shiny)
library(shinythemes)
library(DT)
library(data.table)
library(shinyWidgets)
library(readr)
library(shinycustomloader)


dataset <- read_delim("data.csv", 
                       ";", escape_double = FALSE, col_types = cols(Latitude = col_number(), 
                                                                    Longitude = col_number(), Year = col_number()), 
                       trim_ws = TRUE)

df_reasons_all <- read_delim("df_reasons.csv", 
                             delim = ";", escape_double = FALSE, col_types = cols(Year = col_number(), 
                                                                                  freq = col_number(), id = col_number()), 
                             trim_ws = TRUE)

df_party_all <- read_delim("df_party.csv", 
                           delim = ";", escape_double = FALSE, col_types = cols(Year = col_number(), 
                                                                                freq = col_number()), trim_ws = TRUE)

dataset_graph <- read_delim("data.csv", 
                            ";", escape_double = FALSE, col_types = cols(Latitude = col_number(), 
                                                                         Longitude = col_number(), Year = col_number()), 
                            trim_ws = TRUE)

####dataset setting####

df_reasons_all<-as.data.frame(df_reasons_all)
df_reasons_all<-as.data.table(df_reasons_all)

df_party_all<-as.data.frame(df_party_all)
df_party_all<-as.data.table(df_party_all)

dataset <- data.table(dataset)
Synopsis <-c(dataset$Synopsis)
Start <-c(dataset$`Date/ start`)
End <-(dataset$`Date/ end`)
Reasons <-(dataset$Reasons)
Revolt <- (dataset$Revolt)
Year <-(dataset$Year)
Country <- (dataset$Country)
Continent <- (dataset$Continent)
Monarchy <- (dataset$Monarchy)

DFgraph <- data.frame(Year, Revolt, Monarchy, Country,Continent)


reasons <- c("Anti-colonial", "Anti-seigneurial", "Economic reforms", "Fiscal", "Food", "Freedom", "Labour Conditions", "Natural resources", "Political", "Religion", "Rebel Maroon communities", "Resistance to foreign occupation", "Others", "Multiple")
actors <- c("Africans",  "Artisans",  "Clergymen", "Enslaved", "Indigenous", "Local elites", "Maroons", "Peasants", "Settlers/Colonists", "Soldiers", "Women", "Workers", "Others",  "Undifferentiated", 'Muncipal Council / Cabildo')
countries <-c("Angola", "Argentina", "Belgium",  "Bolivia", "Brazil",  "Cape Verde", "Chile", "Colombia",  "Costa Rica", "Cuba", "Dominican Rep.", "Ecuador", "Guatemala", "Guinea-Bissau", "Italy", "India", "Japan", "Mexico", "Morocco", "Netherlands", "Nicaragua", "Panama", "Paraguay", "Peru", "Philippines", "Portugal", "Puerto Rico", "Spain", "Sri Lanka", "S. Tome&Prin.", "Uruguay","US-NMexico", "US-Louisiana", "Venezuela")


####ui####
ui<-fluidPage(
  theme = shinytheme("cosmo"),
  tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
  fluidRow(
    tags$style(type="text/css",
               ".shiny-output-error { visibility: hidden; }",
               ".shiny-output-error:before { visibility: hidden; }"),
    useShinyjs(),
    sidebarPanel(width = 3,
                 h3("ANALYSING rebellions"),
                 h4("Build your own graphs, tables, and statistics"),
                 p("Download results"),
                 downloadButton('downloadPlot','Download Plot'),
                 actionButton("Download", "Download this table"), 
                 hr(),
                 p("Filters"),
                 fluidRow(
                   column(5,
                          radioButtons("dist", "Visualisation type:",
                                       c("Bubble" = "bubble_graph",
                                         "Bar" = "bar_graph",
                                         "Comparative Tables (reasons)" = "tables_reasons",
                                         "Comparative Tables (participants)" = "tables_party",
                                         "Pie" = "pie_graph"))),
                   column(5,
                          p(strong("Filters by Category")),
                          fluidRow(uiOutput("filters_xyz"))),
                   br()),
                 hr(),
                 fluidRow(
                   
                   bsCollapse(id = "collapse_location", open = "",
                              bsCollapsePanel("Choose location", style = "danger",
                                              actionButton("select_monarchy_plot","(Un)select All"),
                                              checkboxGroupInput(
                                                inputId = "choice_country",
                                                label="",
                                                choices = c(countries),
                                                selected = c(countries)))),
                   bsCollapse(id = "collapse_reasons", open = "",
                              bsCollapsePanel("Choose the Reason", style = "warning",
                                              actionButton("select_reasons_plot","(Un)select All"),
                                              checkboxGroupInput(inputId="reasons_plot",
                                                                 label="", 
                                                                 choices=c(reasons),
                                                                 selected = c(reasons)))),
                   bsCollapse(id = "collapse_actors", open = "",
                              bsCollapsePanel("Choose the Participants", style = "success",
                                              actionButton("select_actors_plot","(Un)select All"),
                                              checkboxGroupInput(inputId="actors_plot",
                                                                 label="", 
                                                                 choices=c(actors),
                                                                 selected=c(actors))))),
                 
                 br()
    ),
    # Show the selected plot
    mainPanel(
      chooseSliderSkin("Flat", color = "#cc3429"),
      fluidRow(sliderInput( width = '300%', 
                            inputId = "graph_slider", 
                            label=h4("Choose time period"),
                            min=min(dataset$Year), max=max(dataset$Year),
                            value=c(min(dataset$Year),max(dataset$Year)), sep = "")),
      column(12, uiOutput("ui_component", height=600))
      
    )
  ),
  fluidRow(tags$footer(HTML("
           <div class='footer-dark'>
            <div class='container'>
                <div class='row'>
                  <div class='col-6 col-md-4' >
                  <ul>
                        <li><a href='http://www.resistance.uevora.pt' class='image'><img src='img/resistancelogo_m.png', height = 30></a></li>
                        <li><a href='https://www.en.cidehus.uevora.pt' class='image'><img src='img/CIDEHUS.png' style = 'padding-top: 10px', height = 40></a></li>
                        <li><a href='https://www.iscte-iul.pt' class='image'><img src='img/ISCTE-IUL.png', style = 'padding-top: 10px', height = 40></a></li>
                        <li><a href='https://www.lhlt.mpg.de/en' class='image'><img src='img/mpifullwhite.png', height = 30></a></li>
                        <li>© 2019. This work is licensed under a CC BY 4.0 license</li>

                    </ul>
                    </div>
                        <div class='col-6 col-md-4'>
                        <ul>
                            <li><a href='http://www.resistance.uevora.pt'>Contacts</a></li>
                             <li><a href=''>Legal Information</a></li>
                              <li><a href=''>Licence</a></li>
                                </ul>
                                  </div>
                                  <div class='col-6 col-md-4'>
                                  <h3>Social Media</h3>
                                  <ul>
                                  <li><a href='http://www.resistance.uevora.pt/#'>Web-Site</a></li>
                                  <li><a href='https://twitter.com/R_esiste'>Twitter</a></li>
                                  <li><a href='https://www.youtube.com/c/ProjectoRESISTANCE'>YouTube</a></li>
                                  </ul>
                                  </div>
                                  </div>
                                  </div>
                                  </div>")))
  
)




server <- function(input, output, session) { 
  ###########selectors##########
  observe({
    if(input$select_actors_plot == 0) return(NULL) 
    else if (input$select_actors_plot%%2 == 0)
    {
      updateCheckboxGroupInput(session,"actors_plot","",choices=actors)
    }
    else
    {
      updateCheckboxGroupInput(session,"actors_plot","",choices=actors,selected=actors)
    }
  })
  
  observe({
    if(input$select_reasons_plot == 0) return(NULL) 
    else if (input$select_reasons_plot%%2 == 0)
    {
      updateCheckboxGroupInput(session,"reasons_plot","",choices=reasons)
    }
    else
    {
      updateCheckboxGroupInput(session,"reasons_plot", "",choices=reasons,selected=reasons)
    }
  })
  
  observe({
    if(input$select_monarchy_plot == 0) return(NULL) 
    else if (input$select_monarchy_plot%%2 == 0)
    {
      updateCheckboxGroupInput(session,"choice_country","",choices=countries)
    }
    else
    {
      updateCheckboxGroupInput(session,"choice_country", "",choices=countries,selected=countries)
    }
  })
  
  
  #######graphics#######
  dsub_graph <- reactive({
    country_search <- paste0(input$choice_country,collapse = "|")
    country_search <- gsub(",","|",country_search)
    reasons_search <- paste0(input$reasons_plot, collapse = "|")
    reasons_search <- gsub(",","|",reasons_search)
    actors_search <- paste0(input$actors_plot, collapse = "|")
    actors_search <- gsub(",","|",actors_search)
    dataset[dataset$Year >= input$graph_slider[1] & dataset$Year <= input$graph_slider[2] & grepl(country_search,Country) & grepl(reasons_search,Reasons) & grepl(actors_search,Participants )]
    
  })
  
  reasons_graph <- reactive({
    country_search <- paste0(input$choice_country,collapse = "|")
    country_search <- gsub(",","|",country_search)
    reasons_search <- paste0(input$reasons_plot, collapse = "|")
    reasons_search <- gsub(",","|",reasons_search)
    actors_search <- paste0(input$actors_plot, collapse = "|")
    actors_search <- gsub(",","|",actors_search)
    df_reasons_all[df_reasons_all$Year >= input$graph_slider[1] & df_reasons_all$Year <= input$graph_slider[2] & grepl(reasons_search,Reasons)]
  })
  
  party_graph <- reactive({
    country_search <- paste0(input$choice_country,collapse = "|")
    country_search <- gsub(",","|",country_search)
    reasons_search <- paste0(input$reasons_plot, collapse = "|")
    reasons_search <- gsub(",","|",reasons_search)
    actors_search <- paste0(input$actors_plot, collapse = "|")
    actors_search <- gsub(",","|",actors_search)
    df_party_all[df_party_all$Year >= input$graph_slider[1] & df_party_all$Year <= input$graph_slider[2] & grepl(actors_search,Participants )]
  })
  
  
  bubble<- reactive({
    bubble<-ggplot(dsub_graph(),aes_string(x=input$X_axis_Category_bubble,y=input$Y_axis_Category_bubble,size=0.1,colour=input$Z_axis_Category_bubble)) + geom_point()+geom_vline(xintercept=x_means_bubble())+geom_hline(yintercept=y_means_bubble())+theme_bw()
    bubble
  })
  
  bar<- reactive({
    bar <- ggplot(dsub_graph(), aes_string(x = input$X_axis_Category_bar_graph)) +
      geom_bar(aes_string(fill= input$Y_axis_Category_bar_graph)) +
      theme(axis.text.x=element_blank(), axis.title.x=element_blank(), axis.text.y=element_blank(), axis.title.y=element_blank()) +
      theme_bw()
    bar
  })
  
  pie<- reactive({
    pie<-ggplot(dsub_graph(), aes(x = factor(1), fill = factor(dsub_graph()[[input$Z_axis_Category_pie_graph]]))) + geom_bar(width = 1) + coord_polar(theta = "y") + theme_bw() + 
      guides(fill=guide_legend(title="Category"))
    pie
  })
  
  
  
  tables_reasons<- reactive({
    tables_reasons <- ggplot(reasons_graph(), aes_string(x = input$X_axis_Category_tables_reasons, y = input$Y_axis_Category_tables_reasons)) +
      geom_bar(aes_string(fill= input$Y_axis_Category_tables_reasons), position = position_stack(reverse = TRUE), stat='identity') +
      facet_wrap(input$Z_axis_Category_tables_reasons) +
      theme(axis.text.x=element_blank(), axis.title.x=element_blank(), axis.text.y=element_blank(), axis.title.y=element_blank()) +
      coord_flip() + 
      theme_bw()
    tables_reasons
  })
  
  tables_party<- reactive({
    tables_party <- ggplot(party_graph(), aes_string(x = input$X_axis_Category_tables_party, y = input$Y_axis_Category_tables_party)) +
      geom_bar(aes_string(fill= input$Y_axis_Category_tables_party), position = position_stack(reverse = TRUE), stat='identity') +
      facet_wrap(input$Z_axis_Category_tables_party) +
      theme(axis.text.x=element_blank(), axis.title.x=element_blank(), axis.text.y=element_blank(), axis.title.y=element_blank()) +
      coord_flip() + 
      theme_bw()
    tables_party
  })
  
  #####means bubble######
  observe({
    if (input$dist == "bubble_graph") {
      output$filters_xyz<-renderUI({
        fluidPage(
          list(fluidRow(pickerInput("Y_axis_Category_bubble",label="Y axis Category",choices=as.list(colnames(DFgraph)), selected="Country")           
          ),
          fluidRow(pickerInput("X_axis_Category_bubble",label="X axis Category",choices=as.list(colnames(DFgraph)), selected="Year")        
          ),
          fluidRow(pickerInput("Z_axis_Category_bubble",label="Z axis Category",choices=as.list(colnames(DFgraph)), selected="Monarchy")
          )))
      })
    }else(return)
  }) 
  
  
  x_means_bubble<-reactive({
    mean(dataset_graph[,input$X_axis_Category_bubble])
  })
  y_means_bubble<-reactive({
    mean(dataset_graph[,input$Y_axis_Category_bubble])
    
  })
  x_var_bubble<-reactive({
    as.character(input$X_axis_Category_bubble)
  })
  
  y_var_bubble<-reactive({
    as.character(input$Y_axis_Category_bubble)
  })
  
  
  #########graph functions#######
  observe({
    if (input$dist == "bubble_graph") {
      output$ui_component <- renderUI({
        list(
          fluidPage(
            fluidRow(
              plotOutput('plotui', brush=brushOpts("plot_brush",resetOnNew=T)),
              
              column(12,DT::dataTableOutput("plot_brushed_points"))
            )))
      })
      output$plotui <- renderPlot({bubble()})
      res <- reactive({
        brushedPoints(dsub_graph(), input$plot_brush)
      })
      output$plot_brushed_points<-DT::renderDataTable({
        res<-brushedPoints(res(),input$plot_brush)
        subset_res<-subset(res,select=c(Year, Monarchy, Country, Revolt, Reasons, Leader, Participants),
                           rownames=TRUE, filter="top", extensions = "Buttons", 
                           options = list(
                             autoWidth = TRUE,
                             scroller = TRUE,
                             dom = 'Bfrtip'))
      }, filter = 'top')
    }else if(input$dist == "bar_graph") {
      output$ui_component <- renderUI({
        list(
          fluidPage(
            fluidRow(
              plotOutput('plotui', brush=brushOpts("plot_brush",resetOnNew=T)),
              
              column(12,DT::dataTableOutput("plot_brushed_points"))
            )))
      })
      output$plotui <- renderPlot({bar()})
      res <- reactive({
        brushedPoints(dsub_graph(), input$plot_brush)
      })
      output$plot_brushed_points<-DT::renderDataTable({
        res<-brushedPoints(res(),input$plot_brush)
        subset_res<-subset(res,select=c(Year, Monarchy, Country, Revolt, Reasons, Leader, Participants),
                           rownames=TRUE, filter="top", extensions = "Buttons", 
                           options = list(
                             autoWidth = TRUE,
                             scroller = TRUE,
                             dom = 'Bfrtip'))
      }, filter = 'top')
      
    }else if (input$dist == "pie_graph") {
      output$ui_component <- renderUI({
        list(
          fluidPage(
            fluidRow(
              column(12, plotOutput('plotui', brush=brushOpts("plot_brush",resetOnNew=T)))
            )))
      })
      output$plotui <- renderPlot({pie()})
      
    } else if (input$dist == 'tables_reasons') {
      output$ui_component <- renderUI({
        list(
          fluidPage(
            fluidRow(
              column(12, plotOutput('plotui', height = 1000, width = 800)),
              
              column(12,DT::dataTableOutput("plot_brushed_points"))
            )))
      })
      output$plotui <- renderPlot({tables_reasons()})
      res <- reactive({
        brushedPoints(dsub_graph(), input$plot_brush)
      })
      output$plot_brushed_points<-DT::renderDataTable({
        res<-brushedPoints(res(),input$plot_brush)
        subset_res<-subset(res,select=c(Year, Monarchy, Country, Revolt, Reasons, Leader, Participants),
                           rownames=TRUE, filter="top", extensions = "Buttons", 
                           options = list(
                             autoWidth = TRUE,
                             scroller = TRUE,
                             dom = 'Bfrtip'))
      }, filter = 'top')
      
    }else if (input$dist == 'tables_party') {
      output$ui_component <- renderUI({
        list(
          fluidPage(
            fluidRow(
              column(12, plotOutput('plotui', brush=brushOpts("plot_brush",resetOnNew=T), height = 1000, width = 800)),
              
              column(12,DT::dataTableOutput("plot_brushed_points"))
            )))
      })
      output$plotui <- renderPlot({tables_party()})
      res <- reactive({
        brushedPoints(dsub_graph(), input$plot_brush)
      })
      output$plot_brushed_points<-DT::renderDataTable({
        res<-brushedPoints(res(),input$plot_brush)
        subset_res<-subset(res,select=c(Year, Monarchy, Country, Revolt, Reasons, Leader, Participants),
                           rownames=TRUE, filter="top", extensions = "Buttons", 
                           options = list(
                             autoWidth = TRUE,
                             scroller = TRUE,
                             dom = 'Bfrtip'))
      }, filter = 'top')
    }
    
  })
  
  
  
  myModal <- function() {
    div(id = "Download",
        modalDialog(downloadButton("download_csv","Download as csv"),
                    downloadButton("download_xls","Download as Excel table"),
                    br(),
                    br(),
                    easyClose = TRUE, title = "Download Table")
    )
  }
  
  observeEvent(input$Download, {
    showModal(myModal())
  })
  output$download_csv <- downloadHandler(
    filename = function() {
      "brushed_data.csv"
    },
    content = function(filename) {
      write_csv2(res, filename, append = F)    }
  )
  
  
  output$download_xls <- downloadHandler(
    filename = function() {
      "brushed_data.xls"
    },
    content = function(filename) {
      if (input$dist == "bubble_graph") {
        write_excel_csv2(res, filename, append = F)
      }
      else{return}
    }
  )
  
  
  output$downloadPlot <- downloadHandler(
    filename = function(){
      paste('Graph', '.png', sep = '')
    },
    content = function(file){
      if (input$dist == "bubble_graph") {
        ggsave(file, plot = bubble(), width = 10, height = 8, dpi = 150, device = 'png')
      }else if (input$dist == "bar_graph"){
        ggsave(file, plot = bar(), width = 10, height = 8, dpi = 150, device = 'png')
      }
      else if(input$dist == "pie_graph"){
        ggsave(file, plot = pie(), width = 10, height = 8, dpi = 150, device = 'png')
      }
      else if(input$dist == 'tables_reasons'){
        ggsave(file, plot = tables_reasons()(), width = 10, height = 8, dpi = 150, device = 'png')
      }
      else{return}
    }
  )
  
  
  
  
  #####means tables_reasons######
  observe({
    if (input$dist == "tables_reasons") {
      output$filters_xyz<-renderUI({
        fluidPage(
          list(fluidRow(pickerInput("Y_axis_Category_tables_reasons",label="Y axis Category",choices=c("Country", "Reasons"))           
          ),
          fluidRow(pickerInput("X_axis_Category_tables_reasons",label="X axis Category",choices=c("Reasons", "Country"))        
          ),
          fluidRow(pickerInput("Z_axis_Category_tables_reasons",label="Z axis Category",choices=c("Country", "Reasons")) 
          )))
      })
    }else(return)
  }) 
  
  x_means_tables_reasons<-reactive({
    mean(dataset_graph[,input$X_axis_Category_tables_reasons])
  })
  y_means_tables_reasons<-reactive({
    mean(dataset_graph[,input$Y_axis_Category_tables_reasons])
    
  })
  x_var_reasons<-reactive({
    as.character(input$X_axis_Category_tables_reasons)
  })
  
  y_var_reasons<-reactive({
    as.character(input$Y_axis_Category_tables_reasons)
  })
  
  
  #####means bar_graph######
  
  observe({
    if (input$dist == "bar_graph") {
      output$filters_xyz<-renderUI({
        fluidPage(
          list(
            fluidRow(pickerInput("Y_axis_Category_bar_graph",label="Y axis Category",choices=c("Country", "Monarchy", "Continent"))),
            fluidRow(pickerInput("X_axis_Category_bar_graph",label="X axis Category",choices=c("Monarchy", "Continent", "Country"), selected = ("Country"))        
            )))
      })
    }else(return)
  }) 
  
  x_means_tables_reasons<-reactive({
    mean(dataset_graph[,input$X_axis_Category_bar_graph])
  })
  y_means_tables_reasons<-reactive({
    mean(dataset_graph[,input$Y_axis_Category_bar_graph])
    
  })
  x_var_bar_graph<-reactive({
    as.character(input$X_axis_Category_bar_graph)
  })
  
  y_var_bar_graph<-reactive({
    as.character(input$Y_axis_Category_bar_graph)
  })
  
  
  
  #####means pie######
  observe({
    if (input$dist == "pie_graph") {
      output$filters_xyz<-renderUI({
        fluidPage(list(
          fluidRow(pickerInput("Z_axis_Category_pie_graph",label="Z axis Category",choices=c("Monarchy", "Continent", "Country"))
          )))
      })
    }else(return)
  }) 
  
  x_means_pie<-reactive({
    mean(dataset_graph[,input$X_axis_Category_pie_graph])
  })
  x_var_pie<-reactive({
    as.character(input$X_axis_Category_pie_graph)
  })
  
  
  #####means tables_reasons######
  observe({
    if (input$dist == "tables_party") {
      output$filters_xyz<-renderUI({
        fluidPage(
          list(fluidRow(pickerInput("Y_axis_Category_tables_party",label="Y axis Category",choices=c("Participants", "Country"))           
          ),
          fluidRow(pickerInput("X_axis_Category_tables_party",label="X axis Category",choices=c("Country", "Participants"))        
          ),
          fluidRow(pickerInput("Z_axis_Category_tables_party",label="Z axis Category",choices=c("Participants", "Country")) 
          )))
      })
    }else(return)
  }) 
  
  x_means_tables_reasons<-reactive({
    mean(dataset_party[,input$X_axis_Category_tables_party])
  })
  y_means_tables_reasons<-reactive({
    mean(dataset_graph[,input$Y_axis_Category_tables_party])
    
  })
  x_var_party<-reactive({
    as.character(input$X_axis_Category_tables_party)
  })
  
  y_var_party<-reactive({
    as.character(input$Y_axis_Category_tables_party)
  })
  #######end xyz########
  
  
  
} 
shinyApp(ui, server)