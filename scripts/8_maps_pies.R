getwd()
setwd("C:/Users/cpavl/OneDrive/Έγγραφα/Post-Doc/CNRS_Labex_Corail/References")


library(memisc)
library(assertthat)
library(sqldf)
library(magrittr)
library(dplyr)
library(reshape2)
library(ggplot2)
library(oz)
library(scatterpie)
library(rgdal)
library(maptools)
library(maps)
library(ggmap)
library(mapproj)
library(mapdata)
library(scales) 
library(rworldmap)
library(sf)
library(reshape)
library(rworldxtra)
library(leaflet)
library(spData) # for the shapefiles of world


load("maps.RData")

##############################################################################

lat_lon_ecoregion <- read.csv("lat_lon_ecoregion.txt", sep ="\t")
lat_lon_province <- read.csv("lat_lon_province.txt", sep ="\t")
spalding_regions <- read.csv("Spalding_regions.txt", sep ="\t")

##############################################################################
################################ fish ########################################
##############################################################################

# fish_ecoregion <- read.csv("merged_unique_fish_OBIS_FishBase_Barcoding_stats.txt", sep =";")
# fish_ecoregion <- tibble::rownames_to_column(fish_ecoregion, "ECOREGION")
# fish_ecoregion_lat_lon <- merge(fish_ecoregion, lat_lon_ecoregion, by = "ECOREGION")
# fish_ecoregion_lat_lon$Fish <- as.integer(fish_ecoregion_lat_lon$Fish)
# fish_ecoregion_lat_lon <- merge(fish_ecoregion_lat_lon, spalding_regions, by = "ECOREGION")

#fish_province <- read.csv("merged_unique_fish_OBIS_FishBase_Barcoding_stats_province.txt", sep =";")
fish_province <- read.csv("4552_fish_province_stats.txt", sep ="\t", row.names = 1)
fish_province <- tibble::rownames_to_column(fish_province, "PROVINCE")
fish_province_lat_lon <- merge(fish_province, lat_lon_province, by = "PROVINCE")
fish_province_lat_lon$Fish <- as.integer(fish_province_lat_lon$Fish)
#fish_province_lat_lon <- merge(fish_province_lat_lon, spalding_regions, by = "PROVINCE")

#mapBubbles(fish_ecoregion_lat_lon, nameX="Longitude", nameY="Latitude", 
#           nameZSize='Fish', nameZColour = 'ECOREGION',
#           colourPalette='terrain', oceanCol='lightblue', landCol='gray50', 
#           addLegend = FALSE, addColourLegend	= FALSE)

#mapBubbles(final_data, nameZSize='Neoplasms',
#           colourPalette='rainbow', oceanCol='lightblue', landCol='gray50') 

# Create a color palette with handmade bins.
mybins=seq(1, 3500, by=500)
#lowest 58
#highest 9146
mypalette = colorBin(palette="YlOrBr", domain=fish_province_lat_lon$Fish, na.color="transparent", bins=mybins)

# Prepare the text for the tooltip:
mytext=paste("PROVINCE: ", fish_province_lat_lon$PROVINCE, "<br/>", "Number of fish species: ", fish_province_lat_lon$Fish, sep="") %>%
  lapply(htmltools::HTML)

# Final Map
leaflet(fish_province_lat_lon) %>% 
  addTiles()  %>% 
  setView( lat=-5, lng=-166 , zoom=4) %>%
  addProviderTiles("Esri.WorldTerrain") %>%
  addCircles(~Longitude, ~Latitude, 
             fillColor = ~mypalette(Fish), fillOpacity = 0.7, color="white", radius=~Fish*200, stroke=FALSE, weight = 1,
             label = mytext,
             labelOptions = labelOptions( style = list("font-weight" = "normal", padding = "3px 8px"), textsize = "13px", direction = "auto")
  ) %>%
  addLegend( pal=mypalette, values=~Fish, opacity=0.9, title = "Fish species", position = "bottomright" )

