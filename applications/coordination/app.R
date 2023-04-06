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
                            border-color: transparent !important")),
      mainPanel(
      h2("Coordination", id = "coordination"),
      h3("Coordination of the project MappingRebellions"),
      p("José Vicente Serrão (ISCTE – University Institute of Lisbon). Email:", a("jvserrao@iscte-iul.pt", href = "mailto:jvserrao@iscte-iul.pt", style = "font-size: 15px")),
      p("Mafalda Soares da Cunha (University of Évora). Email:", a("msc@uevora.pt", href = "mailto:msc@uevora.pt", style = "font-size: 15px")),
      h3("Developement of the apps for MappingRebellions"),
      p("Credits are attributed on the basis of", a("CRediT (Contributor Roles Taxonomy)", href = "https://credit.niso.org", style = "font-size: 15px")),
      p("Alexandra Anokhina (Max Planck Institute for Legal History and Legal Theory, Frankfurt am Main)", a("anokhina@lhlt.mpg.de", href = "mailto:anokhina@lhlt.mpg.de", style = "font-size: 15px"),
      br(),
      "Conceptualization, Formal Analysis, Investigation, Methodology, Software, Validation, Visualization, Writing-original draft"),
      p("Benedetta Albani (Max Planck Institute for Legal History and Legal Theory, Frankfurt am Main)", a("albani@lhlt.mpg.de", href = "mailto:albani@lhlt.mpg.de", style = "font-size: 15px"),
      br(),
      "Conceptualization, Methodology, Resources, Supervision, Validation, Writing-review editing"),
      p("The apps for “MappingRebellions” were developed by Alexandra Anokhina under the supervision of Dr. Benedetta Albani in the frame of the 
        activities of the research group", a("Normative knowledge in the praxis of the Congregation of the Council. The production of normative categories and models for the post-Tridentine world", href = "https://www.lhlt.mpg.de/2732047/02-albani-Normative-knowledge-in-the-praxis-of-the-Congregation-of-the-Council", style = "font-size: 15px"), 
        "active at the", a("Max Planck Institute for Legal History and Legal Theory", href = "https://www.lhlt.mpg.de/en", style = "font-size: 15px"), 
        "Alexandra Anokhina provided the research, conceptualization and development of the applications for spatial, graphic and encyclopedic visualization of the data, 
        obtained in the framework of the project Resistance and developed the visualization approaches for the dataset."))),
      br(),
      br(),
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
                                  </div>"))))


server <- function(input, output, session) { 
}
shinyApp(ui, server)