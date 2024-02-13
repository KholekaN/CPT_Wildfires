
# Install and load required libraries
install.packages("leaflet")
install.packages("shiny")
install.packages("sf")

library(leaflet)
library(shiny)
library(sf)

#Read Shapefiles from ArcGIS Pro project
hotspots_shapefile <- st_read("C:/Users/medup/Documents/Nkazimulo's Data/TASK 2/fire data/Map/Hotspot_Areas.shp")

#Define UI for application
ui <- fluidPage(
  leafletOutput("map")
)

#Define server logic
server <- function(input, output, session) {
  output$map <- renderLeaflet({
    leaflet(data = hotspots_shapefile) %>%
      addTiles() %>%
      addPolygons()  
  })
}

#Run the application
shinyApp(ui = ui, server = server)

