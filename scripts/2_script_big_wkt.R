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
.packages = c("readr", "dplyr", "sf")

# Install CRAN packages (if not already installed)
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])

# Load packages into session 
lapply(.packages, require, character.only=TRUE)

packageVersion("readr")
packageVersion("dplyr")
packageVersion("sf")

################################################################################
########################### LOAD WORKSPACE #####################################
################################################################################

load(file = "mregions.RData")

################################################################################
################################################################################
################################################################################

geom_ecoregions_Arnhem_Coast_wkt <- st_as_sf(data.frame(wkt = ecoregions_Arnhem_Coast_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Arnhem_Coast_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Arnhem_Coast_wkt)), digits = 6)

geom_ecoregions_Arafura_Sea_wkt <- st_as_sf(data.frame(wkt = ecoregions_Arafura_Sea_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Arafura_Sea_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Arafura_Sea_wkt)), digits = 6)

geom_ecoregions_Banda_Sea_wkt <- st_as_sf(data.frame(wkt = ecoregions_Banda_Sea_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Banda_Sea_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Banda_Sea_wkt)), digits = 6)

geom_ecoregions_Bismarck_Sea_wkt <- st_as_sf(data.frame(wkt = ecoregions_Bismarck_Sea_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Bismarck_Sea_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Bismarck_Sea_wkt)), digits = 6)

geom_ecoregions_Bonaparte_Coast_wkt <- st_as_sf(data.frame(wkt = ecoregions_Bonaparte_Coast_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Bonaparte_Coast_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Bonaparte_Coast_wkt)), digits = 6)

geom_ecoregions_Cocos_wkt <- st_as_sf(data.frame(wkt = ecoregions_Cocos_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Cocos_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Cocos_wkt)), digits = 6)

geom_ecoregions_Coral_Sea_wkt <- st_as_sf(data.frame(wkt = ecoregions_Coral_Sea_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Coral_Sea_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Coral_Sea_wkt)), digits = 6)

geom_ecoregions_East_Caroline_Islands_wkt <- st_as_sf(data.frame(wkt = ecoregions_East_Caroline_Islands_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_East_Caroline_Islands_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_East_Caroline_Islands_wkt)), digits = 6)

geom_ecoregions_Easter_Island_wkt <- st_as_sf(data.frame(wkt = ecoregions_Easter_Island_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Easter_Island_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Easter_Island_wkt)), digits = 6)

geom_ecoregions_Eastern_Philippines_wkt <- st_as_sf(data.frame(wkt = ecoregions_Eastern_Philippines_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Eastern_Philippines_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Eastern_Philippines_wkt)), digits = 6)

geom_ecoregions_Exmouth_wkt <- st_as_sf(data.frame(wkt = ecoregions_Exmouth_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Exmouth_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Exmouth_wkt)), digits = 6)

geom_ecoregions_Fiji_wkt <- st_as_sf(data.frame(wkt = ecoregions_Fiji_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Fiji_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Fiji_wkt)), digits = 6)
geom_ecoregions_Fiji_wkt_1 <- st_as_sf(data.frame(wkt = ecoregions_Fiji_wkt_1), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Fiji_wkt_1 <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Fiji_wkt_1)), digits = 6)
geom_ecoregions_Fiji_wkt_2 <- st_as_sf(data.frame(wkt = ecoregions_Fiji_wkt_2), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Fiji_wkt_2 <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Fiji_wkt_2)), digits = 6)

geom_ecoregions_Gilbert_wkt <- st_as_sf(data.frame(wkt = ecoregions_Gilbert_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Gilbert_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Gilbert_wkt)), digits = 6)
geom_ecoregions_Gilbert_wkt_1 <- st_as_sf(data.frame(wkt = ecoregions_Gilbert_wkt_1), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Gilbert_wkt_1 <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Gilbert_wkt_1)), digits = 6)
geom_ecoregions_Gilbert_wkt_2 <- st_as_sf(data.frame(wkt = ecoregions_Gilbert_wkt_2), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Gilbert_wkt_2 <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Gilbert_wkt_2)), digits = 6)
geom_ecoregions_Gilbert_wkt_3 <- st_as_sf(data.frame(wkt = ecoregions_Gilbert_wkt_3), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Gilbert_wkt_3 <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Gilbert_wkt_3)), digits = 6)