##############################################################################
############################# parasites ######################################
##############################################################################

#pies <- read.csv("pies.txt", sep ="\t")
pies <- read.csv("pies_september.txt", sep ="\t")
colnames(pies)[colnames(pies) == "Province"] ="PROVINCE"


pies_ecoregion_lat_lon <- merge(pies, lat_lon_province, by = "PROVINCE")
pies_ecoregion_lat_lon[is.na(pies_ecoregion_lat_lon)] <- 0
#colnms=c("Copepoda", "Trematoda", "Others")
colnms=c("Copepoda", "Trematoda")
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

world <- world # use the spData \


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
                  cols = colnames(pies_sf_3832_df[,c(2:3)]),
                  color=NA, alpha=.8) + 
  guides(fill=guide_legend(title="Parasites"))+
  geom_scatterpie_legend(pies_sf_3832_df$Total_parasites*2000,
                         x=-5205792.4,
                         y=-7529715.0) +
  theme_bw()

ggsave("map_pacific_pie_sept.png", width = 10, plot=map_world_pacific_sf)






###############################################################################


# lon_min <- 80
# lon_max <- 270
# lat_min <- -50
# lat_max <- 50
# 
# n <- nrow(pies_ecoregion_lat_lon)
# pies_ecoregion_lat_lon$radius <- 6 * abs(rnorm(n))
# 
# 
# # Using map_data()
# pacific_world <- map_data("world2")
# 
# #world2MapEnv or world2
# #This is an alternative version of the world database based on latitudes [0, 360), 
# #which then has the Pacific Ocean in the centre of the map.
# mapplot_pacific <- ggplot(pacific_world) + 
#   geom_map(data = pacific_world, map = pacific_world, 
#            aes(x=long, y=lat, map_id=region), col = "white", fill = "gray50") + theme_bw()
# mapplot_pacific + 
#   coord_map(xlim=c(lon_min, lon_max), ylim=c(lat_min, lat_max)) +
#   geom_scatterpie(aes(x=Longitude, y=Latitude, r=radius), 
#                 data = pies_ecoregion_lat_lon, cols = colnames(pies_ecoregion_lat_lon[,c(3:9)]), 
#                 color=NA, alpha=.8) +
#   geom_scatterpie_legend(pies_ecoregion_lat_lon$radius, x=240, y=35)
# ggsave("map_try_1.png", width = 10)

#mapplot_pacific <- ggplot(pacific_world) + 
#  geom_map(data = pacific_world, map = pacific_world, 
#           aes(x=long, y=lat, map_id=region), col = "white", fill = "gray50") +
#  geom_scatterpie(aes(x=longitude, y=latitude, group = country, r = multiplier*6), 
#                data = final_data, cols = colnames(final_data[,c(2:11)])) + theme_bw()
#mapplot_pacific



###############################################################################



#coast_map <- fortify(map("world2", 
#                         xlim = c(lon_min, lon_max), 
#                         ylim = c(lat_min, lat_max), 
#                         fill = T, plot = F))

# pacific_map <- fortify(pacific_world, 
#                          xlim = c(lon_min, lon_max), 
#                          ylim = c(lat_min, lat_max), 
#                          fill = T, plot = F)
# 
# pacific <- ggplot(pacific_map)
# 
# 
# 
# ggplot(pacific_map, aes(x = long, y = lat, group = region)) + geom_polygon() + 
#   coord_map(xlim=c(lon_min, lon_max), ylim=c(lat_min, lat_max)) +
#   geom_scatterpie(aes(x=Longitude, y=Latitude, group = PROVINCE, r=radius), 
#                   data = pies_ecoregion_lat_lon, cols = colnames(pies_ecoregion_lat_lon[,c(3:9)]), 
#                   color=NA, alpha=.8) +
#                   geom_scatterpie_legend(pies_ecoregion_lat_lon$radius, x=240, y=35)


