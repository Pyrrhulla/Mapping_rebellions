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
      h3("Coordination"),
      p("José Vicente Serrão (ISCTE – University Institute of Lisbon). Email: jvserrao@iscte-iul.pt "),
      p("Mafalda Soares da Cunha (University of Évora). Email: msc@uevora.pt "),
      h3("Developer"),
      p("Alexandra Anokhina (Max Planck Institute for Legal History and Legal Theory). Email: anokhina@lhlt.mpg.de"))),

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


server <- function(input, output, session) { 
}
shinyApp(ui, server)