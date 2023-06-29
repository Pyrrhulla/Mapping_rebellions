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
      h2("Credits", id = "credits"),
      h3("Development of the apps"),
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
        obtained in the framework of the project Resistance and developed the visualization approaches for the dataset."),
      br(),
  h3("Data collection and authorship of Encyclopaedia entries"),
  p("See the list of ", a("Contributors", href = "https://mappingrebellions.com/contributors.html", style = "font-size: 15px")),
  
  h3("Note"),
  p("Rebellions in the Early Modern Iberian World (MappingRebellions.com) 
  is a digital project conceived and developed in the framework of research project", a(" 
  “RESISTANCE: Rebellion and Resistance in the Iberian Empires, 16th-19th centuries’", href = "http://www.resistance.uevora.pt/", style = "font-size: 15px"),
  "(PI Mafalda Soares da Cunha), 
  which has received funding from the European Union’s Horizon 2020 research and innovation programme 
  under the Marie Skłodowska-Curie Grant Agreement No 778076.")
      )),
  br(),
  br(),
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
                                  </div>"))))


server <- function(input, output, session) { 
}
shinyApp(ui, server)