# 
# ggplot(pacific_map, aes(x = long, y = lat, group = group)) + geom_polygon() + 
#   coord_map(xlim=c(lon_min, lon_max), ylim=c(lat_min, lat_max)) +
#   geom_scatterpie(aes(x=Longitude, y=Latitude, group = PROVINCE, r=radius), 
#                   data = pies_ecoregion_lat_lon, cols = colnames(pies_ecoregion_lat_lon[,c(3:9)]), 
#                   color=NA, alpha=.8) +
#   geom_scatterpie_legend(pies_ecoregion_lat_lon$radius, x=240, y=35) + 
#   theme_bw()
# ggsave("map_try_2.png", width = 10)

#South_China_Sea <- fortify(South_China_Sea_shp)

#China <- subset(pacific_world, region=="China")


#mapplot_pacific_2 <- ggplot(data = mapplot_pacific, aes(long, lat, group=group)) +
#  geom_polygon(color = "white", fill  = "gray50")

#mapplot_pacific_2

###############################################################################

#http://rgraphgallery.blogspot.com/2013/04/rg-plot-bar-or-pie-chart-over-world-map.html


# 
# mapPies(pies_ecoregion_lat_lon,nameX="Longitude", nameY="Latitude", 
#         nameZs=colnames(pies_ecoregion_lat_lon[,c(3:9)]),mapRegion='Tonga', 
#         symbolSize = 4, 
#         oceanCol = "lightblue",
#          landCol = "gray50")
# 
# mapPies(pies_ecoregion_lat_lon,nameX="Longitude", nameY="Latitude", 
#         nameZs=colnames(pies_ecoregion_lat_lon[,c(3:9)]), 
#         symbolSize = 4, 
#         oceanCol = "lightblue",
#         landCol = "gray50")
# 
# 
# "Australia"
# "Indonesia"
# "New Caledonia"
# "New Zealand"
# "Papua New Guinea"
# "Solomon Is."
# "Vanuatu"
# "Cook Is."
# "Fr. Polynesia"
# "Tonga"
# 
# getMap()$NAME
# 
# mapregions <- getMap()[['NAME']]
# mapregions <- as.data.frame(mapregions)
# write.csv(mapregions, "mapregions.csv")


# convert to SpatialPolygonsDataFrame
#spdf <- as_Spatial(South_China_Sea)

#mapPies(spdf, 
#        nameZs=c('eco_code','mrgid'),
#        xlim = c(-100,150), 
#        ylim = c(-150,150),
#        symbolSize = 4, 
#        oceanCol = "lightblue",
#        landCol = "gray50")



#dF	
#data frame or SpatialPolygonsDataFrame

#nameX	
#name of column containing the X variable (longitude), not needed if dF is a SpatialPolygonsDataFrame

#nameY	
#name of column containing the Y variable (lattitude), not needed if dF is a SpatialPolygonsDataFrame

#nameZs	
#name of columns containing numeric variables to determine bar sections

#zColours	
#colours to apply to the bar section for each attribute column

#xlim	
#map extents c(west,east), can be overidden by mapRegion

#ylim	
#map extents c(south,north), can be overidden by mapRegion


################################################################################

#m <- leaflet() %>% 
#  addTiles() %>% 
#  setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% 
#  addProviderTiles("Esri.WorldTerrain")
#m






#Nasa: NASAGIBS.ViirsEarthAtNight2012
#Google map: Esri.WorldImagery
#Gray: Esri.WorldGrayCanvas
#Terrain: Esri.WorldTerrain
#Topo Map: Esri.WorldTopoMap

# 
# write.table(fish_ecoregion_lat_lon, "fish_ecoregion_lat_lon.txt", 
#             row.names = FALSE, col.names = TRUE, sep=";")




#Save the workspace
save.image(file = "fish_parasite_maps.RData")

load("fish_parasite_maps.RData")