geom_ecoregions_Gulf_of_Papua_wkt <- st_as_sf(data.frame(wkt = ecoregions_Gulf_of_Papua_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Gulf_of_Papua_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Gulf_of_Papua_wkt)), digits = 6)

geom_ecoregions_Gulf_of_Thailand_wkt <- st_as_sf(data.frame(wkt = ecoregions_Gulf_of_Thailand_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Gulf_of_Thailand_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Gulf_of_Thailand_wkt)), digits = 6)

geom_ecoregions_Gulf_of_Tonkin_wkt <- st_as_sf(data.frame(wkt = ecoregions_Gulf_of_Tonkin_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Gulf_of_Tonkin_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Gulf_of_Tonkin_wkt)), digits = 6)

geom_ecoregions_Halmahera_wkt <- st_as_sf(data.frame(wkt = ecoregions_Halmahera_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Halmahera_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Halmahera_wkt)), digits = 6)

geom_ecoregions_Hawaii_wkt <- st_as_sf(data.frame(wkt = ecoregions_Hawaii_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Hawaii_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Hawaii_wkt)), digits = 6)
geom_ecoregions_Hawaii_wkt_1 <- st_as_sf(data.frame(wkt = ecoregions_Hawaii_wkt_1), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Hawaii_wkt_1 <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Hawaii_wkt_1)), digits = 6)
geom_ecoregions_Hawaii_wkt_2 <- st_as_sf(data.frame(wkt = ecoregions_Hawaii_wkt_2), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Hawaii_wkt_2 <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Hawaii_wkt_2)), digits = 6)
geom_ecoregions_Hawaii_wkt_3 <- st_as_sf(data.frame(wkt = ecoregions_Hawaii_wkt_3), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Hawaii_wkt_3 <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Hawaii_wkt_3)), digits = 6)

geom_ecoregions_Lesser_wkt <- st_as_sf(data.frame(wkt = ecoregions_Lesser_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Lesser_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Lesser_wkt)), digits = 6)

geom_ecoregions_Line_wkt <- st_as_sf(data.frame(wkt = ecoregions_Line_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Line_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Line_wkt)), digits = 6)

geom_ecoregions_Lord_wkt <- st_as_sf(data.frame(wkt = ecoregions_Lord_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Lord_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Lord_wkt)), digits = 6)

geom_ecoregions_Malacca_wkt <- st_as_sf(data.frame(wkt = ecoregions_Malacca_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Malacca_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Malacca_wkt)), digits = 6)

geom_ecoregions_Mariana_wkt <- st_as_sf(data.frame(wkt = ecoregions_Mariana_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Mariana_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Mariana_wkt)), digits = 6)

geom_ecoregions_Tuamotus_wkt <- st_as_sf(data.frame(wkt = ecoregions_Tuamotus_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Tuamotus_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Tuamotus_wkt)), digits = 6)

geom_ecoregions_Ningaloo_wkt <- st_as_sf(data.frame(wkt = ecoregions_Ningaloo_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Ningaloo_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Ningaloo_wkt)), digits = 6)

geom_ecoregions_Papua_wkt <- st_as_sf(data.frame(wkt = ecoregions_Papua_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Papua_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Papua_wkt)), digits = 6)

geom_ecoregions_Solomon_Archipelago_wkt <- st_as_sf(data.frame(wkt = ecoregions_Solomon_Archipelago_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Solomon_Archipelago_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Solomon_Archipelago_wkt)), digits = 6)

geom_ecoregions_Solomon_Sea_wkt <- st_as_sf(data.frame(wkt = ecoregions_Solomon_Sea_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Solomon_Sea_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Solomon_Sea_wkt)), digits = 6)

geom_ecoregions_Vanuatu_wkt <- st_as_sf(data.frame(wkt = ecoregions_Vanuatu_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Vanuatu_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Vanuatu_wkt)), digits = 6)

geom_ecoregions_Marquesas_wkt <- st_as_sf(data.frame(wkt = ecoregions_Marquesas_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Marquesas_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Marquesas_wkt)), digits = 6)

geom_ecoregions_Samoa_wkt <- st_as_sf(data.frame(wkt = ecoregions_Samoa_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Samoa_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Samoa_wkt)), digits = 6)

