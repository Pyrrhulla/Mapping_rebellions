library(shiny)
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
      p("José Vicente Serrão (ISCTE – University Institute of Lisbon). Email:", a("jvserrao@iscte-iul.pt", href = "mailto:jvserrao@iscte-iul.pt", style = "font-size: 15px")),
      p("Mafalda Soares da Cunha (University of Évora). Email:", a("msc@uevora.pt", href = "mailto:msc@uevora.pt", style = "font-size: 15px")))),
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
                        <li> 2019. This work is licensed under a CC BY 4.0 license</li>

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