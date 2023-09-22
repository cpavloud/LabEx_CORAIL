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
############################LOAD LIBRARIES #####################################
################################################################################

# List of packages needed
.packages = c("mregions", "sf")

# Install CRAN packages (if not already installed)
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])

# Load packages into session 
lapply(.packages, require, character.only=TRUE)

packageVersion("mregions")
packageVersion("sf")

################################################################################
################################################################################
################################################################################

#Convert to WKT Marine Ecoregions of the World (MEOW)
#From shp object (using the sf package)
ecoregions_shp <- mr_shp(key = "Ecoregions:ecoregions", maxFeatures = 250)

#Get the polygon data from all the 52 MEOW regions of interest
ecoregions_Arnhem_Coast <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Arnhem Coast to Gulf of Carpenteria")
ecoregions_Arnhem_Coast_geom <- st_geometry(ecoregions_Arnhem_Coast) 
ecoregions_Arnhem_Coast_wkt <- st_as_text(ecoregions_Arnhem_Coast_geom)

ecoregions_Arafura_Sea <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Arafura Sea")
ecoregions_Arafura_Sea_geom <- st_geometry(ecoregions_Arafura_Sea) 
ecoregions_Arafura_Sea_wkt <- st_as_text(ecoregions_Arafura_Sea_geom)

ecoregions_Banda_Sea <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Banda Sea")
ecoregions_Banda_Sea_geom <- st_geometry(ecoregions_Banda_Sea) 
ecoregions_Banda_Sea_wkt <- st_as_text(ecoregions_Banda_Sea_geom)

ecoregions_Bismarck_Sea <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Bismarck Sea")
ecoregions_Bismarck_Sea_geom <- st_geometry(ecoregions_Bismarck_Sea) 
ecoregions_Bismarck_Sea_wkt <- st_as_text(ecoregions_Bismarck_Sea_geom)

ecoregions_Bonaparte_Coast <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Bonaparte Coast")
ecoregions_Bonaparte_Coast_geom <- st_geometry(ecoregions_Bonaparte_Coast) 
ecoregions_Bonaparte_Coast_wkt <- st_as_text(ecoregions_Bonaparte_Coast_geom)

ecoregions_Cocos <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Cocos-Keeling/Christmas Island")
ecoregions_Cocos_geom <- st_geometry(ecoregions_Cocos) 
ecoregions_Cocos_wkt <- st_as_text(ecoregions_Cocos_geom)

ecoregions_Coral_Sea <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Coral Sea")
ecoregions_Coral_Sea_geom <- st_geometry(ecoregions_Coral_Sea) 
ecoregions_Coral_Sea_wkt <- st_as_text(ecoregions_Coral_Sea_geom)

ecoregions_East_Caroline_Islands <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "East Caroline Islands")
ecoregions_East_Caroline_Islands_geom <- st_geometry(ecoregions_East_Caroline_Islands) 
ecoregions_East_Caroline_Islands_wkt <- st_as_text(ecoregions_East_Caroline_Islands_geom)

ecoregions_Easter_Island <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Easter Island")
ecoregions_Easter_Island_geom <- st_geometry(ecoregions_Easter_Island) 
ecoregions_Easter_Island_wkt <- st_as_text(ecoregions_Easter_Island_geom)

ecoregions_Eastern_Philippines <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Eastern Philippines")
ecoregions_Eastern_Philippines_geom <- st_geometry(ecoregions_Eastern_Philippines) 
ecoregions_Eastern_Philippines_wkt <- st_as_text(ecoregions_Eastern_Philippines_geom)

ecoregions_Exmouth <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Exmouth to Broome")
ecoregions_Exmouth_geom <- st_geometry(ecoregions_Exmouth) 
ecoregions_Exmouth_wkt <- st_as_text(ecoregions_Exmouth_geom)

