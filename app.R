library(shinyjs)
library(shinydashboard)
library(dplyr)
library(tidyverse)
library(DT)
library(data.table)
library(htmltools)
library(shinyBS)
library(htmlwidgets)
library(shiny)
library(shinythemes)
library(leaflet.extras)
library(leaflet)
library(shinyWidgets)
library(shinycustomloader)
library(shinyalert)

Data <- read_delim("data_ency_new_new.csv", delim = ";", 
                   escape_double = FALSE, col_types = cols(Year = col_character()), 
                   trim_ws = TRUE)

Data<-head(Data,263)
Data$Year<- gsub('.{6}$', '', Data$Year)
Data$id <- seq.int(nrow(Data))
Data$Year<-as.numeric(Data$Year)
Data$Leaders<-Data$Leader

Data$Latitude<-as.numeric(Data$Latitude)
Data$Longitude<-as.numeric(Data$Longitude)
Data$Longitude<- gsub('.{3}$', '', Data$Longitude)
Data$Latitude<- gsub('.{3}$', '', Data$Latitude)

Data$Latitude<-as.numeric(Data$Latitude)
Data$Longitude<-as.numeric(Data$Longitude)



IconSet <- awesomeIconList(
  "Spanish" = makeAwesomeIcon(icon= 'fire', markerColor = 'darkred', iconColor = 'white', library = "glyphicon"),
  "Portuguese" = makeAwesomeIcon(icon= 'fire', markerColor = 'darkgreen', iconColor = 'white', library = "glyphicon")
)


dataset1 <- data.table(Data)
loc <- unique(dataset1$Revolt)
Location <- c(dataset1$Revolt)
Latitude <- c(dataset1$Latitude)
Longitude <- c(dataset1$Longitude)
Synopsis <-c(dataset1$Synopsis)
Start <-c(dataset1$`Date/ start`)
End <-(dataset1$`Date/ end`)
Reasons <-(dataset1$Reasons)
Revolt <- (dataset1$Revolt)
Year <-(dataset1$Year)
Country <- (dataset1$Country)
Continent <- (dataset1$Continent)
Monarchy <- (dataset1$Monarchy)
DF <- data.frame(Location,Latitude,Longitude,Synopsis,Start, End, Monarchy,Reasons)
revolts <-dataset1$Revolt
books <-dataset1$References
DFgraph <- data.frame(Year, Revolt, Monarchy, Country,Continent)


revolts <-dataset1$Revolt
books <-dataset1$References

reasons <- c("Anti-colonial", "Anti-seigneurial", "Economic reforms", "Fiscal", "Food", "Freedom", "Labour Conditions", "Natural resources", "Political", "Religion", "Rebel Maroon communities", "Resistance to foreign occupation", "Others", "Multiple")



actors <- c("Africans",  "Artisans",  "Clergymen", "Enslaved", "Indigenous", "Local elites", "Maroons", "Peasants", "Settlers/Colonists", "Soldiers", "Women", "Workers", "Others",  "Undifferentiated")

markerColorPalette <- c("red", "green", "lightred", "orange", "beige", "darkgreen", "lightgreen", "blue", "darkblue", "lightblue", "purple", "darkpurple", "pink", "cadetblue", "white", "gray", "lightgray", "black")

pal <- colorFactor(c("navy", "red"), domain = c("Spanish", "Portuguese"))

