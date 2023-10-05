# ============================================================
'R code for LabEx CORAIL book chapter on fish parasites

Christina Pavloudi
christina.pavloudi@embrc.eu
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
.packages = c("robis", "dplyr")

# Install CRAN packages (if not already installed)
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])

# Load packages into session 
lapply(.packages, require, character.only=TRUE)

packageVersion("robis")
packageVersion("dplyr")

################################################################################
########################### LOAD WORKSPACE #####################################
################################################################################

load(file = "geo_boxes.RData")

################################################################################
################################################################################
################################################################################

################################################################################
############################ TELEOSTEI  ########################################
################################################################################

Teleostei_ecoregions_Arnhem_Coast_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Arnhem_Coast_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Arnhem_Coast_wkt = data.frame(lapply(Teleostei_ecoregions_Arnhem_Coast_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Arnhem_Coast_wkt,"Teleostei_ecoregions_Arnhem_Coast_wkt_raw.csv")

Teleostei_ecoregions_Arafura_Sea_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Arafura_Sea_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Arafura_Sea_wkt = data.frame(lapply(Teleostei_ecoregions_Arafura_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Arafura_Sea_wkt,"Teleostei_ecoregions_Arafura_Sea_wkt_raw.csv")

Teleostei_ecoregions_Banda_Sea_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Banda_Sea_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Banda_Sea_wkt = data.frame(lapply(Teleostei_ecoregions_Banda_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Banda_Sea_wkt,"Teleostei_ecoregions_Banda_Sea_wkt_raw.csv")

Teleostei_ecoregions_Bismarck_Sea_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Bismarck_Sea_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Bismarck_Sea_wkt = data.frame(lapply(Teleostei_ecoregions_Bismarck_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Bismarck_Sea_wkt,"Teleostei_ecoregions_Bismarck_Sea_wkt_raw.csv")

Teleostei_ecoregions_Bonaparte_Coast_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Bonaparte_Coast_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Bonaparte_Coast_wkt = data.frame(lapply(Teleostei_ecoregions_Bonaparte_Coast_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Bonaparte_Coast_wkt,"Teleostei_ecoregions_Bonaparte_Coast_wkt_raw.csv")

Teleostei_ecoregions_Cocos_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Cocos_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Cocos_wkt = data.frame(lapply(Teleostei_ecoregions_Cocos_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Cocos_wkt,"Teleostei_ecoregions_Cocos_wkt_raw.csv")

Teleostei_ecoregions_Coral_Sea_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Coral_Sea_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Coral_Sea_wkt = data.frame(lapply(Teleostei_ecoregions_Coral_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Coral_Sea_wkt,"Teleostei_ecoregions_Coral_Sea_wkt_raw.csv")

Teleostei_ecoregions_East_Caroline_Islands_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_East_Caroline_Islands_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_East_Caroline_Islands_wkt = data.frame(lapply(Teleostei_ecoregions_East_Caroline_Islands_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_East_Caroline_Islands_wkt,"Teleostei_ecoregions_East_Caroline_Islands_wkt_raw.csv")

Teleostei_ecoregions_Easter_Island_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Easter_Island_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Easter_Island_wkt = data.frame(lapply(Teleostei_ecoregions_Easter_Island_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Easter_Island_wkt,"Teleostei_ecoregions_Easter_Island_wkt_raw.csv")

Teleostei_ecoregions_Eastern_Philippines_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Eastern_Philippines_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Eastern_Philippines_wkt = data.frame(lapply(Teleostei_ecoregions_Eastern_Philippines_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Eastern_Philippines_wkt,"Teleostei_ecoregions_Eastern_Philippines_wkt_raw.csv")

Teleostei_ecoregions_Exmouth_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Exmouth_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Exmouth_wkt = data.frame(lapply(Teleostei_ecoregions_Exmouth_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Exmouth_wkt,"Teleostei_ecoregions_Exmouth_wkt_raw.csv")

Teleostei_ecoregions_Fiji_wkt_1 <- occurrence("Teleostei", geometry = bbox_ecoregions_Fiji_wkt_1, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Fiji_wkt_1 = data.frame(lapply(Teleostei_ecoregions_Fiji_wkt_1, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Fiji_wkt_1,"Teleostei_ecoregions_Fiji_wkt_raw_1.csv")

Teleostei_ecoregions_Fiji_wkt_2 <- occurrence("Teleostei", geometry = bbox_ecoregions_Fiji_wkt_2, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Fiji_wkt_2 = data.frame(lapply(Teleostei_ecoregions_Fiji_wkt_2, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Fiji_wkt_2,"Teleostei_ecoregions_Fiji_wkt_raw_2.csv")

Teleostei_ecoregions_Gilbert_wkt_1 <- occurrence("Teleostei", geometry = bbox_ecoregions_Gilbert_wkt_1, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Gilbert_wkt_1 = data.frame(lapply(Teleostei_ecoregions_Gilbert_wkt_1, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Gilbert_wkt_1,"Teleostei_ecoregions_Gilbert_wkt_raw_1.csv")

#Teleostei_ecoregions_Gilbert_wkt_2 <- occurrence("Teleostei", geometry = bbox_ecoregions_Gilbert_wkt_2, mof = TRUE, dna = TRUE)
#Teleostei_ecoregions_Gilbert_wkt_2 = data.frame(lapply(Teleostei_ecoregions_Gilbert_wkt_2, as.character), stringsAsFactors=FALSE)
#write.csv(Teleostei_ecoregions_Gilbert_wkt_2,"Teleostei_ecoregions_Gilbert_wkt_raw_2.csv")

Teleostei_ecoregions_Gilbert_wkt_3 <- occurrence("Teleostei", geometry = bbox_ecoregions_Gilbert_wkt_3, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Gilbert_wkt_3 = data.frame(lapply(Teleostei_ecoregions_Gilbert_wkt_3, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Gilbert_wkt_3,"Teleostei_ecoregions_Gilbert_wkt_raw_3.csv")

Teleostei_ecoregions_Gulf_of_Papua_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Gulf_of_Papua_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Gulf_of_Papua_wkt = data.frame(lapply(Teleostei_ecoregions_Gulf_of_Papua_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Gulf_of_Papua_wkt,"Teleostei_ecoregions_Gulf_of_Papua_wkt_raw.csv")

Teleostei_ecoregions_Gulf_of_Thailand_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Gulf_of_Thailand_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Gulf_of_Thailand_wkt = data.frame(lapply(Teleostei_ecoregions_Gulf_of_Thailand_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Gulf_of_Thailand_wkt,"Teleostei_ecoregions_Gulf_of_Thailand_wkt_raw.csv")

Teleostei_ecoregions_Gulf_of_Tonkin_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Gulf_of_Tonkin_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Gulf_of_Tonkin_wkt = data.frame(lapply(Teleostei_ecoregions_Gulf_of_Tonkin_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Gulf_of_Tonkin_wkt,"Teleostei_ecoregions_Gulf_of_Tonkin_wkt_raw.csv")

Teleostei_ecoregions_Halmahera_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Halmahera_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Halmahera_wkt = data.frame(lapply(Teleostei_ecoregions_Halmahera_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Halmahera_wkt,"Teleostei_ecoregions_Halmahera_wkt_raw.csv")

Teleostei_ecoregions_Hawaii_wkt_1 <- occurrence("Teleostei", geometry = bbox_ecoregions_Hawaii_wkt_1, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Hawaii_wkt_1 = data.frame(lapply(Teleostei_ecoregions_Hawaii_wkt_1, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Hawaii_wkt_1,"Teleostei_ecoregions_Hawaii_wkt_raw_1.csv")

Teleostei_ecoregions_Hawaii_wkt_2 <- occurrence("Teleostei", geometry = bbox_ecoregions_Hawaii_wkt_2, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Hawaii_wkt_2 = data.frame(lapply(Teleostei_ecoregions_Hawaii_wkt_2, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Hawaii_wkt_2,"Teleostei_ecoregions_Hawaii_wkt_raw_2.csv")

Teleostei_ecoregions_Hawaii_wkt_3 <- occurrence("Teleostei", geometry = bbox_ecoregions_Hawaii_wkt_3, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Hawaii_wkt_3 = data.frame(lapply(Teleostei_ecoregions_Hawaii_wkt_3, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Hawaii_wkt_3,"Teleostei_ecoregions_Hawaii_wkt_raw_3.csv")

Teleostei_ecoregions_Lesser_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Lesser_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Lesser_wkt = data.frame(lapply(Teleostei_ecoregions_Lesser_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Lesser_wkt,"Teleostei_ecoregions_Lesser_wkt_raw.csv")

Teleostei_ecoregions_Line_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Line_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Line_wkt = data.frame(lapply(Teleostei_ecoregions_Line_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Line_wkt,"Teleostei_ecoregions_Line_wkt_raw.csv")

Teleostei_ecoregions_Lord_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Lord_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Lord_wkt = data.frame(lapply(Teleostei_ecoregions_Lord_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Lord_wkt,"Teleostei_ecoregions_Lord_wkt_raw.csv")

Teleostei_ecoregions_Malacca_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Malacca_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Malacca_wkt = data.frame(lapply(Teleostei_ecoregions_Malacca_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Malacca_wkt,"Teleostei_ecoregions_Malacca_wkt_raw.csv")

Teleostei_ecoregions_Mariana_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Mariana_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Mariana_wkt = data.frame(lapply(Teleostei_ecoregions_Mariana_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Mariana_wkt,"Teleostei_ecoregions_Mariana_wkt_raw.csv")

Teleostei_ecoregions_Tuamotus_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Tuamotus_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Tuamotus_wkt = data.frame(lapply(Teleostei_ecoregions_Tuamotus_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Tuamotus_wkt,"Teleostei_ecoregions_Tuamotus_wkt_raw.csv")

Teleostei_ecoregions_Ningaloo_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Ningaloo_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Ningaloo_wkt = data.frame(lapply(Teleostei_ecoregions_Ningaloo_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Ningaloo_wkt,"Teleostei_ecoregions_Ningaloo_wkt_raw.csv")

Teleostei_ecoregions_Papua_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Papua_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Papua_wkt = data.frame(lapply(Teleostei_ecoregions_Papua_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Papua_wkt,"Teleostei_ecoregions_Papua_wkt_raw.csv")

Teleostei_ecoregions_Solomon_Archipelago_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Solomon_Archipelago_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Solomon_Archipelago_wkt = data.frame(lapply(Teleostei_ecoregions_Solomon_Archipelago_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Solomon_Archipelago_wkt,"Teleostei_ecoregions_Solomon_Archipelago_wkt_raw.csv")

Teleostei_ecoregions_Solomon_Sea_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Solomon_Sea_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Solomon_Sea_wkt = data.frame(lapply(Teleostei_ecoregions_Solomon_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Solomon_Sea_wkt,"Teleostei_ecoregions_Solomon_Sea_wkt_raw.csv")

Teleostei_ecoregions_Vanuatu_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Vanuatu_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Vanuatu_wkt = data.frame(lapply(Teleostei_ecoregions_Vanuatu_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Vanuatu_wkt,"Teleostei_ecoregions_Vanuatu_wkt_raw.csv")

Teleostei_ecoregions_Marquesas_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Marquesas_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Marquesas_wkt = data.frame(lapply(Teleostei_ecoregions_Marquesas_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Marquesas_wkt,"Teleostei_ecoregions_Marquesas_wkt_raw.csv")

Teleostei_ecoregions_Samoa_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Samoa_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Samoa_wkt = data.frame(lapply(Teleostei_ecoregions_Samoa_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Samoa_wkt,"Teleostei_ecoregions_Samoa_wkt_raw.csv")

Teleostei_ecoregions_Society_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Society_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Society_wkt = data.frame(lapply(Teleostei_ecoregions_Society_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Society_wkt,"Teleostei_ecoregions_Society_wkt_raw.csv")

Teleostei_ecoregions_Marshall_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Marshall_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Marshall_wkt = data.frame(lapply(Teleostei_ecoregions_Marshall_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Marshall_wkt,"Teleostei_ecoregions_Marshall_wkt_raw.csv")

Teleostei_ecoregions_Tonga_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Tonga_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Tonga_wkt = data.frame(lapply(Teleostei_ecoregions_Tonga_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Tonga_wkt,"Teleostei_ecoregions_Tonga_wkt_raw.csv")

Teleostei_ecoregions_West_Caroline_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_West_Caroline_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_West_Caroline_wkt = data.frame(lapply(Teleostei_ecoregions_West_Caroline_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_West_Caroline_wkt,"Teleostei_ecoregions_West_Caroline_wkt_raw.csv")

Teleostei_ecoregions_New_Caledonia_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_New_Caledonia_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_New_Caledonia_wkt = data.frame(lapply(Teleostei_ecoregions_New_Caledonia_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_New_Caledonia_wkt,"Teleostei_ecoregions_New_Caledonia_wkt_raw.csv")

Teleostei_ecoregions_Torres_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Torres_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Torres_wkt = data.frame(lapply(Teleostei_ecoregions_Torres_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Torres_wkt,"Teleostei_ecoregions_Torres_wkt_raw.csv")

Teleostei_ecoregions_Java_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Java_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Java_wkt = data.frame(lapply(Teleostei_ecoregions_Java_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Java_wkt,"Teleostei_ecoregions_Java_wkt_raw.csv")

Teleostei_ecoregions_Central_Reef_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Central_Reef_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Central_Reef_wkt = data.frame(lapply(Teleostei_ecoregions_Central_Reef_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Central_Reef_wkt,"Teleostei_ecoregions_Central_Reef_wkt_raw.csv")

Teleostei_ecoregions_Phoenix_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Phoenix_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Phoenix_wkt = data.frame(lapply(Teleostei_ecoregions_Phoenix_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Phoenix_wkt,"Teleostei_ecoregions_Phoenix_wkt_raw.csv")

Teleostei_ecoregions_Palawan_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Palawan_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Palawan_wkt = data.frame(lapply(Teleostei_ecoregions_Palawan_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Palawan_wkt,"Teleostei_ecoregions_Palawan_wkt_raw.csv")

Teleostei_ecoregions_Northeast_Sulawesi_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Northeast_Sulawesi_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Northeast_Sulawesi_wkt = data.frame(lapply(Teleostei_ecoregions_Northeast_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Northeast_Sulawesi_wkt,"Teleostei_ecoregions_Northeast_Sulawesi_wkt_raw.csv")

Teleostei_ecoregions_Sulawesi_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Sulawesi_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Sulawesi_wkt = data.frame(lapply(Teleostei_ecoregions_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Sulawesi_wkt,"Teleostei_ecoregions_Sulawesi_wkt_raw.csv")

Teleostei_ecoregions_Rapa_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Rapa_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Rapa_wkt = data.frame(lapply(Teleostei_ecoregions_Rapa_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Rapa_wkt,"Teleostei_ecoregions_Rapa_wkt_raw.csv")

Teleostei_ecoregions_Ogasawara_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Ogasawara_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Ogasawara_wkt = data.frame(lapply(Teleostei_ecoregions_Ogasawara_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Ogasawara_wkt,"Teleostei_ecoregions_Ogasawara_wkt_raw.csv")

Teleostei_ecoregions_Oceanic_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Oceanic_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Oceanic_wkt = data.frame(lapply(Teleostei_ecoregions_Oceanic_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Oceanic_wkt,"Teleostei_ecoregions_Oceanic_wkt_raw.csv")

Teleostei_ecoregions_Kuroshio_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Kuroshio_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Kuroshio_wkt = data.frame(lapply(Teleostei_ecoregions_Kuroshio_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Kuroshio_wkt,"Teleostei_ecoregions_Kuroshio_wkt_raw.csv")

Teleostei_ecoregions_Southeast_Papua_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Southeast_Papua_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Southeast_Papua_wkt = data.frame(lapply(Teleostei_ecoregions_Southeast_Papua_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Southeast_Papua_wkt,"Teleostei_ecoregions_Southeast_Papua_wkt_raw.csv")

Teleostei_ecoregions_Southern_China_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Southern_China_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Southern_China_wkt = data.frame(lapply(Teleostei_ecoregions_Southern_China_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Southern_China_wkt,"Teleostei_ecoregions_Southern_China_wkt_raw.csv")

Teleostei_ecoregions_Southern_Vietnam_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Southern_Vietnam_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Southern_Vietnam_wkt = data.frame(lapply(Teleostei_ecoregions_Southern_Vietnam_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Southern_Vietnam_wkt,"Teleostei_ecoregions_Southern_Vietnam_wkt_raw.csv")

Teleostei_ecoregions_Sund_Java_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Sund_Java_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Sund_Java_wkt = data.frame(lapply(Teleostei_ecoregions_Sund_Java_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Sund_Java_wkt,"Teleostei_ecoregions_Sund_Java_wkt_raw.csv")

Teleostei_ecoregions_Austral_wkt <- occurrence("Teleostei", geometry = bbox_ecoregions_Austral_wkt, mof = TRUE, dna = TRUE)
Teleostei_ecoregions_Austral_wkt = data.frame(lapply(Teleostei_ecoregions_Austral_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Teleostei_ecoregions_Austral_wkt,"Teleostei_ecoregions_Austral_wkt_raw.csv")

################################################################################
################################### HOLOSTEI  ##################################
################################################################################

# Holostei_ecoregions_Arnhem_Coast_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Arnhem_Coast_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Arnhem_Coast_wkt = data.frame(lapply(Holostei_ecoregions_Arnhem_Coast_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Arnhem_Coast_wkt,"Holostei_ecoregions_Arnhem_Coast_wkt_raw.csv")

# Holostei_ecoregions_Arafura_Sea_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Arafura_Sea_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Arafura_Sea_wkt = data.frame(lapply(Holostei_ecoregions_Arafura_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Arafura_Sea_wkt,"Holostei_ecoregions_Arafura_Sea_wkt_raw.csv")

# Holostei_ecoregions_Banda_Sea_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Banda_Sea_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Banda_Sea_wkt = data.frame(lapply(Holostei_ecoregions_Banda_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Banda_Sea_wkt,"Holostei_ecoregions_Banda_Sea_wkt_raw.csv")

# Holostei_ecoregions_Bismarck_Sea_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Bismarck_Sea_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Bismarck_Sea_wkt = data.frame(lapply(Holostei_ecoregions_Bismarck_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Bismarck_Sea_wkt,"Holostei_ecoregions_Bismarck_Sea_wkt_raw.csv")
# 
# Holostei_ecoregions_Bonaparte_Coast_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Bonaparte_Coast_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Bonaparte_Coast_wkt = data.frame(lapply(Holostei_ecoregions_Bonaparte_Coast_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Bonaparte_Coast_wkt,"Holostei_ecoregions_Bonaparte_Coast_wkt_raw.csv")
# 
# Holostei_ecoregions_Cocos_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Cocos_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Cocos_wkt = data.frame(lapply(Holostei_ecoregions_Cocos_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Cocos_wkt,"Holostei_ecoregions_Cocos_wkt_raw.csv")
# 
# Holostei_ecoregions_Coral_Sea_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Coral_Sea_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Coral_Sea_wkt = data.frame(lapply(Holostei_ecoregions_Coral_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Coral_Sea_wkt,"Holostei_ecoregions_Coral_Sea_wkt_raw.csv")
# 
# Holostei_ecoregions_East_Caroline_Islands_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_East_Caroline_Islands_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_East_Caroline_Islands_wkt = data.frame(lapply(Holostei_ecoregions_East_Caroline_Islands_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_East_Caroline_Islands_wkt,"Holostei_ecoregions_East_Caroline_Islands_wkt_raw.csv")
# 
# Holostei_ecoregions_Easter_Island_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Easter_Island_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Easter_Island_wkt = data.frame(lapply(Holostei_ecoregions_Easter_Island_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Easter_Island_wkt,"Holostei_ecoregions_Easter_Island_wkt_raw.csv")
# 
# Holostei_ecoregions_Eastern_Philippines_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Eastern_Philippines_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Eastern_Philippines_wkt = data.frame(lapply(Holostei_ecoregions_Eastern_Philippines_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Eastern_Philippines_wkt,"Holostei_ecoregions_Eastern_Philippines_wkt_raw.csv")
# 
# Holostei_ecoregions_Exmouth_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Exmouth_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Exmouth_wkt = data.frame(lapply(Holostei_ecoregions_Exmouth_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Exmouth_wkt,"Holostei_ecoregions_Exmouth_wkt_raw.csv")
# 
# Holostei_ecoregions_Fiji_wkt_1 <- occurrence("Holostei", geometry = bbox_ecoregions_Fiji_wkt_1, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Fiji_wkt_1 = data.frame(lapply(Holostei_ecoregions_Fiji_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Fiji_wkt_1,"Holostei_ecoregions_Fiji_wkt_raw_1.csv")
# 
# Holostei_ecoregions_Fiji_wkt_2 <- occurrence("Holostei", geometry = bbox_ecoregions_Fiji_wkt_2, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Fiji_wkt_2 = data.frame(lapply(Holostei_ecoregions_Fiji_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Fiji_wkt_2,"Holostei_ecoregions_Fiji_wkt_raw_2.csv")
# 
# Holostei_ecoregions_Gilbert_wkt_1 <- occurrence("Holostei", geometry = bbox_ecoregions_Gilbert_wkt_1, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Gilbert_wkt_1 = data.frame(lapply(Holostei_ecoregions_Gilbert_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Gilbert_wkt_1,"Holostei_ecoregions_Gilbert_wkt_raw_1.csv")
# 
# Holostei_ecoregions_Gilbert_wkt_2 <- occurrence("Holostei", geometry = bbox_ecoregions_Gilbert_wkt_2, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Gilbert_wkt_2 = data.frame(lapply(Holostei_ecoregions_Gilbert_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Gilbert_wkt_2,"Holostei_ecoregions_Gilbert_wkt_raw_2.csv")
# 
# Holostei_ecoregions_Gilbert_wkt_3 <- occurrence("Holostei", geometry = bbox_ecoregions_Gilbert_wkt_3, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Gilbert_wkt_3 = data.frame(lapply(Holostei_ecoregions_Gilbert_wkt_3, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Gilbert_wkt_3,"Holostei_ecoregions_Gilbert_wkt_raw_3.csv")
# 
# Holostei_ecoregions_Gulf_of_Papua_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Gulf_of_Papua_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Gulf_of_Papua_wkt = data.frame(lapply(Holostei_ecoregions_Gulf_of_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Gulf_of_Papua_wkt,"Holostei_ecoregions_Gulf_of_Papua_wkt_raw.csv")
# 
# Holostei_ecoregions_Gulf_of_Thailand_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Gulf_of_Thailand_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Gulf_of_Thailand_wkt = data.frame(lapply(Holostei_ecoregions_Gulf_of_Thailand_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Gulf_of_Thailand_wkt,"Holostei_ecoregions_Gulf_of_Thailand_wkt_raw.csv")
# 
# Holostei_ecoregions_Gulf_of_Tonkin_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Gulf_of_Tonkin_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Gulf_of_Tonkin_wkt = data.frame(lapply(Holostei_ecoregions_Gulf_of_Tonkin_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Gulf_of_Tonkin_wkt,"Holostei_ecoregions_Gulf_of_Tonkin_wkt_raw.csv")
# 
# Holostei_ecoregions_Halmahera_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Halmahera_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Halmahera_wkt = data.frame(lapply(Holostei_ecoregions_Halmahera_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Halmahera_wkt,"Holostei_ecoregions_Halmahera_wkt_raw.csv")
# 
# Holostei_ecoregions_Hawaii_wkt_1 <- occurrence("Holostei", geometry = bbox_ecoregions_Hawaii_wkt_1, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Hawaii_wkt_1 = data.frame(lapply(Holostei_ecoregions_Hawaii_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Hawaii_wkt_1,"Holostei_ecoregions_Hawaii_wkt_raw_1.csv")
# 
# Holostei_ecoregions_Hawaii_wkt_2 <- occurrence("Holostei", geometry = bbox_ecoregions_Hawaii_wkt_2, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Hawaii_wkt_2 = data.frame(lapply(Holostei_ecoregions_Hawaii_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Hawaii_wkt_2,"Holostei_ecoregions_Hawaii_wkt_raw_2.csv")
# 
# Holostei_ecoregions_Hawaii_wkt_3 <- occurrence("Holostei", geometry = bbox_ecoregions_Hawaii_wkt_3, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Hawaii_wkt_3 = data.frame(lapply(Holostei_ecoregions_Hawaii_wkt_3, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Hawaii_wkt_3,"Holostei_ecoregions_Hawaii_wkt_raw_3.csv")
# 
# Holostei_ecoregions_Lesser_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Lesser_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Lesser_wkt = data.frame(lapply(Holostei_ecoregions_Lesser_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Lesser_wkt,"Holostei_ecoregions_Lesser_wkt_raw.csv")
# 
# Holostei_ecoregions_Line_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Line_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Line_wkt = data.frame(lapply(Holostei_ecoregions_Line_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Line_wkt,"Holostei_ecoregions_Line_wkt_raw.csv")
# 
# Holostei_ecoregions_Lord_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Lord_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Lord_wkt = data.frame(lapply(Holostei_ecoregions_Lord_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Lord_wkt,"Holostei_ecoregions_Lord_wkt_raw.csv")
# 
# Holostei_ecoregions_Malacca_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Malacca_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Malacca_wkt = data.frame(lapply(Holostei_ecoregions_Malacca_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Malacca_wkt,"Holostei_ecoregions_Malacca_wkt_raw.csv")
# 
# Holostei_ecoregions_Mariana_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Mariana_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Mariana_wkt = data.frame(lapply(Holostei_ecoregions_Mariana_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Mariana_wkt,"Holostei_ecoregions_Mariana_wkt_raw.csv")
# 
# Holostei_ecoregions_Tuamotus_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Tuamotus_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Tuamotus_wkt = data.frame(lapply(Holostei_ecoregions_Tuamotus_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Tuamotus_wkt,"Holostei_ecoregions_Tuamotus_wkt_raw.csv")
# 
# Holostei_ecoregions_Ningaloo_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Ningaloo_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Ningaloo_wkt = data.frame(lapply(Holostei_ecoregions_Ningaloo_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Ningaloo_wkt,"Holostei_ecoregions_Ningaloo_wkt_raw.csv")
# 
# Holostei_ecoregions_Papua_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Papua_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Papua_wkt = data.frame(lapply(Holostei_ecoregions_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Papua_wkt,"Holostei_ecoregions_Papua_wkt_raw.csv")
# 
# Holostei_ecoregions_Solomon_Archipelago_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Solomon_Archipelago_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Solomon_Archipelago_wkt = data.frame(lapply(Holostei_ecoregions_Solomon_Archipelago_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Solomon_Archipelago_wkt,"Holostei_ecoregions_Solomon_Archipelago_wkt_raw.csv")
# 
# Holostei_ecoregions_Solomon_Sea_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Solomon_Sea_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Solomon_Sea_wkt = data.frame(lapply(Holostei_ecoregions_Solomon_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Solomon_Sea_wkt,"Holostei_ecoregions_Solomon_Sea_wkt_raw.csv")
# 
# Holostei_ecoregions_Vanuatu_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Vanuatu_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Vanuatu_wkt = data.frame(lapply(Holostei_ecoregions_Vanuatu_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Vanuatu_wkt,"Holostei_ecoregions_Vanuatu_wkt_raw.csv")
# 
# Holostei_ecoregions_Marquesas_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Marquesas_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Marquesas_wkt = data.frame(lapply(Holostei_ecoregions_Marquesas_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Marquesas_wkt,"Holostei_ecoregions_Marquesas_wkt_raw.csv")
# 
# Holostei_ecoregions_Samoa_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Samoa_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Samoa_wkt = data.frame(lapply(Holostei_ecoregions_Samoa_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Samoa_wkt,"Holostei_ecoregions_Samoa_wkt_raw.csv")
# 
# Holostei_ecoregions_Society_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Society_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Society_wkt = data.frame(lapply(Holostei_ecoregions_Society_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Society_wkt,"Holostei_ecoregions_Society_wkt_raw.csv")
# 
# Holostei_ecoregions_Marshall_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Marshall_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Marshall_wkt = data.frame(lapply(Holostei_ecoregions_Marshall_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Marshall_wkt,"Holostei_ecoregions_Marshall_wkt_raw.csv")
# 
# Holostei_ecoregions_Tonga_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Tonga_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Tonga_wkt = data.frame(lapply(Holostei_ecoregions_Tonga_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Tonga_wkt,"Holostei_ecoregions_Tonga_wkt_raw.csv")
# 
# Holostei_ecoregions_West_Caroline_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_West_Caroline_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_West_Caroline_wkt = data.frame(lapply(Holostei_ecoregions_West_Caroline_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_West_Caroline_wkt,"Holostei_ecoregions_West_Caroline_wkt_raw.csv")
# 
# Holostei_ecoregions_New_Caledonia_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_New_Caledonia_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_New_Caledonia_wkt = data.frame(lapply(Holostei_ecoregions_New_Caledonia_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_New_Caledonia_wkt,"Holostei_ecoregions_New_Caledonia_wkt_raw.csv")
# 
# Holostei_ecoregions_Torres_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Torres_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Torres_wkt = data.frame(lapply(Holostei_ecoregions_Torres_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Torres_wkt,"Holostei_ecoregions_Torres_wkt_raw.csv")
# 
# Holostei_ecoregions_Java_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Java_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Java_wkt = data.frame(lapply(Holostei_ecoregions_Java_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Java_wkt,"Holostei_ecoregions_Java_wkt_raw.csv")
# 
# Holostei_ecoregions_Central_Reef_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Central_Reef_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Central_Reef_wkt = data.frame(lapply(Holostei_ecoregions_Central_Reef_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Central_Reef_wkt,"Holostei_ecoregions_Central_Reef_wkt_raw.csv")
# 
# Holostei_ecoregions_Phoenix_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Phoenix_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Phoenix_wkt = data.frame(lapply(Holostei_ecoregions_Phoenix_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Phoenix_wkt,"Holostei_ecoregions_Phoenix_wkt_raw.csv")
# 
# Holostei_ecoregions_Palawan_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Palawan_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Palawan_wkt = data.frame(lapply(Holostei_ecoregions_Palawan_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Palawan_wkt,"Holostei_ecoregions_Palawan_wkt_raw.csv")
# 
# Holostei_ecoregions_Northeast_Sulawesi_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Northeast_Sulawesi_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Northeast_Sulawesi_wkt = data.frame(lapply(Holostei_ecoregions_Northeast_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Northeast_Sulawesi_wkt,"Holostei_ecoregions_Northeast_Sulawesi_wkt_raw.csv")
# 
# Holostei_ecoregions_Sulawesi_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Sulawesi_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Sulawesi_wkt = data.frame(lapply(Holostei_ecoregions_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Sulawesi_wkt,"Holostei_ecoregions_Sulawesi_wkt_raw.csv")
# 
# Holostei_ecoregions_Rapa_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Rapa_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Rapa_wkt = data.frame(lapply(Holostei_ecoregions_Rapa_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Rapa_wkt,"Holostei_ecoregions_Rapa_wkt_raw.csv")
# 
# Holostei_ecoregions_Ogasawara_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Ogasawara_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Ogasawara_wkt = data.frame(lapply(Holostei_ecoregions_Ogasawara_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Ogasawara_wkt,"Holostei_ecoregions_Ogasawara_wkt_raw.csv")
# 
# Holostei_ecoregions_Oceanic_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Oceanic_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Oceanic_wkt = data.frame(lapply(Holostei_ecoregions_Oceanic_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Oceanic_wkt,"Holostei_ecoregions_Oceanic_wkt_raw.csv")
# 
# Holostei_ecoregions_Kuroshio_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Kuroshio_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Kuroshio_wkt = data.frame(lapply(Holostei_ecoregions_Kuroshio_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Kuroshio_wkt,"Holostei_ecoregions_Kuroshio_wkt_raw.csv")
# 
# Holostei_ecoregions_Southeast_Papua_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Southeast_Papua_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Southeast_Papua_wkt = data.frame(lapply(Holostei_ecoregions_Southeast_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Southeast_Papua_wkt,"Holostei_ecoregions_Southeast_Papua_wkt_raw.csv")
# 
# Holostei_ecoregions_Southern_China_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Southern_China_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Southern_China_wkt = data.frame(lapply(Holostei_ecoregions_Southern_China_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Southern_China_wkt,"Holostei_ecoregions_Southern_China_wkt_raw.csv")
# 
# Holostei_ecoregions_Southern_Vietnam_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Southern_Vietnam_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Southern_Vietnam_wkt = data.frame(lapply(Holostei_ecoregions_Southern_Vietnam_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Southern_Vietnam_wkt,"Holostei_ecoregions_Southern_Vietnam_wkt_raw.csv")
# 
# Holostei_ecoregions_Sund_Java_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Sund_Java_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Sund_Java_wkt = data.frame(lapply(Holostei_ecoregions_Sund_Java_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Sund_Java_wkt,"Holostei_ecoregions_Sund_Java_wkt_raw.csv")
# 
# Holostei_ecoregions_Austral_wkt <- occurrence("Holostei", geometry = bbox_ecoregions_Austral_wkt, mof = TRUE, dna = TRUE)
# Holostei_ecoregions_Austral_wkt = data.frame(lapply(Holostei_ecoregions_Austral_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holostei_ecoregions_Austral_wkt,"Holostei_ecoregions_Austral_wkt_raw.csv")

################################################################################
############################## ELASMOBRANCHII  #################################
################################################################################

Elasmobranchii_ecoregions_Arnhem_Coast_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Arnhem_Coast_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Arnhem_Coast_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Arnhem_Coast_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Arnhem_Coast_wkt,"Elasmobranchii_ecoregions_Arnhem_Coast_wkt_raw.csv")

Elasmobranchii_ecoregions_Arafura_Sea_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Arafura_Sea_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Arafura_Sea_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Arafura_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Arafura_Sea_wkt,"Elasmobranchii_ecoregions_Arafura_Sea_wkt_raw.csv")

Elasmobranchii_ecoregions_Banda_Sea_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Banda_Sea_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Banda_Sea_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Banda_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Banda_Sea_wkt,"Elasmobranchii_ecoregions_Banda_Sea_wkt_raw.csv")

Elasmobranchii_ecoregions_Bismarck_Sea_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Bismarck_Sea_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Bismarck_Sea_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Bismarck_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Bismarck_Sea_wkt,"Elasmobranchii_ecoregions_Bismarck_Sea_wkt_raw.csv")

Elasmobranchii_ecoregions_Bonaparte_Coast_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Bonaparte_Coast_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Bonaparte_Coast_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Bonaparte_Coast_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Bonaparte_Coast_wkt,"Elasmobranchii_ecoregions_Bonaparte_Coast_wkt_raw.csv")

Elasmobranchii_ecoregions_Cocos_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Cocos_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Cocos_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Cocos_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Cocos_wkt,"Elasmobranchii_ecoregions_Cocos_wkt_raw.csv")

Elasmobranchii_ecoregions_Coral_Sea_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Coral_Sea_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Coral_Sea_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Coral_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Coral_Sea_wkt,"Elasmobranchii_ecoregions_Coral_Sea_wkt_raw.csv")

Elasmobranchii_ecoregions_East_Caroline_Islands_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_East_Caroline_Islands_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_East_Caroline_Islands_wkt = data.frame(lapply(Elasmobranchii_ecoregions_East_Caroline_Islands_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_East_Caroline_Islands_wkt,"Elasmobranchii_ecoregions_East_Caroline_Islands_wkt_raw.csv")

Elasmobranchii_ecoregions_Easter_Island_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Easter_Island_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Easter_Island_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Easter_Island_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Easter_Island_wkt,"Elasmobranchii_ecoregions_Easter_Island_wkt_raw.csv")

Elasmobranchii_ecoregions_Eastern_Philippines_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Eastern_Philippines_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Eastern_Philippines_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Eastern_Philippines_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Eastern_Philippines_wkt,"Elasmobranchii_ecoregions_Eastern_Philippines_wkt_raw.csv")

Elasmobranchii_ecoregions_Exmouth_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Exmouth_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Exmouth_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Exmouth_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Exmouth_wkt,"Elasmobranchii_ecoregions_Exmouth_wkt_raw.csv")

Elasmobranchii_ecoregions_Fiji_wkt_1 <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Fiji_wkt_1, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Fiji_wkt_1 = data.frame(lapply(Elasmobranchii_ecoregions_Fiji_wkt_1, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Fiji_wkt_1,"Elasmobranchii_ecoregions_Fiji_wkt_raw_1.csv")

Elasmobranchii_ecoregions_Fiji_wkt_2 <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Fiji_wkt_2, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Fiji_wkt_2 = data.frame(lapply(Elasmobranchii_ecoregions_Fiji_wkt_2, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Fiji_wkt_2,"Elasmobranchii_ecoregions_Fiji_wkt_raw_2.csv")

Elasmobranchii_ecoregions_Gilbert_wkt_1 <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Gilbert_wkt_1, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Gilbert_wkt_1 = data.frame(lapply(Elasmobranchii_ecoregions_Gilbert_wkt_1, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Gilbert_wkt_1,"Elasmobranchii_ecoregions_Gilbert_wkt_raw_1.csv")

#Elasmobranchii_ecoregions_Gilbert_wkt_2 <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Gilbert_wkt_2, mof = TRUE, dna = TRUE)
#Elasmobranchii_ecoregions_Gilbert_wkt_2 = data.frame(lapply(Elasmobranchii_ecoregions_Gilbert_wkt_2, as.character), stringsAsFactors=FALSE)
#write.csv(Elasmobranchii_ecoregions_Gilbert_wkt_2,"Elasmobranchii_ecoregions_Gilbert_wkt_raw_2.csv")

Elasmobranchii_ecoregions_Gilbert_wkt_3 <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Gilbert_wkt_3, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Gilbert_wkt_3 = data.frame(lapply(Elasmobranchii_ecoregions_Gilbert_wkt_3, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Gilbert_wkt_3,"Elasmobranchii_ecoregions_Gilbert_wkt_raw_3.csv")

Elasmobranchii_ecoregions_Gulf_of_Papua_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Gulf_of_Papua_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Gulf_of_Papua_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Gulf_of_Papua_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Gulf_of_Papua_wkt,"Elasmobranchii_ecoregions_Gulf_of_Papua_wkt_raw.csv")

Elasmobranchii_ecoregions_Gulf_of_Thailand_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Gulf_of_Thailand_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Gulf_of_Thailand_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Gulf_of_Thailand_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Gulf_of_Thailand_wkt,"Elasmobranchii_ecoregions_Gulf_of_Thailand_wkt_raw.csv")

Elasmobranchii_ecoregions_Gulf_of_Tonkin_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Gulf_of_Tonkin_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Gulf_of_Tonkin_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Gulf_of_Tonkin_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Gulf_of_Tonkin_wkt,"Elasmobranchii_ecoregions_Gulf_of_Tonkin_wkt_raw.csv")

Elasmobranchii_ecoregions_Halmahera_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Halmahera_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Halmahera_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Halmahera_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Halmahera_wkt,"Elasmobranchii_ecoregions_Halmahera_wkt_raw.csv")

Elasmobranchii_ecoregions_Hawaii_wkt_1 <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Hawaii_wkt_1, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Hawaii_wkt_1 = data.frame(lapply(Elasmobranchii_ecoregions_Hawaii_wkt_1, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Hawaii_wkt_1,"Elasmobranchii_ecoregions_Hawaii_wkt_raw_1.csv")

Elasmobranchii_ecoregions_Hawaii_wkt_2 <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Hawaii_wkt_2, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Hawaii_wkt_2 = data.frame(lapply(Elasmobranchii_ecoregions_Hawaii_wkt_2, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Hawaii_wkt_2,"Elasmobranchii_ecoregions_Hawaii_wkt_raw_2.csv")

Elasmobranchii_ecoregions_Hawaii_wkt_3 <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Hawaii_wkt_3, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Hawaii_wkt_3 = data.frame(lapply(Elasmobranchii_ecoregions_Hawaii_wkt_3, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Hawaii_wkt_3,"Elasmobranchii_ecoregions_Hawaii_wkt_raw_3.csv")

Elasmobranchii_ecoregions_Lesser_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Lesser_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Lesser_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Lesser_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Lesser_wkt,"Elasmobranchii_ecoregions_Lesser_wkt_raw.csv")

Elasmobranchii_ecoregions_Line_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Line_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Line_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Line_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Line_wkt,"Elasmobranchii_ecoregions_Line_wkt_raw.csv")

Elasmobranchii_ecoregions_Lord_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Lord_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Lord_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Lord_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Lord_wkt,"Elasmobranchii_ecoregions_Lord_wkt_raw.csv")

Elasmobranchii_ecoregions_Malacca_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Malacca_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Malacca_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Malacca_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Malacca_wkt,"Elasmobranchii_ecoregions_Malacca_wkt_raw.csv")

Elasmobranchii_ecoregions_Mariana_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Mariana_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Mariana_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Mariana_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Mariana_wkt,"Elasmobranchii_ecoregions_Mariana_wkt_raw.csv")

Elasmobranchii_ecoregions_Tuamotus_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Tuamotus_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Tuamotus_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Tuamotus_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Tuamotus_wkt,"Elasmobranchii_ecoregions_Tuamotus_wkt_raw.csv")

Elasmobranchii_ecoregions_Ningaloo_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Ningaloo_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Ningaloo_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Ningaloo_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Ningaloo_wkt,"Elasmobranchii_ecoregions_Ningaloo_wkt_raw.csv")

Elasmobranchii_ecoregions_Papua_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Papua_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Papua_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Papua_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Papua_wkt,"Elasmobranchii_ecoregions_Papua_wkt_raw.csv")

Elasmobranchii_ecoregions_Solomon_Archipelago_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Solomon_Archipelago_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Solomon_Archipelago_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Solomon_Archipelago_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Solomon_Archipelago_wkt,"Elasmobranchii_ecoregions_Solomon_Archipelago_wkt_raw.csv")

Elasmobranchii_ecoregions_Solomon_Sea_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Solomon_Sea_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Solomon_Sea_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Solomon_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Solomon_Sea_wkt,"Elasmobranchii_ecoregions_Solomon_Sea_wkt_raw.csv")

Elasmobranchii_ecoregions_Vanuatu_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Vanuatu_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Vanuatu_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Vanuatu_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Vanuatu_wkt,"Elasmobranchii_ecoregions_Vanuatu_wkt_raw.csv")

Elasmobranchii_ecoregions_Marquesas_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Marquesas_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Marquesas_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Marquesas_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Marquesas_wkt,"Elasmobranchii_ecoregions_Marquesas_wkt_raw.csv")

Elasmobranchii_ecoregions_Samoa_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Samoa_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Samoa_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Samoa_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Samoa_wkt,"Elasmobranchii_ecoregions_Samoa_wkt_raw.csv")

Elasmobranchii_ecoregions_Society_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Society_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Society_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Society_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Society_wkt,"Elasmobranchii_ecoregions_Society_wkt_raw.csv")

Elasmobranchii_ecoregions_Marshall_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Marshall_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Marshall_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Marshall_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Marshall_wkt,"Elasmobranchii_ecoregions_Marshall_wkt_raw.csv")

Elasmobranchii_ecoregions_Tonga_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Tonga_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Tonga_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Tonga_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Tonga_wkt,"Elasmobranchii_ecoregions_Tonga_wkt_raw.csv")

Elasmobranchii_ecoregions_West_Caroline_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_West_Caroline_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_West_Caroline_wkt = data.frame(lapply(Elasmobranchii_ecoregions_West_Caroline_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_West_Caroline_wkt,"Elasmobranchii_ecoregions_West_Caroline_wkt_raw.csv")

Elasmobranchii_ecoregions_New_Caledonia_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_New_Caledonia_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_New_Caledonia_wkt = data.frame(lapply(Elasmobranchii_ecoregions_New_Caledonia_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_New_Caledonia_wkt,"Elasmobranchii_ecoregions_New_Caledonia_wkt_raw.csv")

Elasmobranchii_ecoregions_Torres_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Torres_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Torres_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Torres_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Torres_wkt,"Elasmobranchii_ecoregions_Torres_wkt_raw.csv")

Elasmobranchii_ecoregions_Java_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Java_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Java_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Java_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Java_wkt,"Elasmobranchii_ecoregions_Java_wkt_raw.csv")

Elasmobranchii_ecoregions_Central_Reef_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Central_Reef_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Central_Reef_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Central_Reef_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Central_Reef_wkt,"Elasmobranchii_ecoregions_Central_Reef_wkt_raw.csv")

Elasmobranchii_ecoregions_Phoenix_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Phoenix_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Phoenix_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Phoenix_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Phoenix_wkt,"Elasmobranchii_ecoregions_Phoenix_wkt_raw.csv")

Elasmobranchii_ecoregions_Palawan_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Palawan_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Palawan_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Palawan_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Palawan_wkt,"Elasmobranchii_ecoregions_Palawan_wkt_raw.csv")

Elasmobranchii_ecoregions_Northeast_Sulawesi_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Northeast_Sulawesi_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Northeast_Sulawesi_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Northeast_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Northeast_Sulawesi_wkt,"Elasmobranchii_ecoregions_Northeast_Sulawesi_wkt_raw.csv")

Elasmobranchii_ecoregions_Sulawesi_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Sulawesi_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Sulawesi_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Sulawesi_wkt,"Elasmobranchii_ecoregions_Sulawesi_wkt_raw.csv")

Elasmobranchii_ecoregions_Rapa_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Rapa_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Rapa_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Rapa_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Rapa_wkt,"Elasmobranchii_ecoregions_Rapa_wkt_raw.csv")

Elasmobranchii_ecoregions_Ogasawara_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Ogasawara_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Ogasawara_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Ogasawara_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Ogasawara_wkt,"Elasmobranchii_ecoregions_Ogasawara_wkt_raw.csv")

Elasmobranchii_ecoregions_Oceanic_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Oceanic_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Oceanic_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Oceanic_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Oceanic_wkt,"Elasmobranchii_ecoregions_Oceanic_wkt_raw.csv")

Elasmobranchii_ecoregions_Kuroshio_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Kuroshio_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Kuroshio_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Kuroshio_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Kuroshio_wkt,"Elasmobranchii_ecoregions_Kuroshio_wkt_raw.csv")

Elasmobranchii_ecoregions_Southeast_Papua_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Southeast_Papua_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Southeast_Papua_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Southeast_Papua_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Southeast_Papua_wkt,"Elasmobranchii_ecoregions_Southeast_Papua_wkt_raw.csv")

Elasmobranchii_ecoregions_Southern_China_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Southern_China_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Southern_China_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Southern_China_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Southern_China_wkt,"Elasmobranchii_ecoregions_Southern_China_wkt_raw.csv")

Elasmobranchii_ecoregions_Southern_Vietnam_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Southern_Vietnam_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Southern_Vietnam_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Southern_Vietnam_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Southern_Vietnam_wkt,"Elasmobranchii_ecoregions_Southern_Vietnam_wkt_raw.csv")

Elasmobranchii_ecoregions_Sund_Java_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Sund_Java_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Sund_Java_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Sund_Java_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Sund_Java_wkt,"Elasmobranchii_ecoregions_Sund_Java_wkt_raw.csv")

Elasmobranchii_ecoregions_Austral_wkt <- occurrence("Elasmobranchii", geometry = bbox_ecoregions_Austral_wkt, mof = TRUE, dna = TRUE)
Elasmobranchii_ecoregions_Austral_wkt = data.frame(lapply(Elasmobranchii_ecoregions_Austral_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Elasmobranchii_ecoregions_Austral_wkt,"Elasmobranchii_ecoregions_Austral_wkt_raw.csv")

################################################################################
################################# HOLOCEPHALI  #################################
################################################################################

Holocephali_ecoregions_Arnhem_Coast_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Arnhem_Coast_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Arnhem_Coast_wkt = data.frame(lapply(Holocephali_ecoregions_Arnhem_Coast_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Arnhem_Coast_wkt,"Holocephali_ecoregions_Arnhem_Coast_wkt_raw.csv")
# 
Holocephali_ecoregions_Arafura_Sea_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Arafura_Sea_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Arafura_Sea_wkt = data.frame(lapply(Holocephali_ecoregions_Arafura_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Arafura_Sea_wkt,"Holocephali_ecoregions_Arafura_Sea_wkt_raw.csv")
# 
Holocephali_ecoregions_Banda_Sea_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Banda_Sea_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Banda_Sea_wkt = data.frame(lapply(Holocephali_ecoregions_Banda_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Banda_Sea_wkt,"Holocephali_ecoregions_Banda_Sea_wkt_raw.csv")
# 
# Holocephali_ecoregions_Bismarck_Sea_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Bismarck_Sea_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Bismarck_Sea_wkt = data.frame(lapply(Holocephali_ecoregions_Bismarck_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Bismarck_Sea_wkt,"Holocephali_ecoregions_Bismarck_Sea_wkt_raw.csv")
# 
Holocephali_ecoregions_Bonaparte_Coast_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Bonaparte_Coast_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Bonaparte_Coast_wkt = data.frame(lapply(Holocephali_ecoregions_Bonaparte_Coast_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Bonaparte_Coast_wkt,"Holocephali_ecoregions_Bonaparte_Coast_wkt_raw.csv")
# 
# Holocephali_ecoregions_Cocos_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Cocos_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Cocos_wkt = data.frame(lapply(Holocephali_ecoregions_Cocos_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Cocos_wkt,"Holocephali_ecoregions_Cocos_wkt_raw.csv")
# 
Holocephali_ecoregions_Coral_Sea_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Coral_Sea_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Coral_Sea_wkt = data.frame(lapply(Holocephali_ecoregions_Coral_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Coral_Sea_wkt,"Holocephali_ecoregions_Coral_Sea_wkt_raw.csv")
# 
# Holocephali_ecoregions_East_Caroline_Islands_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_East_Caroline_Islands_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_East_Caroline_Islands_wkt = data.frame(lapply(Holocephali_ecoregions_East_Caroline_Islands_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_East_Caroline_Islands_wkt,"Holocephali_ecoregions_East_Caroline_Islands_wkt_raw.csv")
# 
# Holocephali_ecoregions_Easter_Island_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Easter_Island_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Easter_Island_wkt = data.frame(lapply(Holocephali_ecoregions_Easter_Island_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Easter_Island_wkt,"Holocephali_ecoregions_Easter_Island_wkt_raw.csv")
# 
Holocephali_ecoregions_Eastern_Philippines_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Eastern_Philippines_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Eastern_Philippines_wkt = data.frame(lapply(Holocephali_ecoregions_Eastern_Philippines_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Eastern_Philippines_wkt,"Holocephali_ecoregions_Eastern_Philippines_wkt_raw.csv")
# 
Holocephali_ecoregions_Exmouth_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Exmouth_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Exmouth_wkt = data.frame(lapply(Holocephali_ecoregions_Exmouth_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Exmouth_wkt,"Holocephali_ecoregions_Exmouth_wkt_raw.csv")
# 
# Holocephali_ecoregions_Fiji_wkt_1 <- occurrence("Holocephali", geometry = bbox_ecoregions_Fiji_wkt_1, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Fiji_wkt_1 = data.frame(lapply(Holocephali_ecoregions_Fiji_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Fiji_wkt_1,"Holocephali_ecoregions_Fiji_wkt_raw_1.csv")
# 
# Holocephali_ecoregions_Fiji_wkt_2 <- occurrence("Holocephali", geometry = bbox_ecoregions_Fiji_wkt_2, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Fiji_wkt_2 = data.frame(lapply(Holocephali_ecoregions_Fiji_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Fiji_wkt_2,"Holocephali_ecoregions_Fiji_wkt_raw_2.csv")
# 
# Holocephali_ecoregions_Gilbert_wkt_1 <- occurrence("Holocephali", geometry = bbox_ecoregions_Gilbert_wkt_1, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Gilbert_wkt_1 = data.frame(lapply(Holocephali_ecoregions_Gilbert_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Gilbert_wkt_1,"Holocephali_ecoregions_Gilbert_wkt_raw_1.csv")
# 
# Holocephali_ecoregions_Gilbert_wkt_2 <- occurrence("Holocephali", geometry = bbox_ecoregions_Gilbert_wkt_2, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Gilbert_wkt_2 = data.frame(lapply(Holocephali_ecoregions_Gilbert_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Gilbert_wkt_2,"Holocephali_ecoregions_Gilbert_wkt_raw_2.csv")
# 
# Holocephali_ecoregions_Gilbert_wkt_3 <- occurrence("Holocephali", geometry = bbox_ecoregions_Gilbert_wkt_3, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Gilbert_wkt_3 = data.frame(lapply(Holocephali_ecoregions_Gilbert_wkt_3, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Gilbert_wkt_3,"Holocephali_ecoregions_Gilbert_wkt_raw_3.csv")
# 
# Holocephali_ecoregions_Gulf_of_Papua_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Gulf_of_Papua_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Gulf_of_Papua_wkt = data.frame(lapply(Holocephali_ecoregions_Gulf_of_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Gulf_of_Papua_wkt,"Holocephali_ecoregions_Gulf_of_Papua_wkt_raw.csv")
# 
# Holocephali_ecoregions_Gulf_of_Thailand_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Gulf_of_Thailand_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Gulf_of_Thailand_wkt = data.frame(lapply(Holocephali_ecoregions_Gulf_of_Thailand_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Gulf_of_Thailand_wkt,"Holocephali_ecoregions_Gulf_of_Thailand_wkt_raw.csv")
# 
# Holocephali_ecoregions_Gulf_of_Tonkin_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Gulf_of_Tonkin_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Gulf_of_Tonkin_wkt = data.frame(lapply(Holocephali_ecoregions_Gulf_of_Tonkin_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Gulf_of_Tonkin_wkt,"Holocephali_ecoregions_Gulf_of_Tonkin_wkt_raw.csv")
# 
# Holocephali_ecoregions_Halmahera_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Halmahera_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Halmahera_wkt = data.frame(lapply(Holocephali_ecoregions_Halmahera_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Halmahera_wkt,"Holocephali_ecoregions_Halmahera_wkt_raw.csv")
# 
# Holocephali_ecoregions_Hawaii_wkt_1 <- occurrence("Holocephali", geometry = bbox_ecoregions_Hawaii_wkt_1, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Hawaii_wkt_1 = data.frame(lapply(Holocephali_ecoregions_Hawaii_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Hawaii_wkt_1,"Holocephali_ecoregions_Hawaii_wkt_raw_1.csv")
# 
# Holocephali_ecoregions_Hawaii_wkt_2 <- occurrence("Holocephali", geometry = bbox_ecoregions_Hawaii_wkt_2, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Hawaii_wkt_2 = data.frame(lapply(Holocephali_ecoregions_Hawaii_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Hawaii_wkt_2,"Holocephali_ecoregions_Hawaii_wkt_raw_2.csv")
# 
Holocephali_ecoregions_Hawaii_wkt_3 <- occurrence("Holocephali", geometry = bbox_ecoregions_Hawaii_wkt_3, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Hawaii_wkt_3 = data.frame(lapply(Holocephali_ecoregions_Hawaii_wkt_3, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Hawaii_wkt_3,"Holocephali_ecoregions_Hawaii_wkt_raw_3.csv")
# 
Holocephali_ecoregions_Lesser_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Lesser_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Lesser_wkt = data.frame(lapply(Holocephali_ecoregions_Lesser_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Lesser_wkt,"Holocephali_ecoregions_Lesser_wkt_raw.csv")
# 
# Holocephali_ecoregions_Line_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Line_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Line_wkt = data.frame(lapply(Holocephali_ecoregions_Line_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Line_wkt,"Holocephali_ecoregions_Line_wkt_raw.csv")
# 
Holocephali_ecoregions_Lord_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Lord_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Lord_wkt = data.frame(lapply(Holocephali_ecoregions_Lord_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Lord_wkt,"Holocephali_ecoregions_Lord_wkt_raw.csv")
# 
# Holocephali_ecoregions_Malacca_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Malacca_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Malacca_wkt = data.frame(lapply(Holocephali_ecoregions_Malacca_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Malacca_wkt,"Holocephali_ecoregions_Malacca_wkt_raw.csv")
# 
# Holocephali_ecoregions_Mariana_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Mariana_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Mariana_wkt = data.frame(lapply(Holocephali_ecoregions_Mariana_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Mariana_wkt,"Holocephali_ecoregions_Mariana_wkt_raw.csv")
# 
# Holocephali_ecoregions_Tuamotus_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Tuamotus_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Tuamotus_wkt = data.frame(lapply(Holocephali_ecoregions_Tuamotus_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Tuamotus_wkt,"Holocephali_ecoregions_Tuamotus_wkt_raw.csv")
# 
Holocephali_ecoregions_Ningaloo_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Ningaloo_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Ningaloo_wkt = data.frame(lapply(Holocephali_ecoregions_Ningaloo_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Ningaloo_wkt,"Holocephali_ecoregions_Ningaloo_wkt_raw.csv")
# 
# Holocephali_ecoregions_Papua_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Papua_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Papua_wkt = data.frame(lapply(Holocephali_ecoregions_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Papua_wkt,"Holocephali_ecoregions_Papua_wkt_raw.csv")
# 
# Holocephali_ecoregions_Solomon_Archipelago_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Solomon_Archipelago_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Solomon_Archipelago_wkt = data.frame(lapply(Holocephali_ecoregions_Solomon_Archipelago_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Solomon_Archipelago_wkt,"Holocephali_ecoregions_Solomon_Archipelago_wkt_raw.csv")
# 
# Holocephali_ecoregions_Solomon_Sea_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Solomon_Sea_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Solomon_Sea_wkt = data.frame(lapply(Holocephali_ecoregions_Solomon_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Solomon_Sea_wkt,"Holocephali_ecoregions_Solomon_Sea_wkt_raw.csv")

Holocephali_ecoregions_Vanuatu_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Vanuatu_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Vanuatu_wkt = data.frame(lapply(Holocephali_ecoregions_Vanuatu_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Vanuatu_wkt,"Holocephali_ecoregions_Vanuatu_wkt_raw.csv")
# 
# Holocephali_ecoregions_Marquesas_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Marquesas_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Marquesas_wkt = data.frame(lapply(Holocephali_ecoregions_Marquesas_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Marquesas_wkt,"Holocephali_ecoregions_Marquesas_wkt_raw.csv")
# 
# Holocephali_ecoregions_Samoa_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Samoa_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Samoa_wkt = data.frame(lapply(Holocephali_ecoregions_Samoa_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Samoa_wkt,"Holocephali_ecoregions_Samoa_wkt_raw.csv")
# 
# Holocephali_ecoregions_Society_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Society_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Society_wkt = data.frame(lapply(Holocephali_ecoregions_Society_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Society_wkt,"Holocephali_ecoregions_Society_wkt_raw.csv")
# 
# Holocephali_ecoregions_Marshall_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Marshall_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Marshall_wkt = data.frame(lapply(Holocephali_ecoregions_Marshall_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Marshall_wkt,"Holocephali_ecoregions_Marshall_wkt_raw.csv")
# 
Holocephali_ecoregions_Tonga_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Tonga_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Tonga_wkt = data.frame(lapply(Holocephali_ecoregions_Tonga_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Tonga_wkt,"Holocephali_ecoregions_Tonga_wkt_raw.csv")
# 
# Holocephali_ecoregions_West_Caroline_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_West_Caroline_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_West_Caroline_wkt = data.frame(lapply(Holocephali_ecoregions_West_Caroline_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_West_Caroline_wkt,"Holocephali_ecoregions_West_Caroline_wkt_raw.csv")
# 
Holocephali_ecoregions_New_Caledonia_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_New_Caledonia_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_New_Caledonia_wkt = data.frame(lapply(Holocephali_ecoregions_New_Caledonia_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_New_Caledonia_wkt,"Holocephali_ecoregions_New_Caledonia_wkt_raw.csv")
# 
Holocephali_ecoregions_Torres_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Torres_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Torres_wkt = data.frame(lapply(Holocephali_ecoregions_Torres_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Torres_wkt,"Holocephali_ecoregions_Torres_wkt_raw.csv")
# 
Holocephali_ecoregions_Java_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Java_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Java_wkt = data.frame(lapply(Holocephali_ecoregions_Java_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Java_wkt,"Holocephali_ecoregions_Java_wkt_raw.csv")
# 
Holocephali_ecoregions_Central_Reef_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Central_Reef_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Central_Reef_wkt = data.frame(lapply(Holocephali_ecoregions_Central_Reef_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Central_Reef_wkt,"Holocephali_ecoregions_Central_Reef_wkt_raw.csv")
# 
# Holocephali_ecoregions_Phoenix_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Phoenix_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Phoenix_wkt = data.frame(lapply(Holocephali_ecoregions_Phoenix_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Phoenix_wkt,"Holocephali_ecoregions_Phoenix_wkt_raw.csv")
# 
Holocephali_ecoregions_Palawan_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Palawan_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Palawan_wkt = data.frame(lapply(Holocephali_ecoregions_Palawan_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Palawan_wkt,"Holocephali_ecoregions_Palawan_wkt_raw.csv")
# 
# Holocephali_ecoregions_Northeast_Sulawesi_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Northeast_Sulawesi_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Northeast_Sulawesi_wkt = data.frame(lapply(Holocephali_ecoregions_Northeast_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Northeast_Sulawesi_wkt,"Holocephali_ecoregions_Northeast_Sulawesi_wkt_raw.csv")
# 
Holocephali_ecoregions_Sulawesi_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Sulawesi_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Sulawesi_wkt = data.frame(lapply(Holocephali_ecoregions_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Sulawesi_wkt,"Holocephali_ecoregions_Sulawesi_wkt_raw.csv")
# 
# Holocephali_ecoregions_Rapa_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Rapa_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Rapa_wkt = data.frame(lapply(Holocephali_ecoregions_Rapa_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Rapa_wkt,"Holocephali_ecoregions_Rapa_wkt_raw.csv")
# 
Holocephali_ecoregions_Ogasawara_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Ogasawara_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Ogasawara_wkt = data.frame(lapply(Holocephali_ecoregions_Ogasawara_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Ogasawara_wkt,"Holocephali_ecoregions_Ogasawara_wkt_raw.csv")
# 
Holocephali_ecoregions_Oceanic_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Oceanic_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Oceanic_wkt = data.frame(lapply(Holocephali_ecoregions_Oceanic_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Oceanic_wkt,"Holocephali_ecoregions_Oceanic_wkt_raw.csv")
# 
Holocephali_ecoregions_Kuroshio_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Kuroshio_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Kuroshio_wkt = data.frame(lapply(Holocephali_ecoregions_Kuroshio_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Kuroshio_wkt,"Holocephali_ecoregions_Kuroshio_wkt_raw.csv")
# 
# Holocephali_ecoregions_Southeast_Papua_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Southeast_Papua_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Southeast_Papua_wkt = data.frame(lapply(Holocephali_ecoregions_Southeast_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Southeast_Papua_wkt,"Holocephali_ecoregions_Southeast_Papua_wkt_raw.csv")
# 
Holocephali_ecoregions_Southern_China_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Southern_China_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Southern_China_wkt = data.frame(lapply(Holocephali_ecoregions_Southern_China_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Southern_China_wkt,"Holocephali_ecoregions_Southern_China_wkt_raw.csv")
# 
# Holocephali_ecoregions_Southern_Vietnam_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Southern_Vietnam_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Southern_Vietnam_wkt = data.frame(lapply(Holocephali_ecoregions_Southern_Vietnam_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Southern_Vietnam_wkt,"Holocephali_ecoregions_Southern_Vietnam_wkt_raw.csv")
# 
Holocephali_ecoregions_Sund_Java_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Sund_Java_wkt, mof = TRUE, dna = TRUE)
Holocephali_ecoregions_Sund_Java_wkt = data.frame(lapply(Holocephali_ecoregions_Sund_Java_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Holocephali_ecoregions_Sund_Java_wkt,"Holocephali_ecoregions_Sund_Java_wkt_raw.csv")
# 
# Holocephali_ecoregions_Austral_wkt <- occurrence("Holocephali", geometry = bbox_ecoregions_Austral_wkt, mof = TRUE, dna = TRUE)
# Holocephali_ecoregions_Austral_wkt = data.frame(lapply(Holocephali_ecoregions_Austral_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Holocephali_ecoregions_Austral_wkt,"Holocephali_ecoregions_Austral_wkt_raw.csv")

################################################################################
################################# CYCLOSTOMI  ##################################
################################################################################

# Cyclostomi_ecoregions_Arnhem_Coast_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Arnhem_Coast_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Arnhem_Coast_wkt = data.frame(lapply(Cyclostomi_ecoregions_Arnhem_Coast_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Arnhem_Coast_wkt,"Cyclostomi_ecoregions_Arnhem_Coast_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Arafura_Sea_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Arafura_Sea_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Arafura_Sea_wkt = data.frame(lapply(Cyclostomi_ecoregions_Arafura_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Arafura_Sea_wkt,"Cyclostomi_ecoregions_Arafura_Sea_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Banda_Sea_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Banda_Sea_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Banda_Sea_wkt = data.frame(lapply(Cyclostomi_ecoregions_Banda_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Banda_Sea_wkt,"Cyclostomi_ecoregions_Banda_Sea_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Bismarck_Sea_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Bismarck_Sea_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Bismarck_Sea_wkt = data.frame(lapply(Cyclostomi_ecoregions_Bismarck_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Bismarck_Sea_wkt,"Cyclostomi_ecoregions_Bismarck_Sea_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Bonaparte_Coast_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Bonaparte_Coast_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Bonaparte_Coast_wkt = data.frame(lapply(Cyclostomi_ecoregions_Bonaparte_Coast_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Bonaparte_Coast_wkt,"Cyclostomi_ecoregions_Bonaparte_Coast_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Cocos_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Cocos_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Cocos_wkt = data.frame(lapply(Cyclostomi_ecoregions_Cocos_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Cocos_wkt,"Cyclostomi_ecoregions_Cocos_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Coral_Sea_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Coral_Sea_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Coral_Sea_wkt = data.frame(lapply(Cyclostomi_ecoregions_Coral_Sea_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Coral_Sea_wkt,"Cyclostomi_ecoregions_Coral_Sea_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_East_Caroline_Islands_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_East_Caroline_Islands_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_East_Caroline_Islands_wkt = data.frame(lapply(Cyclostomi_ecoregions_East_Caroline_Islands_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_East_Caroline_Islands_wkt,"Cyclostomi_ecoregions_East_Caroline_Islands_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Easter_Island_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Easter_Island_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Easter_Island_wkt = data.frame(lapply(Cyclostomi_ecoregions_Easter_Island_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Easter_Island_wkt,"Cyclostomi_ecoregions_Easter_Island_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Eastern_Philippines_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Eastern_Philippines_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Eastern_Philippines_wkt = data.frame(lapply(Cyclostomi_ecoregions_Eastern_Philippines_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Eastern_Philippines_wkt,"Cyclostomi_ecoregions_Eastern_Philippines_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Exmouth_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Exmouth_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Exmouth_wkt = data.frame(lapply(Cyclostomi_ecoregions_Exmouth_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Exmouth_wkt,"Cyclostomi_ecoregions_Exmouth_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Fiji_wkt_1 <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Fiji_wkt_1, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Fiji_wkt_1 = data.frame(lapply(Cyclostomi_ecoregions_Fiji_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Fiji_wkt_1,"Cyclostomi_ecoregions_Fiji_wkt_raw_1.csv")
# 
# Cyclostomi_ecoregions_Fiji_wkt_2 <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Fiji_wkt_2, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Fiji_wkt_2 = data.frame(lapply(Cyclostomi_ecoregions_Fiji_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Fiji_wkt_2,"Cyclostomi_ecoregions_Fiji_wkt_raw_2.csv")
# 
# Cyclostomi_ecoregions_Gilbert_wkt_1 <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Gilbert_wkt_1, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Gilbert_wkt_1 = data.frame(lapply(Cyclostomi_ecoregions_Gilbert_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Gilbert_wkt_1,"Cyclostomi_ecoregions_Gilbert_wkt_raw_1.csv")
# 
# Cyclostomi_ecoregions_Gilbert_wkt_2 <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Gilbert_wkt_2, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Gilbert_wkt_2 = data.frame(lapply(Cyclostomi_ecoregions_Gilbert_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Gilbert_wkt_2,"Cyclostomi_ecoregions_Gilbert_wkt_raw_2.csv")
# 
# Cyclostomi_ecoregions_Gilbert_wkt_3 <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Gilbert_wkt_3, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Gilbert_wkt_3 = data.frame(lapply(Cyclostomi_ecoregions_Gilbert_wkt_3, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Gilbert_wkt_3,"Cyclostomi_ecoregions_Gilbert_wkt_raw_3.csv")
# 
# Cyclostomi_ecoregions_Gulf_of_Papua_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Gulf_of_Papua_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Gulf_of_Papua_wkt = data.frame(lapply(Cyclostomi_ecoregions_Gulf_of_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Gulf_of_Papua_wkt,"Cyclostomi_ecoregions_Gulf_of_Papua_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Gulf_of_Thailand_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Gulf_of_Thailand_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Gulf_of_Thailand_wkt = data.frame(lapply(Cyclostomi_ecoregions_Gulf_of_Thailand_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Gulf_of_Thailand_wkt,"Cyclostomi_ecoregions_Gulf_of_Thailand_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Gulf_of_Tonkin_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Gulf_of_Tonkin_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Gulf_of_Tonkin_wkt = data.frame(lapply(Cyclostomi_ecoregions_Gulf_of_Tonkin_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Gulf_of_Tonkin_wkt,"Cyclostomi_ecoregions_Gulf_of_Tonkin_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Halmahera_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Halmahera_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Halmahera_wkt = data.frame(lapply(Cyclostomi_ecoregions_Halmahera_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Halmahera_wkt,"Cyclostomi_ecoregions_Halmahera_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Hawaii_wkt_1 <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Hawaii_wkt_1, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Hawaii_wkt_1 = data.frame(lapply(Cyclostomi_ecoregions_Hawaii_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Hawaii_wkt_1,"Cyclostomi_ecoregions_Hawaii_wkt_raw_1.csv")
# 
# Cyclostomi_ecoregions_Hawaii_wkt_2 <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Hawaii_wkt_2, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Hawaii_wkt_2 = data.frame(lapply(Cyclostomi_ecoregions_Hawaii_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Hawaii_wkt_2,"Cyclostomi_ecoregions_Hawaii_wkt_raw_2.csv")
# 
Cyclostomi_ecoregions_Hawaii_wkt_3 <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Hawaii_wkt_3, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Hawaii_wkt_3 = data.frame(lapply(Cyclostomi_ecoregions_Hawaii_wkt_3, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Hawaii_wkt_3,"Cyclostomi_ecoregions_Hawaii_wkt_raw_3.csv")
# 
# Cyclostomi_ecoregions_Lesser_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Lesser_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Lesser_wkt = data.frame(lapply(Cyclostomi_ecoregions_Lesser_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Lesser_wkt,"Cyclostomi_ecoregions_Lesser_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Line_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Line_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Line_wkt = data.frame(lapply(Cyclostomi_ecoregions_Line_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Line_wkt,"Cyclostomi_ecoregions_Line_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Lord_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Lord_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Lord_wkt = data.frame(lapply(Cyclostomi_ecoregions_Lord_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Lord_wkt,"Cyclostomi_ecoregions_Lord_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Malacca_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Malacca_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Malacca_wkt = data.frame(lapply(Cyclostomi_ecoregions_Malacca_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Malacca_wkt,"Cyclostomi_ecoregions_Malacca_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Mariana_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Mariana_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Mariana_wkt = data.frame(lapply(Cyclostomi_ecoregions_Mariana_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Mariana_wkt,"Cyclostomi_ecoregions_Mariana_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Tuamotus_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Tuamotus_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Tuamotus_wkt = data.frame(lapply(Cyclostomi_ecoregions_Tuamotus_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Tuamotus_wkt,"Cyclostomi_ecoregions_Tuamotus_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Ningaloo_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Ningaloo_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Ningaloo_wkt = data.frame(lapply(Cyclostomi_ecoregions_Ningaloo_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Ningaloo_wkt,"Cyclostomi_ecoregions_Ningaloo_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Papua_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Papua_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Papua_wkt = data.frame(lapply(Cyclostomi_ecoregions_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Papua_wkt,"Cyclostomi_ecoregions_Papua_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Solomon_Archipelago_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Solomon_Archipelago_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Solomon_Archipelago_wkt = data.frame(lapply(Cyclostomi_ecoregions_Solomon_Archipelago_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Solomon_Archipelago_wkt,"Cyclostomi_ecoregions_Solomon_Archipelago_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Solomon_Sea_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Solomon_Sea_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Solomon_Sea_wkt = data.frame(lapply(Cyclostomi_ecoregions_Solomon_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Solomon_Sea_wkt,"Cyclostomi_ecoregions_Solomon_Sea_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Vanuatu_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Vanuatu_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Vanuatu_wkt = data.frame(lapply(Cyclostomi_ecoregions_Vanuatu_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Vanuatu_wkt,"Cyclostomi_ecoregions_Vanuatu_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Marquesas_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Marquesas_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Marquesas_wkt = data.frame(lapply(Cyclostomi_ecoregions_Marquesas_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Marquesas_wkt,"Cyclostomi_ecoregions_Marquesas_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Samoa_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Samoa_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Samoa_wkt = data.frame(lapply(Cyclostomi_ecoregions_Samoa_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Samoa_wkt,"Cyclostomi_ecoregions_Samoa_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Society_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Society_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Society_wkt = data.frame(lapply(Cyclostomi_ecoregions_Society_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Society_wkt,"Cyclostomi_ecoregions_Society_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Marshall_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Marshall_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Marshall_wkt = data.frame(lapply(Cyclostomi_ecoregions_Marshall_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Marshall_wkt,"Cyclostomi_ecoregions_Marshall_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Tonga_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Tonga_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Tonga_wkt = data.frame(lapply(Cyclostomi_ecoregions_Tonga_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Tonga_wkt,"Cyclostomi_ecoregions_Tonga_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_West_Caroline_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_West_Caroline_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_West_Caroline_wkt = data.frame(lapply(Cyclostomi_ecoregions_West_Caroline_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_West_Caroline_wkt,"Cyclostomi_ecoregions_West_Caroline_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_New_Caledonia_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_New_Caledonia_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_New_Caledonia_wkt = data.frame(lapply(Cyclostomi_ecoregions_New_Caledonia_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_New_Caledonia_wkt,"Cyclostomi_ecoregions_New_Caledonia_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Torres_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Torres_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Torres_wkt = data.frame(lapply(Cyclostomi_ecoregions_Torres_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Torres_wkt,"Cyclostomi_ecoregions_Torres_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Java_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Java_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Java_wkt = data.frame(lapply(Cyclostomi_ecoregions_Java_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Java_wkt,"Cyclostomi_ecoregions_Java_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Central_Reef_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Central_Reef_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Central_Reef_wkt = data.frame(lapply(Cyclostomi_ecoregions_Central_Reef_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Central_Reef_wkt,"Cyclostomi_ecoregions_Central_Reef_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Phoenix_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Phoenix_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Phoenix_wkt = data.frame(lapply(Cyclostomi_ecoregions_Phoenix_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Phoenix_wkt,"Cyclostomi_ecoregions_Phoenix_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Palawan_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Palawan_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Palawan_wkt = data.frame(lapply(Cyclostomi_ecoregions_Palawan_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Palawan_wkt,"Cyclostomi_ecoregions_Palawan_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Northeast_Sulawesi_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Northeast_Sulawesi_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Northeast_Sulawesi_wkt = data.frame(lapply(Cyclostomi_ecoregions_Northeast_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Northeast_Sulawesi_wkt,"Cyclostomi_ecoregions_Northeast_Sulawesi_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Sulawesi_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Sulawesi_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Sulawesi_wkt = data.frame(lapply(Cyclostomi_ecoregions_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Sulawesi_wkt,"Cyclostomi_ecoregions_Sulawesi_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Rapa_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Rapa_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Rapa_wkt = data.frame(lapply(Cyclostomi_ecoregions_Rapa_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Rapa_wkt,"Cyclostomi_ecoregions_Rapa_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Ogasawara_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Ogasawara_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Ogasawara_wkt = data.frame(lapply(Cyclostomi_ecoregions_Ogasawara_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Ogasawara_wkt,"Cyclostomi_ecoregions_Ogasawara_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Oceanic_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Oceanic_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Oceanic_wkt = data.frame(lapply(Cyclostomi_ecoregions_Oceanic_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Oceanic_wkt,"Cyclostomi_ecoregions_Oceanic_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Kuroshio_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Kuroshio_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Kuroshio_wkt = data.frame(lapply(Cyclostomi_ecoregions_Kuroshio_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Kuroshio_wkt,"Cyclostomi_ecoregions_Kuroshio_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Southeast_Papua_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Southeast_Papua_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Southeast_Papua_wkt = data.frame(lapply(Cyclostomi_ecoregions_Southeast_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Southeast_Papua_wkt,"Cyclostomi_ecoregions_Southeast_Papua_wkt_raw.csv")
# 
Cyclostomi_ecoregions_Southern_China_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Southern_China_wkt, mof = TRUE, dna = TRUE)
Cyclostomi_ecoregions_Southern_China_wkt = data.frame(lapply(Cyclostomi_ecoregions_Southern_China_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cyclostomi_ecoregions_Southern_China_wkt,"Cyclostomi_ecoregions_Southern_China_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Southern_Vietnam_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Southern_Vietnam_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Southern_Vietnam_wkt = data.frame(lapply(Cyclostomi_ecoregions_Southern_Vietnam_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Southern_Vietnam_wkt,"Cyclostomi_ecoregions_Southern_Vietnam_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Sund_Java_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Sund_Java_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Sund_Java_wkt = data.frame(lapply(Cyclostomi_ecoregions_Sund_Java_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Sund_Java_wkt,"Cyclostomi_ecoregions_Sund_Java_wkt_raw.csv")
# 
# Cyclostomi_ecoregions_Austral_wkt <- occurrence("Cyclostomi", geometry = bbox_ecoregions_Austral_wkt, mof = TRUE, dna = TRUE)
# Cyclostomi_ecoregions_Austral_wkt = data.frame(lapply(Cyclostomi_ecoregions_Austral_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cyclostomi_ecoregions_Austral_wkt,"Cyclostomi_ecoregions_Austral_wkt_raw.csv")

################################################################################
################################ CHONDROSTEI  ##################################
################################################################################

# Chondrostei_ecoregions_Arnhem_Coast_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Arnhem_Coast_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Arnhem_Coast_wkt = data.frame(lapply(Chondrostei_ecoregions_Arnhem_Coast_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Arnhem_Coast_wkt,"Chondrostei_ecoregions_Arnhem_Coast_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Arafura_Sea_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Arafura_Sea_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Arafura_Sea_wkt = data.frame(lapply(Chondrostei_ecoregions_Arafura_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Arafura_Sea_wkt,"Chondrostei_ecoregions_Arafura_Sea_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Banda_Sea_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Banda_Sea_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Banda_Sea_wkt = data.frame(lapply(Chondrostei_ecoregions_Banda_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Banda_Sea_wkt,"Chondrostei_ecoregions_Banda_Sea_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Bismarck_Sea_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Bismarck_Sea_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Bismarck_Sea_wkt = data.frame(lapply(Chondrostei_ecoregions_Bismarck_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Bismarck_Sea_wkt,"Chondrostei_ecoregions_Bismarck_Sea_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Bonaparte_Coast_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Bonaparte_Coast_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Bonaparte_Coast_wkt = data.frame(lapply(Chondrostei_ecoregions_Bonaparte_Coast_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Bonaparte_Coast_wkt,"Chondrostei_ecoregions_Bonaparte_Coast_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Cocos_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Cocos_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Cocos_wkt = data.frame(lapply(Chondrostei_ecoregions_Cocos_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Cocos_wkt,"Chondrostei_ecoregions_Cocos_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Coral_Sea_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Coral_Sea_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Coral_Sea_wkt = data.frame(lapply(Chondrostei_ecoregions_Coral_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Coral_Sea_wkt,"Chondrostei_ecoregions_Coral_Sea_wkt_raw.csv")
# 
# Chondrostei_ecoregions_East_Caroline_Islands_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_East_Caroline_Islands_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_East_Caroline_Islands_wkt = data.frame(lapply(Chondrostei_ecoregions_East_Caroline_Islands_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_East_Caroline_Islands_wkt,"Chondrostei_ecoregions_East_Caroline_Islands_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Easter_Island_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Easter_Island_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Easter_Island_wkt = data.frame(lapply(Chondrostei_ecoregions_Easter_Island_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Easter_Island_wkt,"Chondrostei_ecoregions_Easter_Island_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Eastern_Philippines_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Eastern_Philippines_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Eastern_Philippines_wkt = data.frame(lapply(Chondrostei_ecoregions_Eastern_Philippines_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Eastern_Philippines_wkt,"Chondrostei_ecoregions_Eastern_Philippines_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Exmouth_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Exmouth_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Exmouth_wkt = data.frame(lapply(Chondrostei_ecoregions_Exmouth_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Exmouth_wkt,"Chondrostei_ecoregions_Exmouth_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Fiji_wkt_1 <- occurrence("Chondrostei", geometry = bbox_ecoregions_Fiji_wkt_1, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Fiji_wkt_1 = data.frame(lapply(Chondrostei_ecoregions_Fiji_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Fiji_wkt_1,"Chondrostei_ecoregions_Fiji_wkt_raw_1.csv")
# 
# Chondrostei_ecoregions_Fiji_wkt_2 <- occurrence("Chondrostei", geometry = bbox_ecoregions_Fiji_wkt_2, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Fiji_wkt_2 = data.frame(lapply(Chondrostei_ecoregions_Fiji_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Fiji_wkt_2,"Chondrostei_ecoregions_Fiji_wkt_raw_2.csv")
# 
# Chondrostei_ecoregions_Gilbert_wkt_1 <- occurrence("Chondrostei", geometry = bbox_ecoregions_Gilbert_wkt_1, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Gilbert_wkt_1 = data.frame(lapply(Chondrostei_ecoregions_Gilbert_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Gilbert_wkt_1,"Chondrostei_ecoregions_Gilbert_wkt_raw_1.csv")
# 
# Chondrostei_ecoregions_Gilbert_wkt_2 <- occurrence("Chondrostei", geometry = bbox_ecoregions_Gilbert_wkt_2, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Gilbert_wkt_2 = data.frame(lapply(Chondrostei_ecoregions_Gilbert_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Gilbert_wkt_2,"Chondrostei_ecoregions_Gilbert_wkt_raw_2.csv")
# 
# Chondrostei_ecoregions_Gilbert_wkt_3 <- occurrence("Chondrostei", geometry = bbox_ecoregions_Gilbert_wkt_3, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Gilbert_wkt_3 = data.frame(lapply(Chondrostei_ecoregions_Gilbert_wkt_3, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Gilbert_wkt_3,"Chondrostei_ecoregions_Gilbert_wkt_raw_3.csv")
# 
# Chondrostei_ecoregions_Gulf_of_Papua_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Gulf_of_Papua_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Gulf_of_Papua_wkt = data.frame(lapply(Chondrostei_ecoregions_Gulf_of_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Gulf_of_Papua_wkt,"Chondrostei_ecoregions_Gulf_of_Papua_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Gulf_of_Thailand_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Gulf_of_Thailand_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Gulf_of_Thailand_wkt = data.frame(lapply(Chondrostei_ecoregions_Gulf_of_Thailand_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Gulf_of_Thailand_wkt,"Chondrostei_ecoregions_Gulf_of_Thailand_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Gulf_of_Tonkin_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Gulf_of_Tonkin_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Gulf_of_Tonkin_wkt = data.frame(lapply(Chondrostei_ecoregions_Gulf_of_Tonkin_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Gulf_of_Tonkin_wkt,"Chondrostei_ecoregions_Gulf_of_Tonkin_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Halmahera_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Halmahera_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Halmahera_wkt = data.frame(lapply(Chondrostei_ecoregions_Halmahera_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Halmahera_wkt,"Chondrostei_ecoregions_Halmahera_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Hawaii_wkt_1 <- occurrence("Chondrostei", geometry = bbox_ecoregions_Hawaii_wkt_1, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Hawaii_wkt_1 = data.frame(lapply(Chondrostei_ecoregions_Hawaii_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Hawaii_wkt_1,"Chondrostei_ecoregions_Hawaii_wkt_raw_1.csv")
# 
# Chondrostei_ecoregions_Hawaii_wkt_2 <- occurrence("Chondrostei", geometry = bbox_ecoregions_Hawaii_wkt_2, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Hawaii_wkt_2 = data.frame(lapply(Chondrostei_ecoregions_Hawaii_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Hawaii_wkt_2,"Chondrostei_ecoregions_Hawaii_wkt_raw_2.csv")
# 
# Chondrostei_ecoregions_Hawaii_wkt_3 <- occurrence("Chondrostei", geometry = bbox_ecoregions_Hawaii_wkt_3, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Hawaii_wkt_3 = data.frame(lapply(Chondrostei_ecoregions_Hawaii_wkt_3, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Hawaii_wkt_3,"Chondrostei_ecoregions_Hawaii_wkt_raw_3.csv")
# 
# Chondrostei_ecoregions_Lesser_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Lesser_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Lesser_wkt = data.frame(lapply(Chondrostei_ecoregions_Lesser_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Lesser_wkt,"Chondrostei_ecoregions_Lesser_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Line_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Line_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Line_wkt = data.frame(lapply(Chondrostei_ecoregions_Line_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Line_wkt,"Chondrostei_ecoregions_Line_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Lord_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Lord_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Lord_wkt = data.frame(lapply(Chondrostei_ecoregions_Lord_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Lord_wkt,"Chondrostei_ecoregions_Lord_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Malacca_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Malacca_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Malacca_wkt = data.frame(lapply(Chondrostei_ecoregions_Malacca_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Malacca_wkt,"Chondrostei_ecoregions_Malacca_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Mariana_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Mariana_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Mariana_wkt = data.frame(lapply(Chondrostei_ecoregions_Mariana_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Mariana_wkt,"Chondrostei_ecoregions_Mariana_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Tuamotus_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Tuamotus_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Tuamotus_wkt = data.frame(lapply(Chondrostei_ecoregions_Tuamotus_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Tuamotus_wkt,"Chondrostei_ecoregions_Tuamotus_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Ningaloo_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Ningaloo_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Ningaloo_wkt = data.frame(lapply(Chondrostei_ecoregions_Ningaloo_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Ningaloo_wkt,"Chondrostei_ecoregions_Ningaloo_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Papua_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Papua_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Papua_wkt = data.frame(lapply(Chondrostei_ecoregions_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Papua_wkt,"Chondrostei_ecoregions_Papua_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Solomon_Archipelago_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Solomon_Archipelago_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Solomon_Archipelago_wkt = data.frame(lapply(Chondrostei_ecoregions_Solomon_Archipelago_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Solomon_Archipelago_wkt,"Chondrostei_ecoregions_Solomon_Archipelago_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Solomon_Sea_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Solomon_Sea_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Solomon_Sea_wkt = data.frame(lapply(Chondrostei_ecoregions_Solomon_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Solomon_Sea_wkt,"Chondrostei_ecoregions_Solomon_Sea_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Vanuatu_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Vanuatu_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Vanuatu_wkt = data.frame(lapply(Chondrostei_ecoregions_Vanuatu_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Vanuatu_wkt,"Chondrostei_ecoregions_Vanuatu_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Marquesas_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Marquesas_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Marquesas_wkt = data.frame(lapply(Chondrostei_ecoregions_Marquesas_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Marquesas_wkt,"Chondrostei_ecoregions_Marquesas_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Samoa_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Samoa_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Samoa_wkt = data.frame(lapply(Chondrostei_ecoregions_Samoa_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Samoa_wkt,"Chondrostei_ecoregions_Samoa_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Society_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Society_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Society_wkt = data.frame(lapply(Chondrostei_ecoregions_Society_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Society_wkt,"Chondrostei_ecoregions_Society_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Marshall_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Marshall_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Marshall_wkt = data.frame(lapply(Chondrostei_ecoregions_Marshall_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Marshall_wkt,"Chondrostei_ecoregions_Marshall_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Tonga_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Tonga_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Tonga_wkt = data.frame(lapply(Chondrostei_ecoregions_Tonga_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Tonga_wkt,"Chondrostei_ecoregions_Tonga_wkt_raw.csv")
# 
# Chondrostei_ecoregions_West_Caroline_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_West_Caroline_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_West_Caroline_wkt = data.frame(lapply(Chondrostei_ecoregions_West_Caroline_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_West_Caroline_wkt,"Chondrostei_ecoregions_West_Caroline_wkt_raw.csv")
# 
# Chondrostei_ecoregions_New_Caledonia_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_New_Caledonia_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_New_Caledonia_wkt = data.frame(lapply(Chondrostei_ecoregions_New_Caledonia_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_New_Caledonia_wkt,"Chondrostei_ecoregions_New_Caledonia_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Torres_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Torres_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Torres_wkt = data.frame(lapply(Chondrostei_ecoregions_Torres_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Torres_wkt,"Chondrostei_ecoregions_Torres_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Java_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Java_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Java_wkt = data.frame(lapply(Chondrostei_ecoregions_Java_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Java_wkt,"Chondrostei_ecoregions_Java_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Central_Reef_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Central_Reef_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Central_Reef_wkt = data.frame(lapply(Chondrostei_ecoregions_Central_Reef_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Central_Reef_wkt,"Chondrostei_ecoregions_Central_Reef_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Phoenix_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Phoenix_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Phoenix_wkt = data.frame(lapply(Chondrostei_ecoregions_Phoenix_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Phoenix_wkt,"Chondrostei_ecoregions_Phoenix_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Palawan_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Palawan_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Palawan_wkt = data.frame(lapply(Chondrostei_ecoregions_Palawan_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Palawan_wkt,"Chondrostei_ecoregions_Palawan_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Northeast_Sulawesi_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Northeast_Sulawesi_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Northeast_Sulawesi_wkt = data.frame(lapply(Chondrostei_ecoregions_Northeast_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Northeast_Sulawesi_wkt,"Chondrostei_ecoregions_Northeast_Sulawesi_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Sulawesi_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Sulawesi_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Sulawesi_wkt = data.frame(lapply(Chondrostei_ecoregions_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Sulawesi_wkt,"Chondrostei_ecoregions_Sulawesi_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Rapa_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Rapa_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Rapa_wkt = data.frame(lapply(Chondrostei_ecoregions_Rapa_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Rapa_wkt,"Chondrostei_ecoregions_Rapa_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Ogasawara_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Ogasawara_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Ogasawara_wkt = data.frame(lapply(Chondrostei_ecoregions_Ogasawara_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Ogasawara_wkt,"Chondrostei_ecoregions_Ogasawara_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Oceanic_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Oceanic_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Oceanic_wkt = data.frame(lapply(Chondrostei_ecoregions_Oceanic_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Oceanic_wkt,"Chondrostei_ecoregions_Oceanic_wkt_raw.csv")
# 
Chondrostei_ecoregions_Kuroshio_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Kuroshio_wkt, mof = TRUE, dna = TRUE)
Chondrostei_ecoregions_Kuroshio_wkt = data.frame(lapply(Chondrostei_ecoregions_Kuroshio_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Chondrostei_ecoregions_Kuroshio_wkt,"Chondrostei_ecoregions_Kuroshio_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Southeast_Papua_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Southeast_Papua_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Southeast_Papua_wkt = data.frame(lapply(Chondrostei_ecoregions_Southeast_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Southeast_Papua_wkt,"Chondrostei_ecoregions_Southeast_Papua_wkt_raw.csv")
# 
Chondrostei_ecoregions_Southern_China_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Southern_China_wkt, mof = TRUE, dna = TRUE)
Chondrostei_ecoregions_Southern_China_wkt = data.frame(lapply(Chondrostei_ecoregions_Southern_China_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Chondrostei_ecoregions_Southern_China_wkt,"Chondrostei_ecoregions_Southern_China_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Southern_Vietnam_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Southern_Vietnam_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Southern_Vietnam_wkt = data.frame(lapply(Chondrostei_ecoregions_Southern_Vietnam_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Southern_Vietnam_wkt,"Chondrostei_ecoregions_Southern_Vietnam_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Sund_Java_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Sund_Java_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Sund_Java_wkt = data.frame(lapply(Chondrostei_ecoregions_Sund_Java_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Sund_Java_wkt,"Chondrostei_ecoregions_Sund_Java_wkt_raw.csv")
# 
# Chondrostei_ecoregions_Austral_wkt <- occurrence("Chondrostei", geometry = bbox_ecoregions_Austral_wkt, mof = TRUE, dna = TRUE)
# Chondrostei_ecoregions_Austral_wkt = data.frame(lapply(Chondrostei_ecoregions_Austral_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Chondrostei_ecoregions_Austral_wkt,"Chondrostei_ecoregions_Austral_wkt_raw.csv")

################################################################################
################################## CLADISTII  ##################################
################################################################################

# Cladistii_ecoregions_Arnhem_Coast_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Arnhem_Coast_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Arnhem_Coast_wkt = data.frame(lapply(Cladistii_ecoregions_Arnhem_Coast_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Arnhem_Coast_wkt,"Cladistii_ecoregions_Arnhem_Coast_wkt_raw.csv")
# 
# Cladistii_ecoregions_Arafura_Sea_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Arafura_Sea_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Arafura_Sea_wkt = data.frame(lapply(Cladistii_ecoregions_Arafura_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Arafura_Sea_wkt,"Cladistii_ecoregions_Arafura_Sea_wkt_raw.csv")
# 
# Cladistii_ecoregions_Banda_Sea_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Banda_Sea_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Banda_Sea_wkt = data.frame(lapply(Cladistii_ecoregions_Banda_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Banda_Sea_wkt,"Cladistii_ecoregions_Banda_Sea_wkt_raw.csv")
# 
# Cladistii_ecoregions_Bismarck_Sea_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Bismarck_Sea_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Bismarck_Sea_wkt = data.frame(lapply(Cladistii_ecoregions_Bismarck_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Bismarck_Sea_wkt,"Cladistii_ecoregions_Bismarck_Sea_wkt_raw.csv")
# 
# Cladistii_ecoregions_Bonaparte_Coast_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Bonaparte_Coast_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Bonaparte_Coast_wkt = data.frame(lapply(Cladistii_ecoregions_Bonaparte_Coast_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Bonaparte_Coast_wkt,"Cladistii_ecoregions_Bonaparte_Coast_wkt_raw.csv")
# 
# Cladistii_ecoregions_Cocos_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Cocos_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Cocos_wkt = data.frame(lapply(Cladistii_ecoregions_Cocos_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Cocos_wkt,"Cladistii_ecoregions_Cocos_wkt_raw.csv")
# 
# Cladistii_ecoregions_Coral_Sea_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Coral_Sea_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Coral_Sea_wkt = data.frame(lapply(Cladistii_ecoregions_Coral_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Coral_Sea_wkt,"Cladistii_ecoregions_Coral_Sea_wkt_raw.csv")
# 
# Cladistii_ecoregions_East_Caroline_Islands_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_East_Caroline_Islands_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_East_Caroline_Islands_wkt = data.frame(lapply(Cladistii_ecoregions_East_Caroline_Islands_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_East_Caroline_Islands_wkt,"Cladistii_ecoregions_East_Caroline_Islands_wkt_raw.csv")
# 
# Cladistii_ecoregions_Easter_Island_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Easter_Island_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Easter_Island_wkt = data.frame(lapply(Cladistii_ecoregions_Easter_Island_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Easter_Island_wkt,"Cladistii_ecoregions_Easter_Island_wkt_raw.csv")
# 
# Cladistii_ecoregions_Eastern_Philippines_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Eastern_Philippines_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Eastern_Philippines_wkt = data.frame(lapply(Cladistii_ecoregions_Eastern_Philippines_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Eastern_Philippines_wkt,"Cladistii_ecoregions_Eastern_Philippines_wkt_raw.csv")
# 
# Cladistii_ecoregions_Exmouth_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Exmouth_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Exmouth_wkt = data.frame(lapply(Cladistii_ecoregions_Exmouth_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Exmouth_wkt,"Cladistii_ecoregions_Exmouth_wkt_raw.csv")
# 
# Cladistii_ecoregions_Fiji_wkt_1 <- occurrence("Cladistii", geometry = bbox_ecoregions_Fiji_wkt_1, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Fiji_wkt_1 = data.frame(lapply(Cladistii_ecoregions_Fiji_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Fiji_wkt_1,"Cladistii_ecoregions_Fiji_wkt_raw_1.csv")
# 
# Cladistii_ecoregions_Fiji_wkt_2 <- occurrence("Cladistii", geometry = bbox_ecoregions_Fiji_wkt_2, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Fiji_wkt_2 = data.frame(lapply(Cladistii_ecoregions_Fiji_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Fiji_wkt_2,"Cladistii_ecoregions_Fiji_wkt_raw_2.csv")
# 
# Cladistii_ecoregions_Gilbert_wkt_1 <- occurrence("Cladistii", geometry = bbox_ecoregions_Gilbert_wkt_1, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Gilbert_wkt_1 = data.frame(lapply(Cladistii_ecoregions_Gilbert_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Gilbert_wkt_1,"Cladistii_ecoregions_Gilbert_wkt_raw_1.csv")
# 
# Cladistii_ecoregions_Gilbert_wkt_2 <- occurrence("Cladistii", geometry = bbox_ecoregions_Gilbert_wkt_2, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Gilbert_wkt_2 = data.frame(lapply(Cladistii_ecoregions_Gilbert_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Gilbert_wkt_2,"Cladistii_ecoregions_Gilbert_wkt_raw_2.csv")
# 
# Cladistii_ecoregions_Gilbert_wkt_3 <- occurrence("Cladistii", geometry = bbox_ecoregions_Gilbert_wkt_3, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Gilbert_wkt_3 = data.frame(lapply(Cladistii_ecoregions_Gilbert_wkt_3, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Gilbert_wkt_3,"Cladistii_ecoregions_Gilbert_wkt_raw_3.csv")
# 
# Cladistii_ecoregions_Gulf_of_Papua_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Gulf_of_Papua_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Gulf_of_Papua_wkt = data.frame(lapply(Cladistii_ecoregions_Gulf_of_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Gulf_of_Papua_wkt,"Cladistii_ecoregions_Gulf_of_Papua_wkt_raw.csv")
# 
# Cladistii_ecoregions_Gulf_of_Thailand_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Gulf_of_Thailand_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Gulf_of_Thailand_wkt = data.frame(lapply(Cladistii_ecoregions_Gulf_of_Thailand_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Gulf_of_Thailand_wkt,"Cladistii_ecoregions_Gulf_of_Thailand_wkt_raw.csv")
# 
# Cladistii_ecoregions_Gulf_of_Tonkin_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Gulf_of_Tonkin_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Gulf_of_Tonkin_wkt = data.frame(lapply(Cladistii_ecoregions_Gulf_of_Tonkin_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Gulf_of_Tonkin_wkt,"Cladistii_ecoregions_Gulf_of_Tonkin_wkt_raw.csv")
# 
# Cladistii_ecoregions_Halmahera_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Halmahera_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Halmahera_wkt = data.frame(lapply(Cladistii_ecoregions_Halmahera_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Halmahera_wkt,"Cladistii_ecoregions_Halmahera_wkt_raw.csv")
# 
# Cladistii_ecoregions_Hawaii_wkt_1 <- occurrence("Cladistii", geometry = bbox_ecoregions_Hawaii_wkt_1, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Hawaii_wkt_1 = data.frame(lapply(Cladistii_ecoregions_Hawaii_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Hawaii_wkt_1,"Cladistii_ecoregions_Hawaii_wkt_raw_1.csv")
# 
# Cladistii_ecoregions_Hawaii_wkt_2 <- occurrence("Cladistii", geometry = bbox_ecoregions_Hawaii_wkt_2, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Hawaii_wkt_2 = data.frame(lapply(Cladistii_ecoregions_Hawaii_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Hawaii_wkt_2,"Cladistii_ecoregions_Hawaii_wkt_raw_2.csv")
# 
# Cladistii_ecoregions_Hawaii_wkt_3 <- occurrence("Cladistii", geometry = bbox_ecoregions_Hawaii_wkt_3, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Hawaii_wkt_3 = data.frame(lapply(Cladistii_ecoregions_Hawaii_wkt_3, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Hawaii_wkt_3,"Cladistii_ecoregions_Hawaii_wkt_raw_3.csv")
# 
# Cladistii_ecoregions_Lesser_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Lesser_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Lesser_wkt = data.frame(lapply(Cladistii_ecoregions_Lesser_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Lesser_wkt,"Cladistii_ecoregions_Lesser_wkt_raw.csv")
# 
# Cladistii_ecoregions_Line_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Line_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Line_wkt = data.frame(lapply(Cladistii_ecoregions_Line_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Line_wkt,"Cladistii_ecoregions_Line_wkt_raw.csv")
# 
# Cladistii_ecoregions_Lord_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Lord_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Lord_wkt = data.frame(lapply(Cladistii_ecoregions_Lord_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Lord_wkt,"Cladistii_ecoregions_Lord_wkt_raw.csv")
# 
# Cladistii_ecoregions_Malacca_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Malacca_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Malacca_wkt = data.frame(lapply(Cladistii_ecoregions_Malacca_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Malacca_wkt,"Cladistii_ecoregions_Malacca_wkt_raw.csv")
# 
# Cladistii_ecoregions_Mariana_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Mariana_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Mariana_wkt = data.frame(lapply(Cladistii_ecoregions_Mariana_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Mariana_wkt,"Cladistii_ecoregions_Mariana_wkt_raw.csv")
# 
# Cladistii_ecoregions_Tuamotus_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Tuamotus_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Tuamotus_wkt = data.frame(lapply(Cladistii_ecoregions_Tuamotus_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Tuamotus_wkt,"Cladistii_ecoregions_Tuamotus_wkt_raw.csv")
# 
# Cladistii_ecoregions_Ningaloo_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Ningaloo_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Ningaloo_wkt = data.frame(lapply(Cladistii_ecoregions_Ningaloo_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Ningaloo_wkt,"Cladistii_ecoregions_Ningaloo_wkt_raw.csv")
# 
# Cladistii_ecoregions_Papua_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Papua_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Papua_wkt = data.frame(lapply(Cladistii_ecoregions_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Papua_wkt,"Cladistii_ecoregions_Papua_wkt_raw.csv")
# 
# Cladistii_ecoregions_Solomon_Archipelago_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Solomon_Archipelago_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Solomon_Archipelago_wkt = data.frame(lapply(Cladistii_ecoregions_Solomon_Archipelago_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Solomon_Archipelago_wkt,"Cladistii_ecoregions_Solomon_Archipelago_wkt_raw.csv")
# 
# Cladistii_ecoregions_Solomon_Sea_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Solomon_Sea_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Solomon_Sea_wkt = data.frame(lapply(Cladistii_ecoregions_Solomon_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Solomon_Sea_wkt,"Cladistii_ecoregions_Solomon_Sea_wkt_raw.csv")
# 
Cladistii_ecoregions_Vanuatu_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Vanuatu_wkt, mof = TRUE, dna = TRUE)
Cladistii_ecoregions_Vanuatu_wkt = data.frame(lapply(Cladistii_ecoregions_Vanuatu_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cladistii_ecoregions_Vanuatu_wkt,"Cladistii_ecoregions_Vanuatu_wkt_raw.csv")
# 
# Cladistii_ecoregions_Marquesas_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Marquesas_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Marquesas_wkt = data.frame(lapply(Cladistii_ecoregions_Marquesas_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Marquesas_wkt,"Cladistii_ecoregions_Marquesas_wkt_raw.csv")
# 
# Cladistii_ecoregions_Samoa_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Samoa_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Samoa_wkt = data.frame(lapply(Cladistii_ecoregions_Samoa_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Samoa_wkt,"Cladistii_ecoregions_Samoa_wkt_raw.csv")
# 
# Cladistii_ecoregions_Society_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Society_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Society_wkt = data.frame(lapply(Cladistii_ecoregions_Society_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Society_wkt,"Cladistii_ecoregions_Society_wkt_raw.csv")
# 
# Cladistii_ecoregions_Marshall_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Marshall_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Marshall_wkt = data.frame(lapply(Cladistii_ecoregions_Marshall_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Marshall_wkt,"Cladistii_ecoregions_Marshall_wkt_raw.csv")
# 
# Cladistii_ecoregions_Tonga_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Tonga_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Tonga_wkt = data.frame(lapply(Cladistii_ecoregions_Tonga_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Tonga_wkt,"Cladistii_ecoregions_Tonga_wkt_raw.csv")
# 
# Cladistii_ecoregions_West_Caroline_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_West_Caroline_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_West_Caroline_wkt = data.frame(lapply(Cladistii_ecoregions_West_Caroline_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_West_Caroline_wkt,"Cladistii_ecoregions_West_Caroline_wkt_raw.csv")
# 
Cladistii_ecoregions_New_Caledonia_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_New_Caledonia_wkt, mof = TRUE, dna = TRUE)
Cladistii_ecoregions_New_Caledonia_wkt = data.frame(lapply(Cladistii_ecoregions_New_Caledonia_wkt, as.character), stringsAsFactors=FALSE)
write.csv(Cladistii_ecoregions_New_Caledonia_wkt,"Cladistii_ecoregions_New_Caledonia_wkt_raw.csv")
# 
# Cladistii_ecoregions_Torres_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Torres_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Torres_wkt = data.frame(lapply(Cladistii_ecoregions_Torres_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Torres_wkt,"Cladistii_ecoregions_Torres_wkt_raw.csv")
# 
# Cladistii_ecoregions_Java_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Java_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Java_wkt = data.frame(lapply(Cladistii_ecoregions_Java_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Java_wkt,"Cladistii_ecoregions_Java_wkt_raw.csv")
# 
# Cladistii_ecoregions_Central_Reef_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Central_Reef_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Central_Reef_wkt = data.frame(lapply(Cladistii_ecoregions_Central_Reef_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Central_Reef_wkt,"Cladistii_ecoregions_Central_Reef_wkt_raw.csv")
# 
# Cladistii_ecoregions_Phoenix_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Phoenix_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Phoenix_wkt = data.frame(lapply(Cladistii_ecoregions_Phoenix_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Phoenix_wkt,"Cladistii_ecoregions_Phoenix_wkt_raw.csv")
# 
# Cladistii_ecoregions_Palawan_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Palawan_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Palawan_wkt = data.frame(lapply(Cladistii_ecoregions_Palawan_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Palawan_wkt,"Cladistii_ecoregions_Palawan_wkt_raw.csv")
# 
# Cladistii_ecoregions_Northeast_Sulawesi_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Northeast_Sulawesi_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Northeast_Sulawesi_wkt = data.frame(lapply(Cladistii_ecoregions_Northeast_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Northeast_Sulawesi_wkt,"Cladistii_ecoregions_Northeast_Sulawesi_wkt_raw.csv")
# 
# Cladistii_ecoregions_Sulawesi_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Sulawesi_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Sulawesi_wkt = data.frame(lapply(Cladistii_ecoregions_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Sulawesi_wkt,"Cladistii_ecoregions_Sulawesi_wkt_raw.csv")
# 
# Cladistii_ecoregions_Rapa_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Rapa_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Rapa_wkt = data.frame(lapply(Cladistii_ecoregions_Rapa_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Rapa_wkt,"Cladistii_ecoregions_Rapa_wkt_raw.csv")
# 
# Cladistii_ecoregions_Ogasawara_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Ogasawara_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Ogasawara_wkt = data.frame(lapply(Cladistii_ecoregions_Ogasawara_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Ogasawara_wkt,"Cladistii_ecoregions_Ogasawara_wkt_raw.csv")
# 
# Cladistii_ecoregions_Oceanic_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Oceanic_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Oceanic_wkt = data.frame(lapply(Cladistii_ecoregions_Oceanic_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Oceanic_wkt,"Cladistii_ecoregions_Oceanic_wkt_raw.csv")
# 
# Cladistii_ecoregions_Kuroshio_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Kuroshio_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Kuroshio_wkt = data.frame(lapply(Cladistii_ecoregions_Kuroshio_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Kuroshio_wkt,"Cladistii_ecoregions_Kuroshio_wkt_raw.csv")
# 
# Cladistii_ecoregions_Southeast_Papua_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Southeast_Papua_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Southeast_Papua_wkt = data.frame(lapply(Cladistii_ecoregions_Southeast_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Southeast_Papua_wkt,"Cladistii_ecoregions_Southeast_Papua_wkt_raw.csv")
# 
# Cladistii_ecoregions_Southern_China_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Southern_China_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Southern_China_wkt = data.frame(lapply(Cladistii_ecoregions_Southern_China_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Southern_China_wkt,"Cladistii_ecoregions_Southern_China_wkt_raw.csv")
# 
# Cladistii_ecoregions_Southern_Vietnam_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Southern_Vietnam_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Southern_Vietnam_wkt = data.frame(lapply(Cladistii_ecoregions_Southern_Vietnam_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Southern_Vietnam_wkt,"Cladistii_ecoregions_Southern_Vietnam_wkt_raw.csv")
# 
# Cladistii_ecoregions_Sund_Java_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Sund_Java_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Sund_Java_wkt = data.frame(lapply(Cladistii_ecoregions_Sund_Java_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Sund_Java_wkt,"Cladistii_ecoregions_Sund_Java_wkt_raw.csv")
# 
# Cladistii_ecoregions_Austral_wkt <- occurrence("Cladistii", geometry = bbox_ecoregions_Austral_wkt, mof = TRUE, dna = TRUE)
# Cladistii_ecoregions_Austral_wkt = data.frame(lapply(Cladistii_ecoregions_Austral_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Cladistii_ecoregions_Austral_wkt,"Cladistii_ecoregions_Austral_wkt_raw.csv")

################################################################################
############################### LATIMERIIDAE  ##################################
################################################################################

#Latimeriidae_ecoregions_Arnhem_Coast_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Arnhem_Coast_wkt, mof = TRUE, dna = TRUE)
#Latimeriidae_ecoregions_Arnhem_Coast_wkt = data.frame(lapply(Latimeriidae_ecoregions_Arnhem_Coast_wkt, as.character), stringsAsFactors=FALSE)
#write.csv(Latimeriidae_ecoregions_Arnhem_Coast_wkt,"Latimeriidae_ecoregions_Arnhem_Coast_wkt_raw.csv")

#Latimeriidae_ecoregions_Arafura_Sea_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Arafura_Sea_wkt, mof = TRUE, dna = TRUE)
#Latimeriidae_ecoregions_Arafura_Sea_wkt = data.frame(lapply(Latimeriidae_ecoregions_Arafura_Sea_wkt, as.character), stringsAsFactors=FALSE)
#write.csv(Latimeriidae_ecoregions_Arafura_Sea_wkt,"Latimeriidae_ecoregions_Arafura_Sea_wkt_raw.csv")

#Latimeriidae_ecoregions_Banda_Sea_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Banda_Sea_wkt, mof = TRUE, dna = TRUE)
#Latimeriidae_ecoregions_Banda_Sea_wkt = data.frame(lapply(Latimeriidae_ecoregions_Banda_Sea_wkt, as.character), stringsAsFactors=FALSE)
#write.csv(Latimeriidae_ecoregions_Banda_Sea_wkt,"Latimeriidae_ecoregions_Banda_Sea_wkt_raw.csv")

#Latimeriidae_ecoregions_Bismarck_Sea_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Bismarck_Sea_wkt, mof = TRUE, dna = TRUE)
#Latimeriidae_ecoregions_Bismarck_Sea_wkt = data.frame(lapply(Latimeriidae_ecoregions_Bismarck_Sea_wkt, as.character), stringsAsFactors=FALSE)
#write.csv(Latimeriidae_ecoregions_Bismarck_Sea_wkt,"Latimeriidae_ecoregions_Bismarck_Sea_wkt_raw.csv")

#Latimeriidae_ecoregions_Bonaparte_Coast_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Bonaparte_Coast_wkt, mof = TRUE, dna = TRUE)
#Latimeriidae_ecoregions_Bonaparte_Coast_wkt = data.frame(lapply(Latimeriidae_ecoregions_Bonaparte_Coast_wkt, as.character), stringsAsFactors=FALSE)
#write.csv(Latimeriidae_ecoregions_Bonaparte_Coast_wkt,"Latimeriidae_ecoregions_Bonaparte_Coast_wkt_raw.csv")

#Latimeriidae_ecoregions_Cocos_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Cocos_wkt, mof = TRUE, dna = TRUE)
#Latimeriidae_ecoregions_Cocos_wkt = data.frame(lapply(Latimeriidae_ecoregions_Cocos_wkt, as.character), stringsAsFactors=FALSE)
#write.csv(Latimeriidae_ecoregions_Cocos_wkt,"Latimeriidae_ecoregions_Cocos_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Coral_Sea_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Coral_Sea_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Coral_Sea_wkt = data.frame(lapply(Latimeriidae_ecoregions_Coral_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Coral_Sea_wkt,"Latimeriidae_ecoregions_Coral_Sea_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_East_Caroline_Islands_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_East_Caroline_Islands_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_East_Caroline_Islands_wkt = data.frame(lapply(Latimeriidae_ecoregions_East_Caroline_Islands_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_East_Caroline_Islands_wkt,"Latimeriidae_ecoregions_East_Caroline_Islands_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Easter_Island_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Easter_Island_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Easter_Island_wkt = data.frame(lapply(Latimeriidae_ecoregions_Easter_Island_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Easter_Island_wkt,"Latimeriidae_ecoregions_Easter_Island_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Eastern_Philippines_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Eastern_Philippines_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Eastern_Philippines_wkt = data.frame(lapply(Latimeriidae_ecoregions_Eastern_Philippines_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Eastern_Philippines_wkt,"Latimeriidae_ecoregions_Eastern_Philippines_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Exmouth_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Exmouth_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Exmouth_wkt = data.frame(lapply(Latimeriidae_ecoregions_Exmouth_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Exmouth_wkt,"Latimeriidae_ecoregions_Exmouth_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Fiji_wkt_1 <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Fiji_wkt_1, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Fiji_wkt_1 = data.frame(lapply(Latimeriidae_ecoregions_Fiji_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Fiji_wkt_1,"Latimeriidae_ecoregions_Fiji_wkt_raw_1.csv")
# 
# Latimeriidae_ecoregions_Fiji_wkt_2 <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Fiji_wkt_2, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Fiji_wkt_2 = data.frame(lapply(Latimeriidae_ecoregions_Fiji_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Fiji_wkt_2,"Latimeriidae_ecoregions_Fiji_wkt_raw_2.csv")
# 
# Latimeriidae_ecoregions_Gilbert_wkt_1 <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Gilbert_wkt_1, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Gilbert_wkt_1 = data.frame(lapply(Latimeriidae_ecoregions_Gilbert_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Gilbert_wkt_1,"Latimeriidae_ecoregions_Gilbert_wkt_raw_1.csv")
# 
# Latimeriidae_ecoregions_Gilbert_wkt_2 <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Gilbert_wkt_2, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Gilbert_wkt_2 = data.frame(lapply(Latimeriidae_ecoregions_Gilbert_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Gilbert_wkt_2,"Latimeriidae_ecoregions_Gilbert_wkt_raw_2.csv")
# 
# Latimeriidae_ecoregions_Gilbert_wkt_3 <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Gilbert_wkt_3, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Gilbert_wkt_3 = data.frame(lapply(Latimeriidae_ecoregions_Gilbert_wkt_3, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Gilbert_wkt_3,"Latimeriidae_ecoregions_Gilbert_wkt_raw_3.csv")
# 
# Latimeriidae_ecoregions_Gulf_of_Papua_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Gulf_of_Papua_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Gulf_of_Papua_wkt = data.frame(lapply(Latimeriidae_ecoregions_Gulf_of_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Gulf_of_Papua_wkt,"Latimeriidae_ecoregions_Gulf_of_Papua_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Gulf_of_Thailand_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Gulf_of_Thailand_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Gulf_of_Thailand_wkt = data.frame(lapply(Latimeriidae_ecoregions_Gulf_of_Thailand_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Gulf_of_Thailand_wkt,"Latimeriidae_ecoregions_Gulf_of_Thailand_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Gulf_of_Tonkin_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Gulf_of_Tonkin_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Gulf_of_Tonkin_wkt = data.frame(lapply(Latimeriidae_ecoregions_Gulf_of_Tonkin_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Gulf_of_Tonkin_wkt,"Latimeriidae_ecoregions_Gulf_of_Tonkin_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Halmahera_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Halmahera_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Halmahera_wkt = data.frame(lapply(Latimeriidae_ecoregions_Halmahera_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Halmahera_wkt,"Latimeriidae_ecoregions_Halmahera_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Hawaii_wkt_1 <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Hawaii_wkt_1, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Hawaii_wkt_1 = data.frame(lapply(Latimeriidae_ecoregions_Hawaii_wkt_1, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Hawaii_wkt_1,"Latimeriidae_ecoregions_Hawaii_wkt_raw_1.csv")
# 
# Latimeriidae_ecoregions_Hawaii_wkt_2 <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Hawaii_wkt_2, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Hawaii_wkt_2 = data.frame(lapply(Latimeriidae_ecoregions_Hawaii_wkt_2, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Hawaii_wkt_2,"Latimeriidae_ecoregions_Hawaii_wkt_raw_2.csv")
# 
# Latimeriidae_ecoregions_Hawaii_wkt_3 <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Hawaii_wkt_3, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Hawaii_wkt_3 = data.frame(lapply(Latimeriidae_ecoregions_Hawaii_wkt_3, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Hawaii_wkt_3,"Latimeriidae_ecoregions_Hawaii_wkt_raw_3.csv")
# 
# Latimeriidae_ecoregions_Lesser_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Lesser_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Lesser_wkt = data.frame(lapply(Latimeriidae_ecoregions_Lesser_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Lesser_wkt,"Latimeriidae_ecoregions_Lesser_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Line_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Line_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Line_wkt = data.frame(lapply(Latimeriidae_ecoregions_Line_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Line_wkt,"Latimeriidae_ecoregions_Line_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Lord_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Lord_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Lord_wkt = data.frame(lapply(Latimeriidae_ecoregions_Lord_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Lord_wkt,"Latimeriidae_ecoregions_Lord_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Malacca_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Malacca_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Malacca_wkt = data.frame(lapply(Latimeriidae_ecoregions_Malacca_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Malacca_wkt,"Latimeriidae_ecoregions_Malacca_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Mariana_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Mariana_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Mariana_wkt = data.frame(lapply(Latimeriidae_ecoregions_Mariana_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Mariana_wkt,"Latimeriidae_ecoregions_Mariana_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Tuamotus_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Tuamotus_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Tuamotus_wkt = data.frame(lapply(Latimeriidae_ecoregions_Tuamotus_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Tuamotus_wkt,"Latimeriidae_ecoregions_Tuamotus_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Ningaloo_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Ningaloo_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Ningaloo_wkt = data.frame(lapply(Latimeriidae_ecoregions_Ningaloo_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Ningaloo_wkt,"Latimeriidae_ecoregions_Ningaloo_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Papua_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Papua_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Papua_wkt = data.frame(lapply(Latimeriidae_ecoregions_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Papua_wkt,"Latimeriidae_ecoregions_Papua_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Solomon_Archipelago_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Solomon_Archipelago_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Solomon_Archipelago_wkt = data.frame(lapply(Latimeriidae_ecoregions_Solomon_Archipelago_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Solomon_Archipelago_wkt,"Latimeriidae_ecoregions_Solomon_Archipelago_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Solomon_Sea_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Solomon_Sea_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Solomon_Sea_wkt = data.frame(lapply(Latimeriidae_ecoregions_Solomon_Sea_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Solomon_Sea_wkt,"Latimeriidae_ecoregions_Solomon_Sea_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Vanuatu_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Vanuatu_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Vanuatu_wkt = data.frame(lapply(Latimeriidae_ecoregions_Vanuatu_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Vanuatu_wkt,"Latimeriidae_ecoregions_Vanuatu_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Marquesas_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Marquesas_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Marquesas_wkt = data.frame(lapply(Latimeriidae_ecoregions_Marquesas_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Marquesas_wkt,"Latimeriidae_ecoregions_Marquesas_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Samoa_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Samoa_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Samoa_wkt = data.frame(lapply(Latimeriidae_ecoregions_Samoa_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Samoa_wkt,"Latimeriidae_ecoregions_Samoa_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Society_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Society_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Society_wkt = data.frame(lapply(Latimeriidae_ecoregions_Society_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Society_wkt,"Latimeriidae_ecoregions_Society_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Marshall_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Marshall_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Marshall_wkt = data.frame(lapply(Latimeriidae_ecoregions_Marshall_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Marshall_wkt,"Latimeriidae_ecoregions_Marshall_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Tonga_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Tonga_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Tonga_wkt = data.frame(lapply(Latimeriidae_ecoregions_Tonga_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Tonga_wkt,"Latimeriidae_ecoregions_Tonga_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_West_Caroline_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_West_Caroline_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_West_Caroline_wkt = data.frame(lapply(Latimeriidae_ecoregions_West_Caroline_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_West_Caroline_wkt,"Latimeriidae_ecoregions_West_Caroline_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_New_Caledonia_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_New_Caledonia_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_New_Caledonia_wkt = data.frame(lapply(Latimeriidae_ecoregions_New_Caledonia_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_New_Caledonia_wkt,"Latimeriidae_ecoregions_New_Caledonia_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Torres_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Torres_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Torres_wkt = data.frame(lapply(Latimeriidae_ecoregions_Torres_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Torres_wkt,"Latimeriidae_ecoregions_Torres_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Java_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Java_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Java_wkt = data.frame(lapply(Latimeriidae_ecoregions_Java_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Java_wkt,"Latimeriidae_ecoregions_Java_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Central_Reef_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Central_Reef_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Central_Reef_wkt = data.frame(lapply(Latimeriidae_ecoregions_Central_Reef_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Central_Reef_wkt,"Latimeriidae_ecoregions_Central_Reef_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Phoenix_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Phoenix_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Phoenix_wkt = data.frame(lapply(Latimeriidae_ecoregions_Phoenix_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Phoenix_wkt,"Latimeriidae_ecoregions_Phoenix_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Palawan_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Palawan_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Palawan_wkt = data.frame(lapply(Latimeriidae_ecoregions_Palawan_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Palawan_wkt,"Latimeriidae_ecoregions_Palawan_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Northeast_Sulawesi_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Northeast_Sulawesi_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Northeast_Sulawesi_wkt = data.frame(lapply(Latimeriidae_ecoregions_Northeast_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Northeast_Sulawesi_wkt,"Latimeriidae_ecoregions_Northeast_Sulawesi_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Sulawesi_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Sulawesi_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Sulawesi_wkt = data.frame(lapply(Latimeriidae_ecoregions_Sulawesi_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Sulawesi_wkt,"Latimeriidae_ecoregions_Sulawesi_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Rapa_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Rapa_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Rapa_wkt = data.frame(lapply(Latimeriidae_ecoregions_Rapa_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Rapa_wkt,"Latimeriidae_ecoregions_Rapa_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Ogasawara_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Ogasawara_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Ogasawara_wkt = data.frame(lapply(Latimeriidae_ecoregions_Ogasawara_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Ogasawara_wkt,"Latimeriidae_ecoregions_Ogasawara_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Oceanic_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Oceanic_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Oceanic_wkt = data.frame(lapply(Latimeriidae_ecoregions_Oceanic_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Oceanic_wkt,"Latimeriidae_ecoregions_Oceanic_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Kuroshio_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Kuroshio_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Kuroshio_wkt = data.frame(lapply(Latimeriidae_ecoregions_Kuroshio_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Kuroshio_wkt,"Latimeriidae_ecoregions_Kuroshio_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Southeast_Papua_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Southeast_Papua_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Southeast_Papua_wkt = data.frame(lapply(Latimeriidae_ecoregions_Southeast_Papua_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Southeast_Papua_wkt,"Latimeriidae_ecoregions_Southeast_Papua_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Southern_China_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Southern_China_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Southern_China_wkt = data.frame(lapply(Latimeriidae_ecoregions_Southern_China_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Southern_China_wkt,"Latimeriidae_ecoregions_Southern_China_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Southern_Vietnam_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Southern_Vietnam_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Southern_Vietnam_wkt = data.frame(lapply(Latimeriidae_ecoregions_Southern_Vietnam_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Southern_Vietnam_wkt,"Latimeriidae_ecoregions_Southern_Vietnam_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Sund_Java_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Sund_Java_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Sund_Java_wkt = data.frame(lapply(Latimeriidae_ecoregions_Sund_Java_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Sund_Java_wkt,"Latimeriidae_ecoregions_Sund_Java_wkt_raw.csv")
# 
# Latimeriidae_ecoregions_Austral_wkt <- occurrence("Latimeriidae", geometry = bbox_ecoregions_Austral_wkt, mof = TRUE, dna = TRUE)
# Latimeriidae_ecoregions_Austral_wkt = data.frame(lapply(Latimeriidae_ecoregions_Austral_wkt, as.character), stringsAsFactors=FALSE)
# write.csv(Latimeriidae_ecoregions_Austral_wkt,"Latimeriidae_ecoregions_Austral_wkt_raw.csv")
# 

#Save the workspace
save.image(file = "occurrences_fish.RData")


################################################################################
################################################################################
################################################################################