ecoregions_Fiji <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Fiji Islands")
ecoregions_Fiji_geom <- st_geometry(ecoregions_Fiji) 
ecoregions_Fiji_wkt <- st_as_text(ecoregions_Fiji_geom)
#Fix the polygon
ecoregions_Fiji_geom_cast <- st_cast(ecoregions_Fiji_geom, "POLYGON") 
ecoregions_Fiji_wkt_1 <- st_as_text(ecoregions_Fiji_geom_cast[1])
ecoregions_Fiji_wkt_2 <- st_as_text(ecoregions_Fiji_geom_cast[2])

ecoregions_Gilbert <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Gilbert/Ellis Islands")
ecoregions_Gilbert_geom <- st_geometry(ecoregions_Gilbert) 
ecoregions_Gilbert_wkt <- st_as_text(ecoregions_Gilbert_geom)
#Fix the polygon
ecoregions_Gilbert_geom_cast <- st_cast(ecoregions_Gilbert_geom, "POLYGON") 
ecoregions_Gilbert_wkt_1 <- st_as_text(ecoregions_Gilbert_geom_cast[1])
ecoregions_Gilbert_wkt_2 <- st_as_text(ecoregions_Gilbert_geom_cast[2])
ecoregions_Gilbert_wkt_3 <- st_as_text(ecoregions_Gilbert_geom_cast[3])

ecoregions_Gulf_of_Papua <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Gulf of Papua")
ecoregions_Gulf_of_Papua_geom <- st_geometry(ecoregions_Gulf_of_Papua) 
ecoregions_Gulf_of_Papua_wkt <- st_as_text(ecoregions_Gulf_of_Papua_geom)

ecoregions_Gulf_of_Thailand <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Gulf of Thailand")
ecoregions_Gulf_of_Thailand_geom <- st_geometry(ecoregions_Gulf_of_Thailand) 
ecoregions_Gulf_of_Thailand_wkt <- st_as_text(ecoregions_Gulf_of_Thailand_geom)

ecoregions_Gulf_of_Tonkin <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Gulf of Tonkin")
ecoregions_Gulf_of_Tonkin_geom <- st_geometry(ecoregions_Gulf_of_Tonkin) 
ecoregions_Gulf_of_Tonkin_wkt <- st_as_text(ecoregions_Gulf_of_Tonkin_geom)

ecoregions_Halmahera <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Halmahera")
ecoregions_Halmahera_geom <- st_geometry(ecoregions_Halmahera) 
ecoregions_Halmahera_wkt <- st_as_text(ecoregions_Halmahera_geom)

ecoregions_Hawaii <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Hawaii")
ecoregions_Hawaii_geom <- st_geometry(ecoregions_Hawaii) 
ecoregions_Hawaii_wkt <- st_as_text(ecoregions_Hawaii_geom)
#Fix the polygon
ecoregions_Hawaii_geom_cast <- st_cast(ecoregions_Hawaii_geom, "POLYGON") 
ecoregions_Hawaii_wkt_1 <- st_as_text(ecoregions_Hawaii_geom_cast[1])
ecoregions_Hawaii_wkt_2 <- st_as_text(ecoregions_Hawaii_geom_cast[2])
ecoregions_Hawaii_wkt_3 <- st_as_text(ecoregions_Hawaii_geom_cast[3])

ecoregions_Lesser <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Lesser Sunda")
ecoregions_Lesser_geom <- st_geometry(ecoregions_Lesser) 
ecoregions_Lesser_wkt <- st_as_text(ecoregions_Lesser_geom)

ecoregions_Line <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Line Islands")
ecoregions_Line_geom <- st_geometry(ecoregions_Line) 
ecoregions_Line_wkt <- st_as_text(ecoregions_Line_geom)

ecoregions_Lord <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Lord Howe and Norfolk Islands")
ecoregions_Lord_geom <- st_geometry(ecoregions_Lord) 
ecoregions_Lord_wkt <- st_as_text(ecoregions_Lord_geom)

ecoregions_Malacca <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Malacca Strait")
ecoregions_Malacca_geom <- st_geometry(ecoregions_Malacca) 
ecoregions_Malacca_wkt <- st_as_text(ecoregions_Malacca_geom)

