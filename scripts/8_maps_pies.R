# ============================================================
'R code for LabEx CORAIL book chapter on fish parasites

Christina Pavloudi
cpavloud@hcmr.gr
https://cpavloud.github.io/mysite/

	Copyright (C) 2023 Christina Pavloudi
  
    This script is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
  
    This script is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.'

# =============================================================

################################################################################
########################### LOAD LIBRARIES #####################################
################################################################################

# List of packages needed
.packages = c("memisc", "assertthat", "sqldf", "magrittr", "dplyr", "reshape2", "ggplot2", "oz", 
              "scatterpie", "rgdal", "maptools", "maps", "ggmap", "mapproj", "scales", 
              "rworldmap", "sf", "reshape", "rworldxtra", "leaflet", "spData")

# Install CRAN packages (if not already installed)
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])

# Load packages into session 
lapply(.packages, require, character.only=TRUE)

packageVersion("memisc")
packageVersion("assertthat")
packageVersion("sqldf")
packageVersion("magrittr")
packageVersion("dplyr")
packageVersion("reshape2")
packageVersion("ggplot2")
packageVersion("oz")
packageVersion("scatterpie")
packageVersion("rgdal")
packageVersion("maptools")
packageVersion("maps")
packageVersion("ggmap")
packageVersion("mapproj")
packageVersion("mapdata")
packageVersion("scales")
packageVersion("rworldmap")
packageVersion("sf")
packageVersion("reshape")
packageVersion("rworldxtra")
packageVersion("leaflet")
packageVersion("spData")

################################################################################
############################# IMPORT FILES #####################################
################################################################################

lat_lon_province <- read.csv("lat_lon_province.txt", sep ="\t")

##############################################################################
############################### FISH MAPS ####################################
##############################################################################

fish_province <- read.csv("fish_province_stats.txt", sep ="\t", row.names = 1)
fish_province <- tibble::rownames_to_column(fish_province, "PROVINCE")
fish_province_lat_lon <- merge(fish_province, lat_lon_province, by = "PROVINCE")
fish_province_lat_lon$Reef_Fish <- as.integer(fish_province_lat_lon$Reef_Fish)

# Create a color palette with handmade bins
mybins=seq(1, 4000, by=500)
mypalette = colorBin(palette="YlOrBr", domain=fish_province_lat_lon$Reef_Fish, na.color="transparent", bins=mybins)

# Prepare the text for the tooltip:
mytext=paste("PROVINCE: ", fish_province_lat_lon$PROVINCE, "<br/>", "Number of reef fish species: ", fish_province_lat_lon$Reef_Fish, sep="") %>%
  lapply(htmltools::HTML)

# Final Map
leaflet(fish_province_lat_lon) %>% 
  addTiles()  %>% 
  setView( lat=-5, lng=-166 , zoom=4) %>%
  addProviderTiles("Esri.WorldTerrain") %>%
  addCircles(~Longitude, ~Latitude, 
             fillColor = ~mypalette(Reef_Fish), fillOpacity = 0.7, color="white", radius=~Reef_Fish*200, stroke=FALSE, weight = 1,
             label = mytext,
             labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  ) %>%
  addLegend( pal=mypalette, values=~Reef_Fish, opacity=0.9, title = "Reef fish species", position = "bottomright" )

##############################################################################
########################### PARASITE MAPS ####################################
##############################################################################

pies <- read.csv("parasites_province_stats.txt", sep ="\t")
pies_ecoregion_lat_lon <- merge(pies, lat_lon_province, by = "PROVINCE")
pies_ecoregion_lat_lon[is.na(pies_ecoregion_lat_lon)] <- 0
colnms=c("Copepoda", "Trematoda", "Acanthocephala", "Myxozoa", "Monogenea", "Cestoda", 
         "Nematoda", "Isopoda", "Others")
pies_ecoregion_lat_lon$Total_parasites<-rowSums(pies_ecoregion_lat_lon[,colnms])

## trasform to sf odject and assign CRS
pies_sf <- st_as_sf(pies_ecoregion_lat_lon, coords=c("Longitude","Latitude"),crs = st_crs("WGS84"))

## transform to EPSG:3832 to match the pacific ocean CRS
pies_sf_3832 <- st_transform(pies_sf, "EPSG:3832")

## make data frame again because the geom_scatterpie doesn't accept sf objects
pies_sf_3832$Longitude  <- st_coordinates(pies_sf_3832)[,1]
pies_sf_3832$Latitude  <- st_coordinates(pies_sf_3832)[,2]
pies_sf_3832_df <- st_drop_geometry(pies_sf_3832)
pies_sf_3832_df$radius <- pies_sf_3832_df$Total_parasites*2000


### Load map data from spData and transformations

world <- world # use the spData 


## transform to EPSG:3832 to match the pacific ocean CRS
world_pacific <- st_transform(world, "EPSG:3832") 
## its important to make valid because there are some values 
## in the polygons that go to infinity
world_pacific <- st_make_valid(world_pacific)


## The scope of the EPSG:3832 is not for global mapping 
## therefore keep only the desired area
world_pacific_crop <- st_crop(world_pacific, xmin=-10387065, ymin=-11225295, xmax=19953635, ymax=9906424 )

## plot
##
map_world_pacific_sf <- ggplot() +
  geom_sf(world_pacific_crop, mapping=aes()) +
  geom_sf(pies_sf_3832,  mapping=aes()) +
  xlab(expression(paste("Longitude"))) +
  ylab(expression(paste("Latitude"))) +
  #geom_label(data = pies_sf_3832_df, 
  #           mapping=aes(x = Longitude, y = Latitude, label = PROVINCE),
  #           size = 1.5,
  #           nudge_x = 1000000,
  #           nudge_y = 100000)+
  geom_scatterpie(aes(x=Longitude, y=Latitude, r=radius), 
                  data = pies_sf_3832_df,
                  cols = colnames(pies_sf_3832_df[,c(2:10)]),
                  color=NA, alpha=.8) + 
  guides(fill=guide_legend(title="Parasites"))+
  geom_scatterpie_legend(pies_sf_3832_df$Total_parasites*2000,
                         x=-5205792.4,
                         y=-7529715.0) +
  theme_bw()

ggsave("map_pacific_pie_sept.png", width = 10, plot=map_world_pacific_sf)

#Save the workspace
save.image(file = "fish_parasite_maps.RData")

##############################################################################
##############################################################################
##############################################################################
