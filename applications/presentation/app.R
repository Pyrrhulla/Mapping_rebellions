library(shiny)
library(shinyBS)
library(shinythemes)



ui<-fluidPage(
  theme = shinytheme("cosmo"),
  tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
  sidebarLayout(
    tags$div(
      class = "sticky",
      sidebarPanel(style = "background-color: transparent !important;
                          border-color: transparent !important",
                   fluidRow(style = "background-color: transparent !important;
               border-color: transparent !important",
                            column(
                              width = 12,
                              tags$div(
                                id = "toc_container",
                                tags$h3(
                                  class = "toc_title",
                                  "Content"
                                ),
                                tags$ul(
                                  class = "toc_list",
                                  tags$li(
                                    tags$a(
                                      href = "#scope",
                                      "Scope and goals"
                                    ),
                                  ),
                                  tags$li(
                                    tags$a(
                                      href = "#method",
                                      "Methodology and criteria"
                                    )
                                  ),
                                  tags$li(
                                    tags$a(
                                      href = "#tech",
                                      "Technical and programming details"
                                    )
                                  )
                                )
                              )
                            )
                   )
      )
    ),
    
    mainPanel(
      h2("Presentation"),
      h3("Scope and goals", id = "scope"),
      p("Welcome to MappingRebellions.com, a website that offers a unique and comprehensive overview of hundreds of rebellions that took place in the Iberian world during the early modern period (1500 to 1850)."),
      p("The “Iberian world” refers to Portugal, Spain, and the territories under their empires, which at the time spanned across Europe, Africa, Asia, and the Americas, covering around 40 present-day countries. This broad geographical scope allows us to offer a truly global perspective on the history of rebellions in the early modern period."),
      p("Our website offers three main navigation options: a digital map, an encyclopedia, and analytical tools. The digital map allows users to see the locations and details of specific rebellions at a glance. The encyclopaedia provides in-depth information on the causes, events, and outcomes of each rebellion. Finally, the analytics section invites users to build their own graphs, tables, and statistics, allowing for a more personalized and interactive experience."),
      p("Our goal is to provide a comprehensive and reliable resource for anyone interested in the history of active resistance and social conflict in the early modern world. Whether you are a student, historian, or simply curious about this fascinating topic and period of history, we hope you will find our website both informative and engaging."),
      p("We strive to make the website as accurate and up-to-date as possible, and we welcome any suggestions or corrections. If you have any feedback or questions, or if you wish to join our team of contributors, please don't hesitate to contact us."),
      p("Thank you for visiting MappingRebellions.com!"),
      br(),
      h3("Methodology and criteria", id = "method"),
      p("The website is powered by a comprehensive database built with contributions from dozens of researchers. It collects all available information for each revolt, organized into 20 fields, which include a synoptic description, some bibliographical references, as well as additional info on topics such as its location, duration, reasons for contention, number and social typology of participants, leadership, plus its relevance in history and historiography."),
      p("Since this site is addressed to a worldwide undifferentiated public and not only, or even primarily, to the scholarly community, please note that the contributors were asked to comply with some rules of simplicity, namely keeping the synopsis below 1.500 characters, and limiting the bibliography, as well as the reasons for insurgency and the social categories of participants, to a maximum of 3 references."),
      p("Please also note that although most of the site is written in English, each contributor is free to write the event synopses in either English, Portuguese or Spanish. In order to make the contents accessible for everyone, we hope to provide an automatic translation function soon."),
      p("What kind of events are we dealing with? – We use the term rebellion as a generic descriptor for all outbreaks of resistance that are commonly known by a variety of labels, the most common being uprising, riot, revolt, rebellion, mutiny, insurrection, and conspiracy (plus their corresponding words in Portuguese and in Spanish). To be more precise, only active, violent and collective actions of insurgency, carried out by subordinate people, with a minimum of 20 participants are considered for the purposes of this project."),
      p("As for the concept of subordinate, we use it in context, meaning that it refers to all categories of people who, in each context, were considered or considered themselves to be subordinate whether from a social, ethnic or political viewpoint."),
      p("1500-1850 is the global chronological scope of the project, but only revolts that occurred in territories under Portuguese or Spanish imperial jurisdiction are considered. Events that took place after independence (for instance, in Brazil after 1822 or in Mexico after 1821) are excluded."),
      p("So far, we have identified 500+ events that meet the criteria mentioned above, of which about half are already fully described in our database. As this is an ongoing project, new entries are regularly added to the database and made available online."),
      br(),
      h3("Technical and programming details", id = "tech"),
      p("The project consists of the applications and the web-site. The main languages of the applications are R and JavaScript. The applications are deployed using the shiny server. The completed code is available on the GitHub page of the project."),
      br(),
      br()
     )),
  fluidRow(tags$footer(HTML("
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
                           "))))      


server <- function(input, output, session) { 
}
shinyApp(ui, server)