ecoregions_Mariana <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Mariana Islands")
ecoregions_Mariana_geom <- st_geometry(ecoregions_Mariana) 
ecoregions_Mariana_wkt <- st_as_text(ecoregions_Mariana_geom)

ecoregions_Tuamotus <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Tuamotus")
ecoregions_Tuamotus_geom <- st_geometry(ecoregions_Tuamotus) 
ecoregions_Tuamotus_wkt <- st_as_text(ecoregions_Tuamotus_geom)

ecoregions_Ningaloo <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Ningaloo")
ecoregions_Ningaloo_geom <- st_geometry(ecoregions_Ningaloo) 
ecoregions_Ningaloo_wkt <- st_as_text(ecoregions_Ningaloo_geom)

ecoregions_Papua <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Papua")
ecoregions_Papua_geom <- st_geometry(ecoregions_Papua) 
ecoregions_Papua_wkt <- st_as_text(ecoregions_Papua_geom)

ecoregions_Solomon_Archipelago <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Solomon Archipelago")
ecoregions_Solomon_Archipelago_geom <- st_geometry(ecoregions_Solomon_Archipelago) 
ecoregions_Solomon_Archipelago_wkt <- st_as_text(ecoregions_Solomon_Archipelago_geom)

ecoregions_Solomon_Sea <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Solomon Sea")
ecoregions_Solomon_Sea_geom <- st_geometry(ecoregions_Solomon_Sea) 
ecoregions_Solomon_Sea_wkt <- st_as_text(ecoregions_Solomon_Sea_geom)

ecoregions_Vanuatu <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Vanuatu")
ecoregions_Vanuatu_geom <- st_geometry(ecoregions_Vanuatu) 
ecoregions_Vanuatu_wkt <- st_as_text(ecoregions_Vanuatu_geom)

ecoregions_Marquesas <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Marquesas")
ecoregions_Marquesas_geom <- st_geometry(ecoregions_Marquesas) 
ecoregions_Marquesas_wkt <- st_as_text(ecoregions_Marquesas_geom)

ecoregions_Samoa <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Samoa Islands")
ecoregions_Samoa_geom <- st_geometry(ecoregions_Samoa) 
ecoregions_Samoa_wkt <- st_as_text(ecoregions_Samoa_geom)

ecoregions_Society <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Society Islands")
ecoregions_Society_geom <- st_geometry(ecoregions_Society) 
ecoregions_Society_wkt <- st_as_text(ecoregions_Society_geom)

ecoregions_Marshall <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Marshall Islands")
ecoregions_Marshall_geom <- st_geometry(ecoregions_Marshall) 
ecoregions_Marshall_wkt <- st_as_text(ecoregions_Marshall_geom)

ecoregions_Tonga <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Tonga Islands")
ecoregions_Tonga_geom <- st_geometry(ecoregions_Tonga) 
ecoregions_Tonga_wkt <- st_as_text(ecoregions_Tonga_geom)

ecoregions_West_Caroline <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "West Caroline Islands")
ecoregions_West_Caroline_geom <- st_geometry(ecoregions_West_Caroline) 
ecoregions_West_Caroline_wkt <- st_as_text(ecoregions_West_Caroline_geom)

ecoregions_New_Caledonia <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "New Caledonia")
ecoregions_New_Caledonia_geom <- st_geometry(ecoregions_New_Caledonia) 
ecoregions_New_Caledonia_wkt <- st_as_text(ecoregions_New_Caledonia_geom)

ecoregions_Torres <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Torres Strait Northern Great Barrier Reef")
ecoregions_Torres_geom <- st_geometry(ecoregions_Torres) 
ecoregions_Torres_wkt <- st_as_text(ecoregions_Torres_geom)

ecoregions_Java <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Southern Java")
ecoregions_Java_geom <- st_geometry(ecoregions_Java) 
ecoregions_Java_wkt <- st_as_text(ecoregions_Java_geom)