geom_ecoregions_Society_wkt <- st_as_sf(data.frame(wkt = ecoregions_Society_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Society_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Society_wkt)), digits = 6)

geom_ecoregions_Marshall_wkt <- st_as_sf(data.frame(wkt = ecoregions_Marshall_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Marshall_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Marshall_wkt)), digits = 6)

geom_ecoregions_Tonga_wkt <- st_as_sf(data.frame(wkt = ecoregions_Tonga_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Tonga_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Tonga_wkt)), digits = 6)

geom_ecoregions_West_Caroline_wkt <- st_as_sf(data.frame(wkt = ecoregions_West_Caroline_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_West_Caroline_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_West_Caroline_wkt)), digits = 6)

geom_ecoregions_New_Caledonia_wkt <- st_as_sf(data.frame(wkt = ecoregions_New_Caledonia_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_New_Caledonia_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_New_Caledonia_wkt)), digits = 6)

geom_ecoregions_Torres_wkt <- st_as_sf(data.frame(wkt = ecoregions_Torres_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Torres_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Torres_wkt)), digits = 6)

geom_ecoregions_Java_wkt <- st_as_sf(data.frame(wkt = ecoregions_Java_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Java_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Java_wkt)), digits = 6)

geom_ecoregions_Central_Reef_wkt <- st_as_sf(data.frame(wkt = ecoregions_Central_Reef_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Central_Reef_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Central_Reef_wkt)), digits = 6)

geom_ecoregions_Phoenix_wkt <- st_as_sf(data.frame(wkt = ecoregions_Phoenix_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Phoenix_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Phoenix_wkt)), digits = 6)

geom_ecoregions_Palawan_wkt <- st_as_sf(data.frame(wkt = ecoregions_Palawan_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Palawan_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Palawan_wkt)), digits = 6)

geom_ecoregions_Northeast_Sulawesi_wkt <- st_as_sf(data.frame(wkt = ecoregions_Northeast_Sulawesi_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Northeast_Sulawesi_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Northeast_Sulawesi_wkt)), digits = 6)

geom_ecoregions_Sulawesi_wkt <- st_as_sf(data.frame(wkt = ecoregions_Sulawesi_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Sulawesi_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Sulawesi_wkt)), digits = 6)

geom_ecoregions_Rapa_wkt <- st_as_sf(data.frame(wkt = ecoregions_Rapa_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Rapa_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Rapa_wkt)), digits = 6)

geom_ecoregions_Ogasawara_wkt <- st_as_sf(data.frame(wkt = ecoregions_Ogasawara_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Ogasawara_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Ogasawara_wkt)), digits = 6)

geom_ecoregions_Oceanic_wkt <- st_as_sf(data.frame(wkt = ecoregions_Oceanic_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Oceanic_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Oceanic_wkt)), digits = 6)

geom_ecoregions_Kuroshio_wkt <- st_as_sf(data.frame(wkt = ecoregions_Kuroshio_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Kuroshio_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Kuroshio_wkt)), digits = 6)

geom_ecoregions_Southeast_Papua_wkt <- st_as_sf(data.frame(wkt = ecoregions_Southeast_Papua_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Southeast_Papua_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Southeast_Papua_wkt)), digits = 6)

geom_ecoregions_Southern_China_wkt <- st_as_sf(data.frame(wkt = ecoregions_Southern_China_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Southern_China_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Southern_China_wkt)), digits = 6)

geom_ecoregions_Southern_Vietnam_wkt <- st_as_sf(data.frame(wkt = ecoregions_Southern_Vietnam_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Southern_Vietnam_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Southern_Vietnam_wkt)), digits = 6)

geom_ecoregions_Sund_Java_wkt <- st_as_sf(data.frame(wkt = ecoregions_Sund_Java_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Sund_Java_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Sund_Java_wkt)), digits = 6)

geom_ecoregions_Austral_wkt <- st_as_sf(data.frame(wkt = ecoregions_Austral_wkt), wkt = "wkt", crs = 4326) %>% st_make_valid()
bbox_ecoregions_Austral_wkt <- st_as_text(st_as_sfc(st_bbox(geom_ecoregions_Austral_wkt)), digits = 6)

#Save the workspace
save.image(file = "geo_boxes.RData")

################################################################################
################################################################################
################################################################################
