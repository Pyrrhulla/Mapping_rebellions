library(shiny)
library(shinyBS)
library(shinythemes)


css <- "
a{
color: #335379 !important;
  font-size: 20px;
}

.footer-dark {
  text-align:center;
  position: static;
    width: 100%;
    left: 0;
    bottom: 0;
    z-index: 1000;
    background-color: rgba(0, 0, 0, .5);
margin-bottom:-10%;
padding-top:30px;
padding-bottom:20px;
  color:#f0f9ff;

}

.footer-dark h3 {
  margin-top:0;
  margin-bottom:12px;
  font-weight:bold;
  font-size:16px;
}

.footer-dark ul {
  padding:0;
  text-align:center;
  list-style:none;
  line-height:1.6;
  font-size:14px;
  margin-left:0;
}

.footer-dark ul a {
  color:white !important;
  text-decoration:none;
  opacity:0.6;
  text-align:center;
}

.footer-dark ul a:hover {
  opacity:0.8;
}

@media (max-width:767px) {
  .footer-dark .item:not(.social) {
    text-align:center;
    padding-bottom:20px;
  }
}

.footer-dark .item.text {
  margin-bottom:36px;
}

@media (max-width:767px) {
  .footer-dark .item.text {
    margin-bottom:0;
  }
}

.footer-dark .item.text p {
  opacity:0.6;
  margin-bottom:0;
}

.footer-dark .item.social {
  text-align:center;
}

@media (max-width:991px) {
  .footer-dark .item.social {
    text-align:center;
    margin-top:20px;
  }
}

.footer-dark .item.social > a {
  font-size:20px;
  width:36px;
  height:36px;
  line-height:36px;
  display:inline-block;
  text-align:center;
  border-radius:50%;
  box-shadow:0 0 0 1px rgba(255,255,255,0.4);
  margin:0 8px;
  color:#fff;
  opacity:0.75;
}

.footer-dark .item.social > a:hover {
  opacity:0.9;
}

.footer-dark .copyright {
  text-align:center;
  padding-top:24px;
  opacity:0.3;
  font-size:13px;
  margin-bottom:0;
}


#toc_container {
  position: sticky;
  top: 0;
  background: #f9f9f9 none repeat scroll 0 0;
  border: 1px solid #aaa;
  display: table;
  font-size: 95%;
  margin-bottom: 1em;
  padding: 20px;
  width: auto;
}

.sidebar {
    background: #F4F4F4;
    height: 100vh;
    left: 0;
    overflow-x: hidden;
    overflow-y: scroll;
    position: sticky;
    top: 0;
    width: 960px;
}
"