csscode = HTML("
.leaflet-popup-content {
  width: 400px !important;
}")

#ui#####
ui<-fluidPage(
  theme = shinytheme("cosmo"),
  tags$head(tags$style(csscode)),
  
  tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
  
  chooseSliderSkin("Flat", color = "#cc3429"),
  sidebarLayout(position = "left", fluid = T,
                sidebarPanel(width = 3, 
                             style = "overflow-y:scroll; height: 800px; position:relative;",
                             h3("MAPPING REBELLIONS"),
                             h4('Filters', actionLink(inputId= 'filters', label = icon("question-sign", lib = "glyphicon"))), 
                             bsTooltip("filters", 
                                       "Use filters to choose and combine several criteria. For example, you can select Spanish Monarchy, Political Reasons and Local Elites and see on the map what events correspond to these choices. You can also narrow or extend the time period on the slider above the map.",  trigger = "hover", options = list(container = "body")),
                              
                             bsCollapse(id = "collapseExample1", open = "Choose the Monarchy",
                                        bsCollapsePanel("Choose location", style = "danger",
                                                        
                                                        checkboxGroupInput(
                                                          inputId = "choice",
                                                          
                                                          label=h4("Monarchy"),
                                                          choices = c(unique(as.character(dataset1$Monarchy))),
                                                          selected = c('Portuguese', 'Spanish')
                                                          
                                                          
                                                        ),
                                                        checkboxGroupInput(
                                                          inputId = "choice_country",
                                                          
                                                          label=h4("Country"),
                                                          choices = c("Angola", "Argentina", "Belgium",  "Bolivia", "Brazil",  "Cape Verde", "Chile", "Colombia",  "Costa Rica", "Cuba", "Dominican Rep.", "Ecuador", "Guatemala", "Guinea-Bissau", "Italy", "India", "Japan", "Mexico", "Morocco", "Netherlands", "Nicaragua", "Panama", "Paraguay", "Peru", "Philippines", "Portugal", "Puerto Rico", "Spain", "Sri Lanka", "S. Tome&Prin.", "Uruguay","US-NMexico", "US-Louisiana", "Venezuela"),
                                                          selected = c("Angola", "Argentina", "Belgium",  "Bolivia", "Brazil",  "Cape Verde", "Chile", "Colombia",  "Costa Rica", "Cuba", "Dominican Rep.", "Ecuador", "Guatemala", "Guinea-Bissau", "Italy", "India", "Japan", "Mexico", "Morocco", "Netherlands", "Nicaragua", "Panama", "Paraguay", "Peru", "Philippines", "Portugal", "Puerto Rico", "Spain", "Sri Lanka", "S. Tome&Prin.", "Uruguay","US-NMexico", "US-Louisiana", "Venezuela" 
                                                                    )
                                                          
                                                        ))),
                             bsCollapse(id = "collapseExample2", open = "",
                                        bsCollapsePanel("Choose the Reason", style = "warning",
                                                        actionButton("select_reasons","(Un)select All"),
                                                        checkboxGroupInput(inputId="reasons",label="", 
                                                                            choices=c(reasons),
                                                                            selected = c(reasons)))),
                             
                             bsCollapse(id = "collapseExample3", open = "",
                                        bsCollapsePanel("Choose the Participants", style = "success",
                                                        actionButton("select_actors","(Un)select All"),
                                                        checkboxGroupInput(inputId="actors",label="", 
                                                                            choices=c(actors),
                                                                            selected=c(actors))))),                                  
                mainPanel(tags$style(type = "text/css", "#map {height: calc(90vh - 80px) !important;}"),
                          fluidRow(
                            sliderInput(
                              width = '300%',
                              inputId = "range",
                              label= h4("Choose time period"),
                              min=min(dataset1$Year), max=max(dataset1$Year),
                              value=c(min(dataset1$Year),max(dataset1$Year)), sep = ""
                              
                            )                 ),
                          withLoader(leafletOutput("map"), type = 'html', loader = 'loader4'),
                          p(),
                          useShinyalert()
                          
                )
  ),
  fluidRow(tags$footer(HTML("
                    <!-- Footer -->
<div class='footer-dark'>
            <div class='container'>
                <div class='row'>
                  <div class='col-6 col-md-4' >
                        <a href='http://www.resistance.uevora.pt' class='image'><img src='img/resistancelogo_m.png', style='margin-top: -17px; margin-bottom: -13px; padding-right:5px; padding-top:5px; padding-bottom: -30px', height = 40></a>
                        
                    </div>
                        <div class='col-6 col-md-4'>
                        <ul>
                            <li><a href='http://www.resistance.uevora.pt'>Contacts</a></li>
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
                                  
                                  
                                  
                                  <div class='col-6 col-md-4'>
                                  
                                  <a href='https://www.lhlt.mpg.de/en' class='image' style='color = white;'><img src='img/mpifullwhite.png', style='color = white; margin-top: -15px; margin-bottom: -5px; padding-right:-5px; padding-top:5px; padding-bottom: -40px', height = 40></a>

                                  </div>
                                  </div>
                                  </div>
                                  </div>


                           </footer>
                           <!-- Footer -->"))))

##ui ends####

server <- function(input, output, session) { 
  
  
  
  ##############selectors##########
  
  observe({
    if(input$select_actors == 0) return(NULL) 
    else if (input$select_actors%%2 == 0)
    {
      updatecheckboxGroupInput(session,"actors","",choices=actors)
    }
    else
    {
      updatecheckboxGroupInput(session,"actors","",choices=actors,selected=actors)
    }
  })
  
  observe({
    if(input$select_reasons == 0) return(NULL) 
    else if (input$select_reasons%%2 == 0)
    {
      updatecheckboxGroupInput(session,"reasons","",choices=reasons)
    }
    else
    {
      updatecheckboxGroupInput(session,"reasons", "",choices=reasons,selected=reasons)
    }
  })
  
  
  
  
  #########map########
  
  dsub <- reactive({
    MatSearch <- paste0(c('xxx',input$reasons),collapse = "|")
    MatSearch <- gsub(",","|",MatSearch)
    ActSearch <- paste0(c('xxx',input$actors),collapse = "|")
    ActSearch <- gsub(",","|",ActSearch)
    CountrySearch <- paste0(c('xxx',input$choice_country),collapse = "|")
    CountrySearch <- gsub(",","|",CountrySearch)
    dataset1[dataset1$Year >= input$range[1] & dataset1$Year <= input$range[2] & grepl(MatSearch,Reasons) & grepl(ActSearch,Participants) & grepl(CountrySearch,Country) & Monarchy %in% input$choice]
    
  })
  
  
  
  
  
  
  observe({
    if(nrow(dsub())==0) {
      leafletProxy("map") %>%
        clearMarkers()
    } else {
      leafletProxy("map", data=dsub()) %>% 
        
        clearMarkers()%>% 
        addAwesomeMarkers(
          data = dsub(), layerId = dsub()$id, lng = ~Longitude, lat = ~Latitude, label = dsub()$Revolt, 
          icon = ~IconSet[Monarchy],
          group = "rebellions",
          popup =
            paste0('<font face="helvetica"',
                   '<font size="3">', '<strong>', dsub()$Revolt, '</strong>', '</font>',
                   '<br/>','<strong>', 'Duration: ', '</strong>', dsub()$Duration, 

                   '<br/>','<strong>', 'Reason: ','</strong>', dsub()$Reasons,
                   '<br/>','<strong>', 'Participants: ','</strong>', dsub()$Participants,
                   
                   '<br/>', dsub()$Synopsis,' ',
                   '<br/>',                           
                   '<br/>',
                   '</font>',' ',
                   actionButton("showmodal", "Show more details", 
                                onclick = 'Shiny.onInputChange("button_click1",  Math.random())'))
          
        ) %>%
        addSearchFeatures(
          targetGroups = 'rebellions', # group should match addMarkers() group
          options = searchFeaturesOptions(
            zoom=12, openPopup = TRUE, firstTipSubmit = TRUE,
            autoCollapse = TRUE, hideMarkerOnCollapse = TRUE
          ))
      
    }
  })
  
  
  
  observe({
      output$map <- renderLeaflet({
        
        req(icons())
        leaflet(dsub()) %>% 
          addMapPane("left", zIndex = 0) %>%
          addMapPane("right", zIndex = 0) %>%
          addProviderTiles(
            group = 'Light Theme',
            providers$CartoDB.Positron) %>%
          addProviderTiles(
            group = 'Terrain',
            providers$Esri.WorldImagery) %>%
          addLayersControl(
            position = 'topright',
            baseGroups = c(
              'Light Theme',
              'Terrain'
            )) %>%
          
          fitBounds(~min(Longitude), ~min(Latitude), ~max(Longitude), ~max(Latitude)) %>%
          setView(0, 0, zoom = 2)%>%
          addAwesomeMarkers(
            layerId = dsub()$id, lng = ~Longitude, lat = ~Latitude, label = dsub()$Revolt, group = "rebellions",
            icon = ~IconSet[Monarchy],
            popup = paste0('<font face="helvetica"',
                           '<font size="3">', '<strong>', dsub()$Revolt, '</strong>', '</font>',
                           '<br/>','<strong>', 'Duration: ', '</strong>', dsub()$Duration, 
        
                           '<br/>','<strong>', 'Reason: ','</strong>', dsub()$Reasons,
                           '<br/>','<strong>', 'Participants: ','</strong>', dsub()$Participants,
                           
                           '<br/>', dsub()$Synopsis,' ',
                           '<br/>',
                           '<br/>',
                           '</font>',' ',
                           actionButton("showmodal", "Show more details", 
                                        onclick = 'Shiny.onInputChange("button_click",  Math.random())'))
          ) 
        
        
      })
  })
  
  
  

  
  
  observeEvent( input$button_click1,{
    print("observed button_click and get id from map_marker_click$id")
    id <- input$map_marker_click$id
    shinyalert(
      html = TRUE,
      size = "l",
      closeOnEsc = TRUE,
      closeOnClickOutside = T,
      title = paste0(dataset1$Revolt[id]),
      text = tagList(      fluidPage(style = "overflow-y:scroll; max-height: 500px",
        fluidRow(style='margin: 10px;',
                 box(                  
                   title = htmltools::span(
                     column(8, class="title-box"),
                     leaflet() %>%
                       setView(lng=dataset1$Longitude[id], lat=dataset1$Latitude[id], zoom = 5)%>%
                       addProviderTiles("CartoDB.Positron", group = "Light Theme", options = providerTileOptions(minZoom = 2, maxZoom = 10)) %>% 
                       
                       addMarkers(lng=dataset1$Longitude[id], lat=dataset1$Latitude[id], popup=dataset1$Revolt[id])),
                   width=12, solidHeader = TRUE, status = "primary",
                   h3(dataset1$Revolt[id]))),
        panel(
          title = "Synopsis", solidHeader = TRUE, status = "danger",
          renderText(dataset1$Synopsis[id])),
        h4("Additional info"),
        panel(
          div(p(tags$b("Starting date:"), dataset1$`Date/ start`[id], em(".", .noWS = c("before")),
                tags$b("Ending:"), dataset1$`Date/ end`[id], em(".", .noWS = c("before")), 
                tags$b("Duration:"), dataset1$Duration[id], em(".", .noWS = c("before")),
                tags$b("Name in sources:"), dataset1$`Name in sources`[id], em(".", .noWS = c("before")),
                tags$b("Location:"), dataset1$Location[id], em(".", .noWS = c("before")),
                tags$b("Country (current):"), dataset1$Country[id], em(".", .noWS = c("before")),
                tags$b("Monarchy:"), dataset1$Monarchy[id], em(".", .noWS = c("before")),
                tags$b("Main participants:"), dataset1$Participants[id], em(".", .noWS = c("before")),
                tags$b("Number of participants:"), dataset1$`Number of participants`[id], em(".", .noWS = c("before")),
                tags$b("Main reasons & motivations:"), dataset1$Reasons[id], em(".", .noWS = c("before")),
                tags$b("Leadership:"), dataset1$Leaders[id], em(".", .noWS = c("before"))))),
        
        h4("Further reading "),
        panel(renderText(dataset1$References[id])),
        panel(div(p(tags$b("Author:"), dataset1$Author[id])))
      ))
      
    )
  })
  
} 
shinyApp(ui, server)