ecoregions_Central_Reef <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Central and Southern Great Barrier Reef")
ecoregions_Central_Reef_geom <- st_geometry(ecoregions_Central_Reef) 
ecoregions_Central_Reef_wkt <- st_as_text(ecoregions_Central_Reef_geom)

ecoregions_Phoenix <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Phoenix/Tokelau/Northern Cook Islands")
ecoregions_Phoenix_geom <- st_geometry(ecoregions_Phoenix) 
ecoregions_Phoenix_wkt <- st_as_text(ecoregions_Phoenix_geom)

ecoregions_Palawan <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Palawan/North Borneo")
ecoregions_Palawan_geom <- st_geometry(ecoregions_Palawan) 
ecoregions_Palawan_wkt <- st_as_text(ecoregions_Palawan_geom)

ecoregions_Northeast_Sulawesi <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Northeast Sulawesi")
ecoregions_Northeast_Sulawesi_geom <- st_geometry(ecoregions_Northeast_Sulawesi) 
ecoregions_Northeast_Sulawesi_wkt <- st_as_text(ecoregions_Northeast_Sulawesi_geom)

ecoregions_Sulawesi <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Sulawesi Sea/Makassar Strait")
ecoregions_Sulawesi_geom <- st_geometry(ecoregions_Sulawesi) 
ecoregions_Sulawesi_wkt <- st_as_text(ecoregions_Sulawesi_geom)

ecoregions_Rapa <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Rapa-Pitcairn")
ecoregions_Rapa_geom <- st_geometry(ecoregions_Rapa) 
ecoregions_Rapa_wkt <- st_as_text(ecoregions_Rapa_geom)

ecoregions_Ogasawara <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Ogasawara Islands")
ecoregions_Ogasawara_geom <- st_geometry(ecoregions_Ogasawara) 
ecoregions_Ogasawara_wkt <- st_as_text(ecoregions_Ogasawara_geom)

ecoregions_Oceanic <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "South China Sea Oceanic Islands")
ecoregions_Oceanic_geom <- st_geometry(ecoregions_Oceanic) 
ecoregions_Oceanic_wkt <- st_as_text(ecoregions_Oceanic_geom)

ecoregions_Kuroshio <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "South Kuroshio")
ecoregions_Kuroshio_geom <- st_geometry(ecoregions_Kuroshio) 
ecoregions_Kuroshio_wkt <- st_as_text(ecoregions_Kuroshio_geom)

ecoregions_Southeast_Papua <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Southeast Papua New Guinea")
ecoregions_Southeast_Papua_geom <- st_geometry(ecoregions_Southeast_Papua) 
ecoregions_Southeast_Papua_wkt <- st_as_text(ecoregions_Southeast_Papua_geom)

ecoregions_Southern_China <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Southern China")
ecoregions_Southern_China_geom <- st_geometry(ecoregions_Southern_China) 
ecoregions_Southern_China_wkt <- st_as_text(ecoregions_Southern_China_geom)

ecoregions_Southern_Vietnam <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Southern Vietnam")
ecoregions_Southern_Vietnam_geom <- st_geometry(ecoregions_Southern_Vietnam) 
ecoregions_Southern_Vietnam_wkt <- st_as_text(ecoregions_Southern_Vietnam_geom)

ecoregions_Sund_Java <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Sunda Shelf/Java Sea")
ecoregions_Sund_Java_geom <- st_geometry(ecoregions_Sund_Java) 
ecoregions_Sund_Java_wkt <- st_as_text(ecoregions_Sund_Java_geom)

ecoregions_Austral <- subset(ecoregions_shp, ecoregions_shp$ecoregion == "Southern Cook/Austral Islands")
ecoregions_Austral_geom <- st_geometry(ecoregions_Austral) 
ecoregions_Austral_wkt <- st_as_text(ecoregions_Austral_geom)

#Save the workspace
save.image(file = "mregions.RData")

################################################################################
################################################################################
################################################################################