ui<-fluidPage(
  theme = shinytheme("cosmo"),
  tags$head(tags$style(HTML(css))),
  tags$style(HTML("div.sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
  z-index: 1;
}")),
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
                       ),
                       tags$li(
                         tags$a(
                           href = "#coordination",
                           "Coordination"
                         )
                       ),
                       tags$li(
                         tags$a(
                           href = "#contributors",
                           "Contributors"
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
               br(),
               h2("Coordination", id = "coordination"),
               h3("Coordination"),
               p("José Vicente Serrão (ISCTE – University Institute of Lisbon). Email: jvserrao@iscte-iul.pt "),
               p("Mafalda Soares da Cunha (University of Évora). Email: msc@uevora.pt "),
               h3("Developer"),
               p("Alexandra Anokhina (Max Planck Institute for Legal History and Legal Theory). Email: anokhina@lhlt.mpg.de"),
               h2("Contributors", id = "contributors"),
               bsCollapse(id = "authors", 
                          bsCollapsePanel("Ana María Sixto Barcia (USC)", 
                                          p("Comuneros revolt 1520-1522"),
                                          style = "default"),
                          bsCollapsePanel("Ana Paula Medicci (UFBA)", 
                                          p("Minas backcountry riots 1736"),
                                          style = "warning"),
                          bsCollapsePanel("Ana Sofia Ribeiro (UEvora)", 
                                          p("Land customs riot 1592"),
                                          p("Porto uprising 1757"),
                                          p("Stamped paper riot 1661"),
                                          
                                          style = "default"),
                          bsCollapsePanel("André Godinho (NOVA FCSH)", 
                                          p("Succession crisis riots in Coimbra 1580"),
                                          p("Succession crisis riots in Lisbon 1580"),
                                          p("Succession crisis riots in Santarém 1580"),
                                          p("Succession crisis riots in Setúbal 1580"),
                                          style = "warning"),
                          bsCollapsePanel("Andreia Fidalgo (ISCTE-IUL)", 
                                          p("Anti-French revolts in Algarve 1808"),
                                          p("Guerrilla of Remexido 1833-1838"),
                                          style = "default"),
                          bsCollapsePanel("Ângela Barreto Xavier (ICS-UL)", 
                                          p("Cuncolim revolt 1583"),
                                          style = "warning"),
                          bsCollapsePanel("Arlindo Caldeira (NOVA FCSH)", 
                                          p("Rebellion of Amador 1595"),
                                          style = "default"),
                          bsCollapsePanel("Arthur Curvelo (ICS-UL)", 
                                          p("Mascate war 1710"),
                                          p("Palmares resistance 1602-1694"),
                                          style = "warning"),
                          bsCollapsePanel("Benita Herreros (UC)", 
                                          p("Huarochiri uprising 1750"),
                                          style = "default"),
                          bsCollapsePanel("Blanca Llanes Parra (UC)", 
                                          p("Oropesa riot in Madrid 1699"),
                                          style = "warning"),
                          bsCollapsePanel("Camilo Fernández Cortizo (USC)", 
                                          p("Galicia uprising 1846"),
                                          p("Seri-Salineros rebellion 1645"),
                                          p("Tarahumara rebellions 1646-1697"),
                                          p("Tehuantepec rebellion 1660-1661"),
                                          style = "default"),
                          bsCollapsePanel("Candela De Luca (UNLP)", 
                                          p("Chayanta rebellion 1780-1781"),
                                          p("Ingaguasi riot 1775"),
                                          p("Pocoatas uprising 1775"),
                                          p("Sucre riots 1769"),
                                          p("Tupak Katari rebellion 1781"),
                                          style = "warning"),
                          bsCollapsePanel("Daniel Malet Calvo (ISCTE-IUL)", 
                                          p("Acaxee rebellion 1591-1604"),
                                          p("Guachichiles rebellion 1599"),
                                          p("Mapuche rebellion 1723"),
                                          style = "default"),
                          bsCollapsePanel("Arthur Curvelo (ICS-UL)", 
                                          p("Mascate war 1710"),
                                          p("Palmares resistance 1602-1694"),
                                          style = "warning"),
                          bsCollapsePanel("David A. Abián Cubillo (UC)", 
                                          p("Aranjuez riot 1808"),
                                          p("Agraviados revolt 1827"),
                                          p("Royal Guard sublevation 1822"),
                                          style = "default"),
                          
                          
                          
                          bsCollapsePanel("Domingo L. González Lopo (USC)", 
                                          p("Andres Novales uprising 1823"),
                                          p("Andresote rebellion 1730-1733"),
                                          p("Anti-Welser uprising in Coro 1533"),
                                          p("Bancao rebellion 1621"),
                                          p("Basi rebellion 1807"),
                                          p("Dagohoy rebellion 1744-1829"),
                                          p("El Tocuyo rebellion 1744"),
                                          p("Francisco Congo insurrection 1713"),
                                          p("Francisco Hernandez Giron rebellion 1553"),
                                          p("Gual and España conspiracy 1797"),
                                          p("La Grita riot 1779"),
                                          p("Mapuche rebellion 1655-1662"),
                                          p("Maracaibo insurrection 1799"),
                                          p("Miranda expedition 1806"),
                                          p("Mixton war 1540-1541"),
                                          
                                          p("Negro Miguel rebellion 1552"),
                                          p("New Orleans rebellion 1768"),
                                          p("Pampanga uprising 1585"),
                                          p("Pizarrist rebellion 1544-1548"),
                                          p("Pule rebellion 1841"),
                                          p("Rebellion of Juan Francisco de Leon 1749-1752"),
                                          p("San Felipe uprising 1741"),
                                          p("San Luis Potosi revolt 1767"),
                                          p("Sangley rebellion 1603"),
                                          p("Slave insurrection in Coro 1795"),
                                          p("Sumuroy rebellion 1649-1650"),
                                          p("Taki Onqoy revolt 1560-1572"),
                                          p("Tamblot rebellion 1621"),
                                          p("Yaqui rebellion 1740"),
                                          p("Yaqui rebellion 1741"),
                                          p("Yoremes rebellion 1769"),
                                          style = "warning"),
                          bsCollapsePanel("Elvira López (PUC)", 
                                          p("Huilliche uprising 1712"),
                                          p("Tax revolt in Santiago de Chile 1776"),
                                          style = "default"),
                          bsCollapsePanel("Emir Reitano (UNLP)", 
                                          p("Alzaga conspiracy 1809"),
                                          p("Chuquisaca rebellion 1809"),
                                          p("French conspiracy 1795"),
                                          p("Insurrection in La Paz 1809"),
                                          p("La Paz rebellion 1780"),
                                          p("Lady Shore mutiny 1797"),
                                          p("Pernambucan revolt 1817"),
                                          p("Vegueros rebellion 1717-1723"),
                                          style = "warning"),
                          bsCollapsePanel("Fernanda Olival (UEvora)", 
                                          p("Manuelinho revolt 1637"),
                                          style = "default"),
                          bsCollapsePanel("Fernando Suárez Golán (USC)", 
                                          p("Tzeltal rebellion in Chiapas 1712"),
                                          p("Pueblo revolt 1680"),
                                          p("Rebellion of Jacinto Canek 1761"),
                                          p("Tutotepec rebellion 1766-1769"),
                                          style = "warning"),
                          bsCollapsePanel("Gustavo Velloso (USP)", 
                                          p("Enslaved Amerindians uprisings in S. Paulo 1652"),
                                          p("Indigenous uprising of Engenho de Santana 1602"),
                                          p("French conspiracy 1795"),
                                          p("Interethnic rebellion 1669"),
                                          p("Mestizo rebellion against military recruitment 1661"),
                                          p("Second Calchaqui War 1630-1643"),
                                          p("Seven Nations rebellion 1644"),
                                          p("Third Calchaqui War 1658-1667"),
                                          p("Uprising of coca growers in La Paz 1644"),
                                          style = "default"),
                          bsCollapsePanel("Jacqueline Sarmiento (UNLP)", 
                                          p("First Calchaqui war 1560-1563"),
                                          p("Maya rebellion of Mani and Sotuta 1562"),
                                          p("Maya uprising in Valladolid 1565"),
                                          p("Rebellion of the Barrios 1765"),
                                          p("Titiquipa uprising 1547"),
                                          p("Totonicapán rebellion 1820"),
                                          p("Second Calchaqui War 1630-1643"),
                                          p("Zapotec uprising 1550"),
                                          style = "warning"),
                          bsCollapsePanel("Jaime Valenzuela (PUC)", 
                                          p("Chiriguano resistance 1560-1660"),
                                          p("Curalaba uprising 1598"),
                                          p("Tupac Amaru rebellion 1780-1783"),
                                          style = "default"),
                          bsCollapsePanel("Joana Fraga (ICS-UL)", 
                                          p("Acclamation of Amador Bueno 1641"),
                                          style = "warning"),
                          bsCollapsePanel("Fernanda Olival (UEvora)", 
                                          p("Manuelinho revolt 1637"),
                                          style = "default"),
                          
                          bsCollapsePanel("José Luis Egío García (MPIeR)", 
                                          p("Mexico city revolt 1624"),
                                          p("Maya rebellion of Tekax 1610"),
                                          p("Tepehuan revolt 1616-1620"),
                                          style = "warning"),
                          bsCollapsePanel("José Miguel Moura Ferreira (ICS-UL)", 
                                          p("Madoba Dessai rebellion 1765-1767"),
                                          style = "default"),
                          bsCollapsePanel("José Silva Évora (UNICV)", 
                                          p("Cacheu uprising 1684"),
                                          p("Caipira battalion mutiny 1835"),
                                          p("Santa Catarina peasants uprising 1841"),
                                          p("Santiago tax revolt 1811"),
                                          p("Santo Antao uprising 1744"),
                                          p("Soldiers mutiny in Bissau 1835"),
                                          style = "warning"),
                          
                          bsCollapsePanel("José Vicente Serrão (ISCTE-IUL)", 
                                          p("Arcozelo uprising 1635"),
                                          p("Colombo military mutiny 1652"),
                                          style = "default"),
                          bsCollapsePanel("Juan Bubello (UNLP)", 
                                          p("Calabrian rebellion 1599"),
                                          p("Juan Hilario insurrection 1801"),
                                          style = "warning"),
                          bsCollapsePanel("Julian Carrera (UNLP)", 
                                          p("Comuneros of Paraguay insurrection (I) 1723-1725"),
                                          p("Great Chaco resistance 1660-1689"),
                                          p("Maya uprising in Campeche (Yucatán) 1582-1585"),
                                          p("Areco slave uprising 1767"),
                                          p("Comuneros of Merida insurrection 1781"),
                                          p("Comuneros of Paraguay insurrection (II) 1732-1735"),
                                          p("Indigenous malon to Lujan 1780"),
                                          style = "default"),
                          bsCollapsePanel("Kevin Carreira Soares (ICS)", 
                                          p("Shimabara rebellion 1637-1638"),
                                          style = "warning"),
                          
                          bsCollapsePanel("Lígia Bellini (UFBA)", 
                                          p("Santidade de Jaguaripe resistance 1580-1585"),
                                          style = "default"),
                          bsCollapsePanel("Lucía Uncal (UNLP)", 
                                          p("Enslaved uprising 1617"),
                                          p("Lacandon rebellion 1553-1556"),
                                          p("Mandu Ladino rebellion 1712-1719"),
                                          style = "warning"),
                          bsCollapsePanel("Luis Nicolau Parés (UFBA)", 
                                          p("Malê revolt 1835"),
                                          style = "default"),
                          bsCollapsePanel("Mafalda Soares da Cunha (UEvora)", 
                                          p("Aljezur riots 1637"),
                                          p("Anti-Habsburg resistance in Bragança 1580"),
                                          p("Azores food riot 1633"),
                                          p("Azores food riots 1695"),
                                          p("Beja riot 1631"),
                                          p("Beja riots 1592"),
                                          p("Ceuta riot 1638"),
                                          p("Chaves riots 1636"),
                                          p("Great Chaco resistance 1660-1689"),
                                          p("Faro riots 1637"),
                                          p("Loulé riots 1637"),
                                          p("Nuns mutiny in Viana 1704"),
                                          p("Oporto revolt 1638"),
                                          p("Paredes da Beira riot 1692"),
                                          p("Ponta Delgada uprising 1638"),
                                          p("Ponte de Lima riot 1636"),
                                          p("Santarem riots 1637"),
                                          p("Setubal riots 1637"),
                                          p("Sousel riots 1637"),
                                          p("Students riot in Coimbra 1630"),
                                          p("Tangiers pro-John IV uprising 1643"),
                                          p("Tavira riots 1637"),
                                          p("Tax disobedience in Arraiolos 1675"),
                                          p("Tax riot in Luanda 1632"),
                                          p("Tomar riots 1637"),
                                          p("Torres Vedras riot 1643"),
                                          p("Torres Vedras uprising 1640"),
                                          p("Viana do Minho riots 1635-1636"),
                                          p("Vila Real riot 1636"),
                                          p("Vila Viçosa riots 1637"),
                                          p("Tangiers riot 1595"),
                                          style = "warning"),
                          
                          bsCollapsePanel("Margarita Serna Vallejo (UC)", 
                                          p("Anti-French riot in Zaragoza 1705"),
                                          p("Anti-Walloons riot 1643"),
                                          p("Mexico City riot 1692"),
                                          p("Pamplona riots 1592"),
                                          style = "default"),
                          bsCollapsePanel("Maria Antónia Almeida (ISCTE-IUL)", 
                                          p("Alenquer uprising 1721"),
                                          p("Fishermen riots in Ovar 1737"),
                                          p("Food riots in Porto 1836"),
                                          p("Peasant riots in Coimbra 1723"),
                                          style = "warning"),
                          bsCollapsePanel("Maria Filomena Lopes de Barros (UEvora)", 
                                          p("Morisco rebellion of La Muela de Cortes 1609"),
                                          p("Morisco rebellion of Laguar 1609"),
                                          style = "default"),
                          
                          bsCollapsePanel("Mariana Meneses Muñoz (NOVA FCSH)", 
                                          p("Mongui rebellion 1753"),
                                          p("Mutiny aboard the Leona galley 1583"),
                                          style = "warning"),
                          bsCollapsePanel("Marina Fernández Flórez (UC)", 
                                          p("Germanias revolt 1519-1523"),
                                          p("Granja de San Ildefonso insurrection 1836"),
                                          p("Riego military rebellion 1820"),
                                          p("Sargadelos riot 1798"),
                                          style = "default"),
                          
                          bsCollapsePanel("Marina Torres Arce (UC)", 
                                          p("Palermo riots 1560"),
                                          p("Palermo riots 1708"),
                                          p("Revolt of Palermo 1647"),
                                          style = "warning"),
                          bsCollapsePanel("Miguel Dantas da Cruz (ICS-UL)", 
                                          p("Conspiracy of Gomes Freire 1817"),
                                          p("Our Father revolt 1666"),
                                          style = "default"),
                          
                          bsCollapsePanel("Mónica Fernández Armesto (USC)", 
                                          p("Revolt of Aragon 1591"),
                                          style = "warning"),
                          bsCollapsePanel("Moreno Pacheco (UFBA)", 
                                          p("Potiguara war 1574-1599"),
                                          style = "default"),
                          
                          bsCollapsePanel("Ofélia Rey Castelao (USC)", 
                                          p("Moorish rebellion of Alpujarras 1568"),
                                          style = "warning"),
                          bsCollapsePanel("Osvaldo Víctor Pereyra (UNLP)", 
                                          p("Bayano rebellion 1552"),
                                          p("Caquenga revolt 1607"),
                                          p("Dagami revolt 1565-1567"),
                                          p("Enriquillo rebellion 1520"),
                                          p("First indigenous resistance in Nicaragua 1523"),
                                          p("Guaicaipuro rebellion 1560-1568"),
                                          p("Igorot revolt 1601"),
                                          p("Itneg (Mandaya) revolt 1625-1627 "),
                                          p("Ladia uprising 1643"),
                                          p("Tagalog revolt 1574"),
                                          p("Taironas rebellions 1536-1541 "),
                                          p("Talamanca uprising 1615-1619"),
                                          p("Talamanca uprising 1709"),
                                          style = "default"),
                          
                          bsCollapsePanel("Pablo Sánchez León (NOVA FCSH)", 
                                          p("Anti-liberal violence in Madrid 1825"),
                                          p("Esquilache riots (Madrid) 1766"),
                                          p("Esquilache riots (replicas) 1766"),
                                          p("Zaragoza bread riots 1766"),
                                          style = "warning"),
                          bsCollapsePanel("Roberta Stumpf (NOVA FCSH)", 
                                          p("Expulsion of Jesuits 1640"),
                                          p("Revolt of Vila Rica 1720"),
                                          p("Tiradentes conspiracy 1788"),
                                          style = "default"),
                          
                          bsCollapsePanel("Rubén Castro Redondo (UC)", 
                                          p("Messina riots 1672"),
                                          p("Revolt of Messina 1674-1678"),
                                          p("Revolt of Naples 1647"),
                                          p("Revolt of the Barretines 1687-1689"),
                                          p("Riot against the royal guard 1670"),
                                          style = "warning"),
                          bsCollapsePanel("Sabrina Rosas (UNLP)", 
                                          p("Guamá rebellion 1522-1532"),
                                          p("Indigenous malon of 1740"),
                                          p("Indigenous malon to Bahia Blanca 1837"),
                                          p("Siege of Rio Cuarto 1831"),
                                          style = "default"),
                          
                          bsCollapsePanel("Sarita Mota (ISCTE-IUL)", 
                                          p("Cachaça revolt 1660"),
                                          p("Campos dos Goytacazes uprising 1748"),
                                          p("Rio de Janeiro tax revolt 1644"),
                                          style = "warning"),
                          bsCollapsePanel("Susana Aguirre (UNLP)", 
                                          p("Battle of Yi River 1702"),
                                          p("Indigenous siege to Buenos Aires 1536"),
                                          p("Mamil Mapu raiders 1750"),
                                          p("Taino rebellion 1511"),
                                          style = "default"),
                          bsCollapsePanel("Tomás A. Mantecón (UC)", 
                                          p("Comuneros of Socorro insurrection 1781"),
                                          style = "warning")),
               br(),
               h3("Development"),
               bsCollapsePanel("Alexandra Anokhina (MPI LHLT)", 
                               p("Programming, deisign and deployment of the web-site and applications"),
                               style = "default"))),
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