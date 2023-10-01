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
.packages = c("tidyverse", "worms", "obistools", "mregions", "sf", "leaflet", 
              "dplyr", "data.table", "gdata", "rfishbase", "readxl", "taxize", 
              "Orcs", "usefun", "RSQLite", "DBI", "rredlist")

# Install CRAN packages (if not already installed)
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])

# Load packages into session 
lapply(.packages, require, character.only=TRUE)

packageVersion("tidyverse")
packageVersion("worms")
packageVersion("obistools")
packageVersion("mregions")
packageVersion("sf")
packageVersion("leaflet")
packageVersion("dplyr")
packageVersion("data.table")
packageVersion("gdata")
packageVersion("rfishbase")
packageVersion("readxl")
packageVersion("taxize")
packageVersion("Orcs")
packageVersion("usefun")
packageVersion("RSQLite")
packageVersion("DBI")
packageVersion("rredlist")

remotes::install_github("ropensci/worrms")
library("worrms")
packageVersion("worrms")

################################################################################
########################### LOAD WORKSPACE #####################################
################################################################################

load(file = "occurrences_fish.RData")

################################################################################
####################### READ OBIS FISH LISTS ###################################
################################################################################

Fish_Arnhem_Coast <- rbind.fill(Teleostei_ecoregions_Arnhem_Coast_wkt, 
                                Elasmobranchii_ecoregions_Arnhem_Coast_wkt, Holocephali_ecoregions_Arnhem_Coast_wkt)
Fish_Arnhem_Coast <- Fish_Arnhem_Coast %>% mutate(ECOREGION = "Arnhem Coast to Gulf of Carpenteria")
write.csv(Fish_Arnhem_Coast,"Fish_Arnhem_Coast.csv")
Fish_Arnhem_Coast <- Fish_Arnhem_Coast %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Arnhem_Coast$aphiaID))
Fish_Arnhem_Coast <- select(Fish_Arnhem_Coast, scientificName, aphiaID, ECOREGION)
Fish_Arnhem_Coast <- unique(Fish_Arnhem_Coast)

Fish_Arafura_Sea <- rbind.fill(Teleostei_ecoregions_Arafura_Sea_wkt, 
                               Elasmobranchii_ecoregions_Arafura_Sea_wkt, Holocephali_ecoregions_Arafura_Sea_wkt)
Fish_Arafura_Sea <- Fish_Arafura_Sea %>% mutate(ECOREGION = "Arafura Sea")
write.csv(Fish_Arafura_Sea,"Fish_Arafura_Sea.csv")
Fish_Arafura_Sea <- Fish_Arafura_Sea %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Arafura_Sea$aphiaID))
Fish_Arafura_Sea <- select(Fish_Arafura_Sea, scientificName, aphiaID, ECOREGION)
Fish_Arafura_Sea <- unique(Fish_Arafura_Sea)

Fish_Banda_Sea <- rbind.fill(Teleostei_ecoregions_Banda_Sea_wkt, 
                             Elasmobranchii_ecoregions_Banda_Sea_wkt, Holocephali_ecoregions_Banda_Sea_wkt)
Fish_Banda_Sea <- Fish_Banda_Sea %>% mutate(ECOREGION = "Banda Sea")
write.csv(Fish_Banda_Sea,"Fish_Banda_Sea.csv")
Fish_Banda_Sea <- Fish_Banda_Sea %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Banda_Sea$aphiaID))
Fish_Banda_Sea <- select(Fish_Banda_Sea, scientificName, aphiaID, ECOREGION)
Fish_Banda_Sea <- unique(Fish_Banda_Sea)

Fish_Bismarck_Sea <- rbind.fill(Teleostei_ecoregions_Bismarck_Sea_wkt, 
                                Elasmobranchii_ecoregions_Bismarck_Sea_wkt, 
                                Cyclostomi_ecoregions_Bismarck_Sea_wkt)
Fish_Bismarck_Sea <- Fish_Bismarck_Sea %>% mutate(ECOREGION = "Bismarck Sea")
write.csv(Fish_Bismarck_Sea,"Fish_Bismarck_Sea.csv")
Fish_Bismarck_Sea <- Fish_Bismarck_Sea %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Bismarck_Sea$aphiaID))
Fish_Bismarck_Sea <- select(Fish_Bismarck_Sea, scientificName, aphiaID, ECOREGION)
Fish_Bismarck_Sea <- unique(Fish_Bismarck_Sea)

Fish_Bonaparte_Coast <- rbind.fill(Teleostei_ecoregions_Bonaparte_Coast_wkt, 
                                   Elasmobranchii_ecoregions_Bonaparte_Coast_wkt, Holocephali_ecoregions_Bonaparte_Coast_wkt, 
                                   Cyclostomi_ecoregions_Bonaparte_Coast_wkt)
Fish_Bonaparte_Coast <- Fish_Bonaparte_Coast %>% mutate(ECOREGION = "Bonaparte Coast")
write.csv(Fish_Bonaparte_Coast,"Fish_Bonaparte_Coast.csv")
Fish_Bonaparte_Coast <- Fish_Bonaparte_Coast %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Bonaparte_Coast$aphiaID))
Fish_Bonaparte_Coast <- select(Fish_Bonaparte_Coast, scientificName, aphiaID, ECOREGION)
Fish_Bonaparte_Coast <- unique(Fish_Bonaparte_Coast)

Fish_Cocos <- rbind.fill(Teleostei_ecoregions_Cocos_wkt, 
                         Elasmobranchii_ecoregions_Cocos_wkt)
Fish_Cocos <- Fish_Cocos %>% mutate(ECOREGION = "Cocos-Keeling/Christmas Island")
write.csv(Fish_Cocos,"Fish_Cocos.csv")
Fish_Cocos <- Fish_Cocos %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Cocos$aphiaID))
Fish_Cocos <- select(Fish_Cocos, scientificName, aphiaID, ECOREGION)
Fish_Cocos <- unique(Fish_Cocos)

Fish_Coral_Sea <- rbind.fill(Teleostei_ecoregions_Coral_Sea_wkt, 
                             Elasmobranchii_ecoregions_Coral_Sea_wkt, Holocephali_ecoregions_Coral_Sea_wkt, 
                             Cyclostomi_ecoregions_Coral_Sea_wkt)
Fish_Coral_Sea <- Fish_Coral_Sea %>% mutate(ECOREGION = "Coral Sea")
write.csv(Fish_Coral_Sea,"Fish_Coral_Sea.csv")
Fish_Coral_Sea <- Fish_Coral_Sea %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Coral_Sea$aphiaID))
Fish_Coral_Sea <- select(Fish_Coral_Sea, scientificName, aphiaID, ECOREGION)
Fish_Coral_Sea <- unique(Fish_Coral_Sea)


Fish_East_Caroline_Islands <- rbind.fill(Teleostei_ecoregions_East_Caroline_Islands_wkt, 
                                         Elasmobranchii_ecoregions_East_Caroline_Islands_wkt)
Fish_East_Caroline_Islands <- Fish_East_Caroline_Islands %>% mutate(ECOREGION = "East Caroline Islands")
write.csv(Fish_East_Caroline_Islands,"Fish_East_Caroline_Islands.csv")
Fish_East_Caroline_Islands <- Fish_East_Caroline_Islands %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_East_Caroline_Islands$aphiaID))
Fish_East_Caroline_Islands <- select(Fish_East_Caroline_Islands, scientificName, aphiaID, ECOREGION)
Fish_East_Caroline_Islands <- unique(Fish_East_Caroline_Islands)

Fish_Easter_Island <- rbind.fill(Teleostei_ecoregions_Easter_Island_wkt, 
                                 Elasmobranchii_ecoregions_Easter_Island_wkt)
Fish_Easter_Island <- Fish_Easter_Island %>% mutate(ECOREGION = "Easter Island")
write.csv(Fish_Easter_Island,"Fish_Easter_Island.csv")
Fish_Easter_Island <- Fish_Easter_Island %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Easter_Island$aphiaID))
Fish_Easter_Island <- select(Fish_Easter_Island, scientificName, aphiaID, ECOREGION)
Fish_Easter_Island <- unique(Fish_Easter_Island)

Fish_Eastern_Philippines <- rbind.fill(Teleostei_ecoregions_Eastern_Philippines_wkt, 
                                       Elasmobranchii_ecoregions_Eastern_Philippines_wkt, Holocephali_ecoregions_Eastern_Philippines_wkt, 
                                       Cyclostomi_ecoregions_Eastern_Philippines_wkt)
Fish_Eastern_Philippines <- Fish_Eastern_Philippines %>% mutate(ECOREGION = "Eastern Philippines")
write.csv(Fish_Eastern_Philippines,"Fish_Eastern_Philippines.csv")
Fish_Eastern_Philippines <- Fish_Eastern_Philippines %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Eastern_Philippines$aphiaID))
Fish_Eastern_Philippines <- select(Fish_Eastern_Philippines, scientificName, aphiaID, ECOREGION)
Fish_Eastern_Philippines <- unique(Fish_Eastern_Philippines)

Fish_Exmouth <- rbind.fill(Teleostei_ecoregions_Exmouth_wkt, 
                           Elasmobranchii_ecoregions_Exmouth_wkt, Holocephali_ecoregions_Exmouth_wkt, 
                           Cyclostomi_ecoregions_Exmouth_wkt)
Fish_Exmouth <- Fish_Exmouth %>% mutate(ECOREGION = "Exmouth to Broome")
write.csv(Fish_Exmouth,"Fish_Exmouth.csv")
Fish_Exmouth <- Fish_Exmouth %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Exmouth$aphiaID))
Fish_Exmouth <- select(Fish_Exmouth, scientificName, aphiaID, ECOREGION)
Fish_Exmouth <- unique(Fish_Exmouth)

Fish_Gulf_of_Papua <- rbind.fill(Teleostei_ecoregions_Gulf_of_Papua_wkt, 
                                 Elasmobranchii_ecoregions_Gulf_of_Papua_wkt)
Fish_Gulf_of_Papua <- Fish_Gulf_of_Papua %>% mutate(ECOREGION = "Gulf of Papua")
write.csv(Fish_Gulf_of_Papua,"Fish_Gulf_of_Papua.csv")
Fish_Gulf_of_Papua <- Fish_Gulf_of_Papua %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Gulf_of_Papua$aphiaID))
Fish_Gulf_of_Papua <- select(Fish_Gulf_of_Papua, scientificName, aphiaID, ECOREGION)
Fish_Gulf_of_Papua <- unique(Fish_Gulf_of_Papua)

Fish_Gulf_of_Thailand <- rbind.fill(Teleostei_ecoregions_Gulf_of_Thailand_wkt, 
                                    Elasmobranchii_ecoregions_Gulf_of_Thailand_wkt)
Fish_Gulf_of_Thailand <- Fish_Gulf_of_Thailand %>% mutate(ECOREGION = "Gulf of Thailand")
write.csv(Fish_Gulf_of_Thailand,"Fish_Gulf_of_Thailand.csv")
Fish_Gulf_of_Thailand <- Fish_Gulf_of_Thailand %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Gulf_of_Thailand$aphiaID))
Fish_Gulf_of_Thailand <- select(Fish_Gulf_of_Thailand, scientificName, aphiaID, ECOREGION)
Fish_Gulf_of_Thailand <- unique(Fish_Gulf_of_Thailand)

Fish_Gulf_of_Tonkin <- rbind.fill(Teleostei_ecoregions_Gulf_of_Tonkin_wkt, 
                                  Elasmobranchii_ecoregions_Gulf_of_Tonkin_wkt)
Fish_Gulf_of_Tonkin <- Fish_Gulf_of_Tonkin %>% mutate(ECOREGION = "Gulf of Tonkin")
write.csv(Fish_Gulf_of_Tonkin,"Fish_Gulf_of_Tonkin.csv")
Fish_Gulf_of_Tonkin <- Fish_Gulf_of_Tonkin %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Gulf_of_Tonkin$aphiaID))
Fish_Gulf_of_Tonkin <- select(Fish_Gulf_of_Tonkin, scientificName, aphiaID, ECOREGION)
Fish_Gulf_of_Tonkin <- unique(Fish_Gulf_of_Tonkin)

Fish_Halmahera <- rbind.fill(Teleostei_ecoregions_Halmahera_wkt, 
                             Elasmobranchii_ecoregions_Halmahera_wkt)
Fish_Halmahera <- Fish_Halmahera %>% mutate(ECOREGION = "Halmahera")
write.csv(Fish_Halmahera,"Fish_Halmahera.csv")
Fish_Halmahera <- Fish_Halmahera %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Halmahera$aphiaID))
Fish_Halmahera <- select(Fish_Halmahera, scientificName, aphiaID, ECOREGION)
Fish_Halmahera <- unique(Fish_Halmahera)

Fish_Lesser <- rbind.fill(Teleostei_ecoregions_Lesser_wkt, 
                          Elasmobranchii_ecoregions_Lesser_wkt, Holocephali_ecoregions_Lesser_wkt)
Fish_Lesser <- Fish_Lesser %>% mutate(ECOREGION = "Lesser Sunda")
write.csv(Fish_Lesser,"Fish_Lesser.csv")
Fish_Lesser <- Fish_Lesser %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Lesser$aphiaID))
Fish_Lesser <- select(Fish_Lesser, scientificName, aphiaID, ECOREGION)
Fish_Lesser <- unique(Fish_Lesser)


Fish_Line <- rbind.fill(Teleostei_ecoregions_Line_wkt, 
                        Elasmobranchii_ecoregions_Line_wkt)
Fish_Line <- Fish_Line %>% mutate(ECOREGION = "Line Islands")
write.csv(Fish_Line,"Fish_Line.csv")
Fish_Line <- Fish_Line %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Line$aphiaID))
Fish_Line <- select(Fish_Line, scientificName, aphiaID, ECOREGION)
Fish_Line <- unique(Fish_Line)

Fish_Lord <- rbind.fill(Teleostei_ecoregions_Lord_wkt, 
                        Elasmobranchii_ecoregions_Lord_wkt, Holocephali_ecoregions_Lord_wkt)
Fish_Lord <- Fish_Lord %>% mutate(ECOREGION = "Lord Howe and Norfolk Islands")
write.csv(Fish_Lord,"Fish_Lord.csv")
Fish_Lord <- Fish_Lord %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Lord$aphiaID))
Fish_Lord <- select(Fish_Lord, scientificName, aphiaID, ECOREGION)
Fish_Lord <- unique(Fish_Lord)

Fish_Malacca <- rbind.fill(Teleostei_ecoregions_Malacca_wkt, 
                           Elasmobranchii_ecoregions_Malacca_wkt, 
                           Cyclostomi_ecoregions_Malacca_wkt)
Fish_Malacca <- Fish_Malacca %>% mutate(ECOREGION = "Malacca Strait")
write.csv(Fish_Malacca,"Fish_Malacca.csv")
Fish_Malacca <- Fish_Malacca %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Malacca$aphiaID))
Fish_Malacca <- select(Fish_Malacca, scientificName, aphiaID, ECOREGION)
Fish_Malacca <- unique(Fish_Malacca)

Fish_Mariana <- rbind.fill(Teleostei_ecoregions_Mariana_wkt, 
                           Elasmobranchii_ecoregions_Mariana_wkt, 
                           Cyclostomi_ecoregions_Mariana_wkt)
Fish_Mariana <- Fish_Mariana %>% mutate(ECOREGION = "Mariana Islands")
write.csv(Fish_Mariana,"Fish_Mariana.csv")
Fish_Mariana <- Fish_Mariana %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Mariana$aphiaID))
Fish_Mariana <- select(Fish_Mariana, scientificName, aphiaID, ECOREGION)
Fish_Mariana <- unique(Fish_Mariana)

Fish_Tuamotus <- rbind.fill(Teleostei_ecoregions_Tuamotus_wkt, 
                            Elasmobranchii_ecoregions_Tuamotus_wkt)
Fish_Tuamotus <- Fish_Tuamotus %>% mutate(ECOREGION = "Tuamotus")
write.csv(Fish_Tuamotus,"Fish_Tuamotus.csv")
Fish_Tuamotus <- Fish_Tuamotus %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Tuamotus$aphiaID))
Fish_Tuamotus <- select(Fish_Tuamotus, scientificName, aphiaID, ECOREGION)
Fish_Tuamotus <- unique(Fish_Tuamotus)

Fish_Marshall <- rbind.fill(Teleostei_ecoregions_Marshall_wkt, 
                            Elasmobranchii_ecoregions_Marshall_wkt)
Fish_Marshall <- Fish_Marshall %>% mutate(ECOREGION = "Marshall Islands")
write.csv(Fish_Marshall,"Fish_Marshall.csv")
Fish_Marshall <- Fish_Marshall %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Marshall$aphiaID))
Fish_Marshall <- select(Fish_Marshall, scientificName, aphiaID, ECOREGION)
Fish_Marshall <- unique(Fish_Marshall)

Fish_New_Caledonia <- rbind.fill(Teleostei_ecoregions_New_Caledonia_wkt, 
                                 Elasmobranchii_ecoregions_New_Caledonia_wkt, Holocephali_ecoregions_New_Caledonia_wkt, 
                                 Cladistii_ecoregions_New_Caledonia_wkt)
Fish_New_Caledonia <- Fish_New_Caledonia %>% mutate(ECOREGION = "New Caledonia")
write.csv(Fish_New_Caledonia,"Fish_New_Caledonia.csv")
Fish_New_Caledonia <- Fish_New_Caledonia %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_New_Caledonia$aphiaID))
Fish_New_Caledonia <- select(Fish_New_Caledonia, scientificName, aphiaID, ECOREGION)
Fish_New_Caledonia <- unique(Fish_New_Caledonia)

Fish_Ningaloo <- rbind.fill(Teleostei_ecoregions_Ningaloo_wkt,  
                            Elasmobranchii_ecoregions_Ningaloo_wkt, Holocephali_ecoregions_Ningaloo_wkt)
Fish_Ningaloo <- Fish_Ningaloo %>% mutate(ECOREGION = "Ningaloo")
write.csv(Fish_Ningaloo,"Fish_Ningaloo.csv")
Fish_Ningaloo <- Fish_Ningaloo %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Ningaloo$aphiaID))
Fish_Ningaloo <- select(Fish_Ningaloo, scientificName, aphiaID, ECOREGION)
Fish_Ningaloo <- unique(Fish_Ningaloo)

Fish_Ogasawara <- rbind.fill(Teleostei_ecoregions_Ogasawara_wkt, 
                             Elasmobranchii_ecoregions_Ogasawara_wkt, Holocephali_ecoregions_Ogasawara_wkt, 
                             Cyclostomi_ecoregions_Ogasawara_wkt)
Fish_Ogasawara <- Fish_Ogasawara %>% mutate(ECOREGION = "Ogasawara Islands")
write.csv(Fish_Ogasawara,"Fish_Ogasawara.csv")
Fish_Ogasawara <- Fish_Ogasawara %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Ogasawara$aphiaID))
Fish_Ogasawara <- select(Fish_Ogasawara, scientificName, aphiaID, ECOREGION)
Fish_Ogasawara <- unique(Fish_Ogasawara)

Fish_Northeast_Sulawesi <- rbind.fill(Teleostei_ecoregions_Northeast_Sulawesi_wkt, 
                                      Elasmobranchii_ecoregions_Northeast_Sulawesi_wkt)
Fish_Northeast_Sulawesi <- Fish_Northeast_Sulawesi %>% mutate(ECOREGION = "Northeast Sulawesi")
write.csv(Fish_Northeast_Sulawesi,"Fish_Northeast_Sulawesi.csv")
Fish_Northeast_Sulawesi <- Fish_Northeast_Sulawesi %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Northeast_Sulawesi$aphiaID))
Fish_Northeast_Sulawesi <- select(Fish_Northeast_Sulawesi, scientificName, aphiaID, ECOREGION)
Fish_Northeast_Sulawesi <- unique(Fish_Northeast_Sulawesi)

Fish_Marquesas <- rbind.fill(Teleostei_ecoregions_Marquesas_wkt, 
                             Elasmobranchii_ecoregions_Marquesas_wkt)
Fish_Marquesas <- Fish_Marquesas %>% mutate(ECOREGION = "Marquesas")
write.csv(Fish_Marquesas,"Fish_Marquesas.csv")
Fish_Marquesas <- Fish_Marquesas %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Marquesas$aphiaID))
Fish_Marquesas <- select(Fish_Marquesas, scientificName, aphiaID, ECOREGION)
Fish_Marquesas <- unique(Fish_Marquesas)

Fish_Vanuatu <- rbind.fill(Teleostei_ecoregions_Vanuatu_wkt, 
                           Elasmobranchii_ecoregions_Vanuatu_wkt, Holocephali_ecoregions_Vanuatu_wkt, 
                           Cladistii_ecoregions_Vanuatu_wkt)
Fish_Vanuatu <- Fish_Vanuatu %>% mutate(ECOREGION = "Vanuatu")
write.csv(Fish_Vanuatu,"Fish_Vanuatu.csv")
Fish_Vanuatu <- Fish_Vanuatu %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Vanuatu$aphiaID))
Fish_Vanuatu <- select(Fish_Vanuatu, scientificName, aphiaID, ECOREGION)
Fish_Vanuatu <- unique(Fish_Vanuatu)

Fish_Papua <- rbind.fill(Teleostei_ecoregions_Papua_wkt, 
                         Elasmobranchii_ecoregions_Papua_wkt)
Fish_Papua <- Fish_Papua %>% mutate(ECOREGION = "Papua")
write.csv(Fish_Papua,"Fish_Papua.csv")
Fish_Papua <- Fish_Papua %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Papua$aphiaID))
Fish_Papua <- select(Fish_Papua, scientificName, aphiaID, ECOREGION)
Fish_Papua <- unique(Fish_Papua)

Fish_Solomon_Archipelago <- rbind.fill(Teleostei_ecoregions_Solomon_Archipelago_wkt, 
                                       Elasmobranchii_ecoregions_Solomon_Archipelago_wkt)
Fish_Solomon_Archipelago <- Fish_Solomon_Archipelago %>% mutate(ECOREGION = "Solomon Archipelago")
write.csv(Fish_Solomon_Archipelago,"Fish_Solomon_Archipelago.csv")
Fish_Solomon_Archipelago <- Fish_Solomon_Archipelago %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Solomon_Archipelago$aphiaID))
Fish_Solomon_Archipelago <- select(Fish_Solomon_Archipelago, scientificName, aphiaID, ECOREGION)
Fish_Solomon_Archipelago <- unique(Fish_Solomon_Archipelago)

Fish_Solomon_Sea <- rbind.fill(Teleostei_ecoregions_Solomon_Sea_wkt, 
                               Elasmobranchii_ecoregions_Solomon_Sea_wkt)
Fish_Solomon_Sea <- Fish_Solomon_Sea %>% mutate(ECOREGION = "Solomon Sea")
write.csv(Fish_Solomon_Sea,"Fish_Solomon_Sea.csv")
Fish_Solomon_Sea <- Fish_Solomon_Sea %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Solomon_Sea$aphiaID))
Fish_Solomon_Sea <- select(Fish_Solomon_Sea, scientificName, aphiaID, ECOREGION)
Fish_Solomon_Sea <- unique(Fish_Solomon_Sea)

Fish_Palawan <- rbind.fill(Teleostei_ecoregions_Palawan_wkt, 
                           Elasmobranchii_ecoregions_Palawan_wkt, Holocephali_ecoregions_Palawan_wkt, 
                           Cyclostomi_ecoregions_Palawan_wkt)
Fish_Palawan <- Fish_Palawan %>% mutate(ECOREGION = "Palawan/North Borneo")
write.csv(Fish_Palawan,"Fish_Palawan.csv")
Fish_Palawan <- Fish_Palawan %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Palawan$aphiaID))
Fish_Palawan <- select(Fish_Palawan, scientificName, aphiaID, ECOREGION)
Fish_Palawan <- unique(Fish_Palawan)

Fish_Samoa <- rbind.fill(Teleostei_ecoregions_Samoa_wkt, 
                         Elasmobranchii_ecoregions_Samoa_wkt)
Fish_Samoa <- Fish_Samoa %>% mutate(ECOREGION = "Samoa Islands")
write.csv(Fish_Samoa,"Fish_Samoa.csv")
Fish_Samoa <- Fish_Samoa %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Samoa$aphiaID))
Fish_Samoa <- select(Fish_Samoa, scientificName, aphiaID, ECOREGION)
Fish_Samoa <- unique(Fish_Samoa)

Fish_Society <- rbind.fill(Teleostei_ecoregions_Society_wkt, 
                           Elasmobranchii_ecoregions_Society_wkt)
Fish_Society <- Fish_Society %>% mutate(ECOREGION = "Society Islands")
write.csv(Fish_Society,"Fish_Society.csv")
Fish_Society <- Fish_Society %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Society$aphiaID))
Fish_Society <- select(Fish_Society, scientificName, aphiaID, ECOREGION)
Fish_Society <- unique(Fish_Society)

Fish_Rapa <- rbind.fill(Teleostei_ecoregions_Rapa_wkt, 
                        Elasmobranchii_ecoregions_Rapa_wkt, 
                        Cyclostomi_ecoregions_Rapa_wkt)
Fish_Rapa <- Fish_Rapa %>% mutate(ECOREGION = "Rapa-Pitcairn")
write.csv(Fish_Rapa,"Fish_Rapa.csv")
Fish_Rapa <- Fish_Rapa %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Rapa$aphiaID))
Fish_Rapa <- select(Fish_Rapa, scientificName, aphiaID, ECOREGION)
Fish_Rapa <- unique(Fish_Rapa)

Fish_Oceanic <- rbind.fill(Teleostei_ecoregions_Oceanic_wkt, 
                           Elasmobranchii_ecoregions_Oceanic_wkt, Holocephali_ecoregions_Oceanic_wkt, 
                           Cyclostomi_ecoregions_Oceanic_wkt)
Fish_Oceanic <- Fish_Oceanic %>% mutate(ECOREGION = "South China Sea Oceanic Islands")
write.csv(Fish_Oceanic,"Fish_Oceanic.csv")
Fish_Oceanic <- Fish_Oceanic %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Oceanic$aphiaID))
Fish_Oceanic <- select(Fish_Oceanic, scientificName, aphiaID, ECOREGION)
Fish_Oceanic <- unique(Fish_Oceanic)

Fish_Kuroshio <- rbind.fill(Teleostei_ecoregions_Kuroshio_wkt, 
                            Elasmobranchii_ecoregions_Kuroshio_wkt, Holocephali_ecoregions_Kuroshio_wkt, 
                            Cyclostomi_ecoregions_Kuroshio_wkt, Chondrostei_ecoregions_Kuroshio_wkt)
Fish_Kuroshio <- Fish_Kuroshio %>% mutate(ECOREGION = "South Kuroshio")
write.csv(Fish_Kuroshio,"Fish_Kuroshio.csv")
Fish_Kuroshio <- Fish_Kuroshio %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Kuroshio$aphiaID))
Fish_Kuroshio <- select(Fish_Kuroshio, scientificName, aphiaID, ECOREGION)
Fish_Kuroshio <- unique(Fish_Kuroshio)

Fish_Torres <- rbind.fill(Teleostei_ecoregions_Torres_wkt, 
                          Elasmobranchii_ecoregions_Torres_wkt, Holocephali_ecoregions_Torres_wkt)
Fish_Torres <- Fish_Torres %>% mutate(ECOREGION = "Torres Strait Northern Great Barrier Reef")
write.csv(Fish_Torres,"Fish_Torres.csv")
Fish_Torres <- Fish_Torres %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Torres$aphiaID))
Fish_Torres <- select(Fish_Torres, scientificName, aphiaID, ECOREGION)
Fish_Torres <- unique(Fish_Torres)

Fish_Tonga <- rbind.fill(Teleostei_ecoregions_Tonga_wkt, 
                         Elasmobranchii_ecoregions_Tonga_wkt, Holocephali_ecoregions_Tonga_wkt)
Fish_Tonga <- Fish_Tonga %>% mutate(ECOREGION = "Tonga Islands")
write.csv(Fish_Tonga,"Fish_Tonga.csv")
Fish_Tonga <- Fish_Tonga %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Tonga$aphiaID))
Fish_Tonga <- select(Fish_Tonga, scientificName, aphiaID, ECOREGION)
Fish_Tonga <- unique(Fish_Tonga)

Fish_Java <- rbind.fill(Teleostei_ecoregions_Java_wkt, 
                        Elasmobranchii_ecoregions_Java_wkt, Holocephali_ecoregions_Java_wkt)
Fish_Java <- Fish_Java %>% mutate(ECOREGION = "Southern Java")
write.csv(Fish_Java,"Fish_Java.csv")
Fish_Java <- Fish_Java %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Java$aphiaID))
Fish_Java <- select(Fish_Java, scientificName, aphiaID, ECOREGION)
Fish_Java <- unique(Fish_Java)

Fish_Austral <- rbind.fill(Teleostei_ecoregions_Austral_wkt, 
                           Elasmobranchii_ecoregions_Austral_wkt)
Fish_Austral <- Fish_Austral %>% mutate(ECOREGION = "Southern Cook/Austral Islands")
write.csv(Fish_Austral,"Fish_Austral.csv")
Fish_Austral <- Fish_Austral %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Austral$aphiaID))
Fish_Austral <- select(Fish_Austral, scientificName, aphiaID, ECOREGION)
Fish_Austral <- unique(Fish_Austral)

Fish_Central_Reef <- rbind.fill(Teleostei_ecoregions_Central_Reef_wkt, 
                                Elasmobranchii_ecoregions_Central_Reef_wkt, Holocephali_ecoregions_Central_Reef_wkt, 
                                Cyclostomi_ecoregions_Central_Reef_wkt)
Fish_Central_Reef <- Fish_Central_Reef %>% mutate(ECOREGION = "Central and Southern Great Barrier Reef")
write.csv(Fish_Central_Reef,"Fish_Central_Reef.csv")
Fish_Central_Reef <- Fish_Central_Reef %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Central_Reef$aphiaID))
Fish_Central_Reef <- select(Fish_Central_Reef, scientificName, aphiaID, ECOREGION)
Fish_Central_Reef <- unique(Fish_Central_Reef)

Fish_Phoenix <- rbind.fill(Teleostei_ecoregions_Phoenix_wkt, 
                           Elasmobranchii_ecoregions_Phoenix_wkt)
Fish_Phoenix <- Fish_Phoenix %>% mutate(ECOREGION = "Phoenix/Tokelau/Northern Cook Islands")
write.csv(Fish_Phoenix,"Fish_Phoenix.csv")
Fish_Phoenix <- Fish_Phoenix %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Phoenix$aphiaID))
Fish_Phoenix <- select(Fish_Phoenix, scientificName, aphiaID, ECOREGION)
Fish_Phoenix <- unique(Fish_Phoenix)

Fish_Sulawesi <- rbind.fill(Teleostei_ecoregions_Sulawesi_wkt, 
                            Elasmobranchii_ecoregions_Sulawesi_wkt, Holocephali_ecoregions_Sulawesi_wkt, 
                            Cyclostomi_ecoregions_Sulawesi_wkt)
Fish_Sulawesi <- Fish_Sulawesi %>% mutate(ECOREGION = "Sulawesi Sea/Makassar Strait")
write.csv(Fish_Sulawesi,"Fish_Sulawesi.csv")
Fish_Sulawesi <- Fish_Sulawesi %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Sulawesi$aphiaID))
Fish_Sulawesi <- select(Fish_Sulawesi, scientificName, aphiaID, ECOREGION)
Fish_Sulawesi <- unique(Fish_Sulawesi)

Fish_West_Caroline <- rbind.fill(Teleostei_ecoregions_West_Caroline_wkt, 
                                 Elasmobranchii_ecoregions_West_Caroline_wkt)
Fish_West_Caroline <- Fish_West_Caroline %>% mutate(ECOREGION = "West Caroline Islands")
write.csv(Fish_West_Caroline,"Fish_West_Caroline.csv")
Fish_West_Caroline <- Fish_West_Caroline %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_West_Caroline$aphiaID))
Fish_West_Caroline <- select(Fish_West_Caroline, scientificName, aphiaID, ECOREGION)
Fish_West_Caroline <- unique(Fish_West_Caroline)


Fish_Southeast_Papua <- rbind.fill(Teleostei_ecoregions_Southeast_Papua_wkt, 
                                   Elasmobranchii_ecoregions_Southeast_Papua_wkt)
Fish_Southeast_Papua <- Fish_Southeast_Papua %>% mutate(ECOREGION = "Southeast Papua New Guinea")
write.csv(Fish_Southeast_Papua,"Fish_Southeast_Papua.csv")
Fish_Southeast_Papua <- Fish_Southeast_Papua %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Southeast_Papua$aphiaID))
Fish_Southeast_Papua <- select(Fish_Southeast_Papua, scientificName, aphiaID, ECOREGION)
Fish_Southeast_Papua <- unique(Fish_Southeast_Papua)


Fish_Southern_China <- rbind.fill(Teleostei_ecoregions_Southern_China_wkt, 
                                  Elasmobranchii_ecoregions_Southern_China_wkt, Holocephali_ecoregions_Southern_China_wkt, 
                                  Cyclostomi_ecoregions_Southern_China_wkt, Chondrostei_ecoregions_Southern_China_wkt)
Fish_Southern_China <- Fish_Southern_China %>% mutate(ECOREGION = "Southern China")
write.csv(Fish_Southern_China,"Fish_Southern_China.csv")
Fish_Southern_China <- Fish_Southern_China %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Southern_China$aphiaID))
Fish_Southern_China <- select(Fish_Southern_China, scientificName, aphiaID, ECOREGION)
Fish_Southern_China <- unique(Fish_Southern_China)

Fish_Southern_Vietnam <- rbind.fill(Teleostei_ecoregions_Southern_Vietnam_wkt, 
                                    Elasmobranchii_ecoregions_Southern_Vietnam_wkt)
Fish_Southern_Vietnam <- Fish_Southern_Vietnam %>% mutate(ECOREGION = "Southern Vietnam")
write.csv(Fish_Southern_Vietnam,"Fish_Southern_Vietnam.csv")
Fish_Southern_Vietnam <- Fish_Southern_Vietnam %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Southern_Vietnam$aphiaID))
Fish_Southern_Vietnam <- select(Fish_Southern_Vietnam, scientificName, aphiaID, ECOREGION)
Fish_Southern_Vietnam <- unique(Fish_Southern_Vietnam)

Fish_Sund_Java <- rbind.fill(Teleostei_ecoregions_Sund_Java_wkt, 
                             Elasmobranchii_ecoregions_Sund_Java_wkt, Holocephali_ecoregions_Sund_Java_wkt)
Fish_Sund_Java <- Fish_Sund_Java %>% mutate(ECOREGION = "Sunda Shelf/Java Sea")
write.csv(Fish_Sund_Java,"Fish_Sund_Java.csv")
Fish_Sund_Java <- Fish_Sund_Java %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Sund_Java$aphiaID))
Fish_Sund_Java <- select(Fish_Sund_Java, scientificName, aphiaID, ECOREGION)
Fish_Sund_Java <- unique(Fish_Sund_Java)

Fish_Fiji <- rbind.fill(Teleostei_ecoregions_Fiji_wkt_1, 
                        Elasmobranchii_ecoregions_Fiji_wkt_1, 
                        Teleostei_ecoregions_Fiji_wkt_raw_2, 
                        Elasmobranchii_ecoregions_Fiji_wkt_2)
Fish_Fiji <- Fish_Fiji %>% mutate(ECOREGION = "Fiji Islands")
write.csv(Fish_Fiji,"Fish_Fiji.csv")
Fish_Fiji <- Fish_Fiji %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Fiji$aphiaID))
Fish_Fiji <- select(Fish_Fiji, scientificName, aphiaID, ECOREGION)
Fish_Fiji <- unique(Fish_Fiji)

Fish_Hawaii <- rbind.fill(Teleostei_ecoregions_Hawaii_wkt_1, 
                          Elasmobranchii_ecoregions_Hawaii_wkt_1, 
                          Teleostei_ecoregions_Hawaii_wkt_2, 
                          Elasmobranchii_ecoregions_Hawaii_wkt_2, 
                          Teleostei_ecoregions_Hawaii_wkt_3, 
                          Elasmobranchii_ecoregions_Hawaii_wkt_3, Holocephali_ecoregions_Hawaii_wkt_3, 
                          Cyclostomi_ecoregions_Hawaii_wkt_3)
Fish_Hawaii <- Fish_Hawaii %>% mutate(ECOREGION = "Hawaii")
write.csv(Fish_Hawaii,"Fish_Hawaii.csv")
Fish_Hawaii <- Fish_Hawaii %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Hawaii$aphiaID))
Fish_Hawaii <- select(Fish_Hawaii, scientificName, aphiaID, ECOREGION)
Fish_Hawaii <- unique(Fish_Hawaii)

Fish_Gilbert <- rbind.fill(Teleostei_ecoregions_Gilbert_wkt_1, 
                           Elasmobranchii_ecoregions_Gilbert_wkt_1, 
                           Teleostei_ecoregions_Gilbert_wkt_3, 
                           Elasmobranchii_ecoregions_Gilbert_wkt_3)
Fish_Gilbert <- Fish_Gilbert %>% mutate(ECOREGION = "Gilbert/Ellis Islands")
write.csv(Fish_Gilbert,"Fish_Gilbert.csv")
Fish_Gilbert <- Fish_Gilbert %>% filter(str_detect(scientificName, "[ ]"))
length(unique(Fish_Gilbert$aphiaID))
Fish_Gilbert <- select(Fish_Gilbert, scientificName, aphiaID, ECOREGION)
Fish_Gilbert <- unique(Fish_Gilbert)

Fish <- rbind.fill(Fish_Arnhem_Coast, Fish_Arafura_Sea, Fish_Banda_Sea, Fish_Bismarck_Sea, 
                   Fish_Bonaparte_Coast, Fish_Cocos, Fish_Coral_Sea, Fish_East_Caroline_Islands, 
                   Fish_Easter_Island, Fish_Eastern_Philippines, Fish_Exmouth, Fish_Gulf_of_Papua, 
                   Fish_Gulf_of_Thailand, Fish_Gulf_of_Tonkin, Fish_Halmahera, Fish_Lesser, 
                   Fish_Line, Fish_Lord, Fish_Malacca, Fish_Mariana, 
                   Fish_Tuamotus, Fish_Marshall, Fish_New_Caledonia, Fish_Ningaloo, 
                   Fish_Ogasawara, Fish_Northeast_Sulawesi, Fish_Marquesas, Fish_Vanuatu, 
                   Fish_Papua, Fish_Solomon_Archipelago,  
                   Fish_Kuroshio, Fish_Torres, Fish_Tonga, Fish_Java, 
                   Fish_Austral, Fish_Central_Reef, Fish_Phoenix, Fish_Sulawesi, 
                   Fish_West_Caroline, Fish_Southeast_Papua, Fish_Southern_China, Fish_Southern_Vietnam, 
                   Fish_Sund_Java, Fish_Fiji, Fish_Gilbert, Fish_Hawaii, Fish_Solomon_Sea, Fish_Palawan, 
                   Fish_Samoa, Fish_Society, Fish_Rapa, Fish_Oceanic)
write.table(Fish,"Fish.txt", row.names = FALSE, col.names = TRUE, sep = ";")
Fish <- unique(Fish)
Fish <- Fish %>% mutate(PROVINCE = "")
Fish <- Fish %>% mutate(REALM = "")
length(unique(Fish$aphiaID))

Fish <- Fish %>% filter(str_detect(scientificName, "[ ]"))

Fish <- Fish %>% mutate(PROVINCE =
                          case_when(ECOREGION == "Arnhem Coast to Gulf of Carpenteria" ~ "Sahul Shelf", 
                                    ECOREGION == "Arafura Sea" ~ "Sahul Shelf", 
                                    ECOREGION == "Banda Sea" ~ "Western Coral Triangle", 
                                    ECOREGION == "Bismarck Sea" ~ "Eastern Coral Triangle", 
                                    ECOREGION == "Bonaparte Coast" ~ "Sahul Shelf", 
                                    ECOREGION == "Cocos-Keeling/Christmas Island" ~ "Java Transitional", 
                                    ECOREGION == "Coral Sea" ~ "Tropical Southwestern Pacific", 
                                    ECOREGION == "East Caroline Islands" ~ "Tropical Northwestern Pacific", 
                                    ECOREGION == "Easter Island" ~ "Easter Island", 
                                    ECOREGION == "Eastern Philippines" ~ "Western Coral Triangle", 
                                    ECOREGION == "Exmouth to Broome" ~ "Northwest Australian Shelf", 
                                    ECOREGION == "Fiji Islands" ~ "Tropical Southwestern Pacific", 
                                    ECOREGION == "Gilbert/Ellis Islands" ~ "Marshall, Gilbert and Ellis Islands", 
                                    ECOREGION == "Gulf of Papua" ~ "Sahul Shelf", 
                                    ECOREGION == "Gulf of Thailand" ~ "Sunda Shelf", 
                                    ECOREGION == "Gulf of Tonkin" ~ "South China Sea", 
                                    ECOREGION == "Halmahera" ~ "Western Coral Triangle", 
                                    ECOREGION == "Hawaii" ~ "Hawaii", 
                                    ECOREGION == "Lesser Sunda" ~ "Western Coral Triangle", 
                                    ECOREGION == "Line Islands" ~ "Central Polynesia", 
                                    ECOREGION == "Lord Howe and Norfolk Islands" ~ "Lord Howe and Norfolk Islands", 
                                    ECOREGION == "Malacca Strait" ~ "Sunda Shelf", 
                                    ECOREGION == "Mariana Islands" ~ "Tropical Northwestern Pacific", 
                                    ECOREGION == "Tuamotus" ~ "Southeast Polynesia", 
                                    ECOREGION == "Marshall Islands" ~ "Marshall, Gilbert and Ellis Islands", 
                                    ECOREGION == "New Caledonia" ~ "Tropical Southwestern Pacific", 
                                    ECOREGION == "Ningaloo"  ~ "Northwest Australian Shelf", 
                                    ECOREGION == "Northeast Sulawesi" ~ "Western Coral Triangle", 
                                    ECOREGION == "Ogasawara Islands" ~ "Tropical Northwestern Pacific", 
                                    ECOREGION == "Palawan/North Borneo" ~ "Western Coral Triangle", 
                                    ECOREGION == "Papua" ~ "Western Coral Triangle",
                                    ECOREGION == "Phoenix/Tokelau/Northern Cook Islands" ~ "Central Polynesia", 
                                    ECOREGION == "Rapa-Pitcairn" ~ "Southeast Polynesia", 
                                    ECOREGION == "Samoa Islands" ~ "Central Polynesia", 
                                    ECOREGION == "Society Islands" ~ "Southeast Polynesia", 
                                    ECOREGION == "Solomon Archipelago" ~ "Eastern Coral Triangle", 
                                    ECOREGION == "Solomon Sea" ~ "Eastern Coral Triangle", 
                                    ECOREGION == "South China Sea Oceanic Islands" ~ "South China Sea", 
                                    ECOREGION == "South Kuroshio" ~ "South Kuroshio", 
                                    ECOREGION == "Southeast Papua New Guinea" ~ "Eastern Coral Triangle", 
                                    ECOREGION == "Southern China" ~ "South China Sea", 
                                    ECOREGION == "Southern Vietnam" ~ "Sunda Shelf", 
                                    ECOREGION == "Sulawesi Sea/Makassar Strait" ~ "Western Coral Triangle", 
                                    ECOREGION == "Tonga Islands" ~ "Tropical Southwestern Pacific", 
                                    ECOREGION == "Marquesas" ~ "Marquesas", 
                                    ECOREGION == "Vanuatu" ~ "Tropical Southwestern Pacific", 
                                    ECOREGION == "West Caroline Islands" ~ "Tropical Northwestern Pacific", 
                                    ECOREGION == "Southern Java" ~ "Java Transitional", 
                                    ECOREGION == "Torres Strait Northern Great Barrier Reef"  ~ "Northeast Australian Shelf", 
                                    ECOREGION == "Central and Southern Great Barrier Reef" ~ "Northeast Australian Shelf", 
                                    ECOREGION == "Sunda Shelf/Java Sea" ~ "Sunda Shelf", 
                                    ECOREGION == "Southern Cook/Austral Islands" ~ "Southeast Polynesia"))



Fish <- Fish %>% mutate(REALM =
                          case_when(ECOREGION == "Arnhem Coast to Gulf of Carpenteria" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Arafura Sea" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Banda Sea" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Bismarck Sea" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Bonaparte Coast" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Cocos-Keeling/Christmas Island" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Coral Sea" ~ "Central Indo-Pacific", 
                                    ECOREGION == "East Caroline Islands" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Easter Island" ~ "Eastern Indo-Pacific", 
                                    ECOREGION == "Eastern Philippines" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Exmouth to Broome" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Fiji Islands" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Gilbert/Ellis Islands" ~ "Eastern Indo-Pacific", 
                                    ECOREGION == "Gulf of Papua" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Gulf of Thailand" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Gulf of Tonkin" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Halmahera" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Hawaii" ~ "Eastern Indo-Pacific", 
                                    ECOREGION == "Lesser Sunda" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Line Islands" ~ "Eastern Indo-Pacific", 
                                    ECOREGION == "Lord Howe and Norfolk Islands" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Malacca Strait" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Mariana Islands" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Tuamotus" ~ "Eastern Indo-Pacific", 
                                    ECOREGION == "Marshall Islands" ~ "Eastern Indo-Pacific", 
                                    ECOREGION == "New Caledonia" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Ningaloo"  ~ "Central Indo-Pacific", 
                                    ECOREGION == "Northeast Sulawesi" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Ogasawara Islands" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Palawan/North Borneo" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Papua" ~ "Central Indo-Pacific",
                                    ECOREGION == "Phoenix/Tokelau/Northern Cook Islands" ~ "Eastern Indo-Pacific", 
                                    ECOREGION == "Rapa-Pitcairn" ~ "Eastern Indo-Pacific", 
                                    ECOREGION == "Samoa Islands" ~ "Eastern Indo-Pacific", 
                                    ECOREGION == "Society Islands" ~ "Eastern Indo-Pacific", 
                                    ECOREGION == "Solomon Archipelago" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Solomon Sea" ~ "Central Indo-Pacific", 
                                    ECOREGION == "South China Sea Oceanic Islands" ~ "Central Indo-Pacific", 
                                    ECOREGION == "South Kuroshio" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Southeast Papua New Guinea" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Southern China" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Southern Vietnam" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Sulawesi Sea/Makassar Strait" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Tonga Islands" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Marquesas" ~ "Eastern Indo-Pacific", 
                                    ECOREGION == "Vanuatu" ~ "Central Indo-Pacific", 
                                    ECOREGION == "West Caroline Islands" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Southern Java" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Torres Strait Northern Great Barrier Reef"  ~ "Central Indo-Pacific", 
                                    ECOREGION == "Central and Southern Great Barrier Reef" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Sunda Shelf/Java Sea" ~ "Central Indo-Pacific", 
                                    ECOREGION == "Southern Cook/Austral Islands" ~ "Eastern Indo-Pacific"))

################################################################################
####################### READ FISHBASE FISH LISTS ###############################
################################################################################

all_fishbase_spalding <- read.table("all_fishbase_spalding.txt", sep = ';', header = TRUE)
colnames(all_fishbase_spalding)[colnames(all_fishbase_spalding) == "EcosystemName"] ="ECOREGION"
all_fishbase_spalding <- select(all_fishbase_spalding, Species, ECOREGION, PROVINCE, REALM)

all_fishbase_spalding_species <- select(all_fishbase_spalding, Species)
all_fishbase_spalding_species <- unique(all_fishbase_spalding_species)
all_fishbase_spalding_species_list <- list()
for (i in all_fishbase_spalding_species) {
  all_fishbase_spalding_species_list <- append(all_fishbase_spalding_species_list, i)
}
all_fishbase_spalding_species_list <- as.character(all_fishbase_spalding_species_list)

#RETRIEVE APHIA IDs
all_fishbase_spalding_species_Aphia <- match_taxa(all_fishbase_spalding_species_list, ask=TRUE)
all_fishbase_spalding_species_Aphia <- all_fishbase_spalding_species_Aphia %>% drop_na()
#A <- select(all_fishbase_spalding_species_Aphia, scientificName)
#A <- unique(A)
#B <- select(all_fishbase_spalding_species, Species)
#B <- unique(B)
#colnames(B)[colnames(B) == "Species"] ="scientificName"
#Species_with_no_aphia <- anti_join(B, A)

#split the column scientificNameID
split_into_multiple <- function(column, pattern = ", ", into_prefix){
  cols <- str_split_fixed(column, pattern, n = Inf)
  # Sub out the ""'s returned by filling the matrix to the right, with NAs which are useful
  cols[which(cols == "")] <- NA
  cols <- as.tibble(cols)
  # name the 'cols' tibble as 'into_prefix_1', 'into_prefix_2', ..., 'into_prefix_m' 
  # where m = # columns of 'cols'
  m <- dim(cols)[2]
  
  names(cols) <- paste(into_prefix, 1:m, sep = "_")
  return(cols)
}

all_fishbase_spalding_species_Aphia <- all_fishbase_spalding_species_Aphia %>% 
  bind_cols(split_into_multiple(.$scientificNameID, ":", "scientificNameID")) %>% 
  # selecting those that start with 'type_' will remove the original 'type' column
  select(scientificName, match_type, starts_with("scientificNameID_"))

colnames(all_fishbase_spalding_species_Aphia)[colnames(all_fishbase_spalding_species_Aphia) == "scientificNameID_5"] ="aphiaID"
all_fishbase_spalding_species_Aphia <- select(all_fishbase_spalding_species_Aphia, scientificName, aphiaID)

##add manually the species that still doesn't have an AphiaID
#all_fishbase_spalding_species_Aphia <- all_fishbase_spalding_species_Aphia %>% 
#  add_row(scientificName = "Symphurus brachycephalus", aphiaID="1698744")

#merge the AphiaID to the intial data frame
all_fishbase_spalding <- inner_join(all_fishbase_spalding, all_fishbase_spalding_species_Aphia, 
                               by=c('Species'='scientificName'))

all_fishbase_spalding <- all_fishbase_spalding %>% filter(str_detect(Species, "[ ]"))
colnames(all_fishbase_spalding)[colnames(all_fishbase_spalding) == "Species"] ="scientificName"


################################################################################
########################## LOAD OTHER FISH LISTS ###############################
################################################################################

load(file = "Fish_Hosts.RData")
#to import the Fish_Hosts_to_merge
load(file = "checklists_fish.RData")
#to import the cleaner_reef_fish_to_merge and the Fish_Barcoding_to_merge

#check if all fish are identified to species level
Fish_Barcoding_to_merge <- Fish_Barcoding_to_merge %>% filter(str_detect(Species, "[ ]"))
colnames(Fish_Barcoding_to_merge)[colnames(Fish_Barcoding_to_merge) == "Species"] ="scientificName"

cleaner_reef_fish_to_merge <- cleaner_reef_fish_to_merge %>% filter(str_detect(Species, "[ ]"))
colnames(cleaner_reef_fish_to_merge)[colnames(cleaner_reef_fish_to_merge) == "Species"] ="scientificName"

Fish_Hosts_to_merge <- Fish_Hosts_to_merge %>% filter(str_detect(scientificName_Host, "[ ]"))
colnames(Fish_Hosts_to_merge)[colnames(Fish_Hosts_to_merge) == "scientificName_Host"] ="scientificName"

#add ECOREGION column
Fish_Hosts_to_merge <- Fish_Hosts_to_merge %>% mutate(ECOREGION = NA)
cleaner_reef_fish_to_merge <- cleaner_reef_fish_to_merge %>% mutate(ECOREGION = NA)

################################################################################
############################# MERGE FISH LISTS #################################
################################################################################

all_fish <- rbind(Fish, all_fishbase_spalding, Fish_Barcoding_to_merge, 
                  cleaner_reef_fish_to_merge, Fish_Hosts_to_merge)
all_fish <- select(all_fish, -ECOREGION)
all_fish <- unique(all_fish)

write.table(all_fish, "all_fish.txt", 
            row.names = FALSE, col.names = TRUE, sep = ";")

all_fish_species <- select(all_fish, scientificName)
all_fish_species <- unique(all_fish_species)

all_fish_species_aphia <- select(all_fish, aphiaID)
all_fish_species_aphia <- unique(all_fish_species_aphia)

# Retrieve taxonomy from WoRMS 
all_fish_taxonomy <- classification(all_fish_species$scientificName, db="worms", marine_only=FALSE, max_tries=10)
#Turn classification object into dataframe
name <- c()
output <- array(dim = c(dim(all_fish_species)[1],7))
colnames(output) <- c("Kingdom", "Phylum", "Class_Gigaclass", "Order", "Family", "Genus", "Species")
for (i in seq(1,length(all_fish_taxonomy))) {
  name <- as.character(names(all_fish_taxonomy[i]))
  if (!is.na(all_fish_taxonomy[name])) { 
    if (sum(as.integer(eval(parse(text = paste0("all_fish_taxonomy$`",name,"`$rank == 'Class'"))))) == 1) {
      output[i,] <- t(eval(parse(text = paste0("all_fish_taxonomy$`",name, "`$name[all_fish_taxonomy$`", name, "`$rank == 'Kingdom' |",
                                               "all_fish_taxonomy$`", name, "`$rank == 'Phylum' |",
                                               "all_fish_taxonomy$`", name, "`$rank == 'Class' |", 
                                               "all_fish_taxonomy$`", name, "`$rank == 'Order' |",
                                               "all_fish_taxonomy$`", name, "`$rank == 'Family' |",
                                               "all_fish_taxonomy$`", name, "`$rank == 'Genus' |", 
                                               "all_fish_taxonomy$`", name, "`$rank == 'Species']" ))))
    } else {
      output[i,] <- t(eval(parse(text = paste0("all_fish_taxonomy$`",name, "`$name[all_fish_taxonomy$`", name, "`$rank == 'Kingdom' |",
                                               "all_fish_taxonomy$`", name, "`$rank == 'Phylum' |",
                                               "all_fish_taxonomy$`", name, "`$rank == 'Gigaclass' |",
                                               "all_fish_taxonomy$`", name, "`$rank == 'Order' |",
                                               "all_fish_taxonomy$`", name, "`$rank == 'Family' |",
                                               "all_fish_taxonomy$`", name, "`$rank == 'Genus' |",
                                               "all_fish_taxonomy$`", name, "`$rank == 'Species']" ))))
    }
    
  }
  rm(name)
}
output <- data.frame(output)
order_clean <- data.frame(gsub("\\ .*","",output$Order))
output<-cbind(output, order_clean)
output<-output[, c(1,2,3,8,4,5,6,7)]
output$Order<-NULL
names(output)[4]<- "Order"
output<-output[complete.cases(output),]

write.table(output, "all_fish_taxonomy.txt", 
            row.names = FALSE, col.names = TRUE, sep = ";")

#also, check the classification with another function, based on the aphiaIDs
#to avoid introducing any mistakes in the dataset
##Extract the aphiaIDs into a list
all_fish_species_aphia_list <- list()
for (i in all_fish_species_aphia) {
  all_fish_species_aphia_list <- append(all_fish_species_aphia_list, i)
}
all_fish_species_aphia_list <- as.integer(all_fish_species_aphia_list)
all_fish_species_aphia_classification <- wormsbyid(all_fish_species_aphia_list)

all_fish_species_aphia_classification <- select(all_fish_species_aphia_classification, AphiaID, 
                                                   scientificname, valid_AphiaID, valid_name, 
                                                   genus, family, order, class, phylum, kingdom)

##add manually the species that still doesn't have an AphiaID
#all_fish_species_aphia_classification <- all_fish_species_aphia_classification %>% 
#  add_row(scientificname = "Symphurus brachycephalus", AphiaID=1698744, 
#          valid_AphiaID =1698744, valid_name = "Symphurus brachycephalus", 
#          genus = "Symphurus", family = "Cynoglossidae", order = "Pleuronectiformes", class = "Teleostei", 
#          phylum = "Chordata", kingdom = "Animalia")

write.table(all_fish_species_aphia_classification, "all_fish_species_classification.txt", 
            row.names = FALSE, col.names = TRUE, sep = ";")

#merge the all_fish table with the classification
all_fish_with_classification <- inner_join(all_fish, all_fish_species_aphia_classification, 
                                           by = c("scientificName"="scientificname"))

write.table(all_fish_with_classification, "all_fish_province_with_classification.txt", 
            row.names = FALSE, col.names = TRUE, sep = ";")

#calculate statistics

df <- data.frame(matrix(ncol = 1, nrow = 18))

rownames(df) <- c("Eastern Coral Triangle", 
                  "Java Transitional", 
                  "Lord Howe and Norfolk Islands", 
                  "Northeast Australian Shelf", 
                  "Northwest Australian Shelf", 
                  "Sahul Shelf", 
                  "South China Sea", 
                  "South Kuroshio", 
                  "Sunda Shelf", 
                  "Tropical Northwestern Pacific", 
                  "Tropical Southwestern Pacific", 
                  "Western Coral Triangle", 
                  "Central Polynesia", 
                  "Easter Island", 
                  "Hawaii", 
                  "Marquesas", 
                  "Marshall, Gilbert and Ellis Islands", 
                  "Southeast Polynesia")

col_all_fish <- c(sum(all_fish$PROVINCE == "Eastern Coral Triangle"), 
                  sum(all_fish$PROVINCE == "Java Transitional"), 
                  sum(all_fish$PROVINCE == "Lord Howe and Norfolk Islands"), 
                  sum(all_fish$PROVINCE == "Northeast Australian Shelf"), 
                  sum(all_fish$PROVINCE == "Northwest Australian Shelf"), 
                  sum(all_fish$PROVINCE == "Sahul Shelf"), 
                  sum(all_fish$PROVINCE == "South China Sea"), 
                  sum(all_fish$PROVINCE == "South Kuroshio"), 
                  sum(all_fish$PROVINCE == "Sunda Shelf"), 
                  sum(all_fish$PROVINCE == "Tropical Northwestern Pacific"), 
                  sum(all_fish$PROVINCE == "Tropical Southwestern Pacific"), 
                  sum(all_fish$PROVINCE == "Western Coral Triangle"), 
                  sum(all_fish$PROVINCE == "Central Polynesia"), 
                  sum(all_fish$PROVINCE == "Easter Island"), 
                  sum(all_fish$PROVINCE == "Hawaii"), 
                  sum(all_fish$PROVINCE == "Marquesas"), 
                  sum(all_fish$PROVINCE == "Marshall, Gilbert and Ellis Islands"), 
                  sum(all_fish$PROVINCE == "Southeast Polynesia"))

colnames(df) <- c("Fish")
df$Fish <- col_all_fish

write.table(df, "all_fish_statistics_province.txt",
            row.names = TRUE, col.names = TRUE, sep =";")

################################################################################
##################### CHECK IF THEY ARE REEF SPECIES ###########################
################################################################################

all_fish_habitat <- species(species_list = all_fish$scientificName, 
                      fields = c("Species", "DemersPelag"))
all_fish_habitat <- all_fish_habitat[!is.na(all_fish_habitat$DemersPelag), ]
unique(all_fish_habitat$DemersPelag)

#check which are the fish with no habitat information
all_fish_habitat_species <- select(all_fish_habitat, Species)
colnames(all_fish_species)[colnames(all_fish_species) == "scientificName"] ="Species"
fish_with_no_habitat <- anti_join(all_fish_species, all_fish_habitat_species)

write.table(fish_with_no_habitat, "fish_with_no_habitat.txt",
            row.names = FALSE, col.names = TRUE, sep =";")

#add the fish_with_no_habitat to all_fish_habitat and use NAs
fish_with_no_habitat <- fish_with_no_habitat %>% mutate(DemersPelag = "NA")
all_fish_habitat <- rbind(all_fish_habitat, fish_with_no_habitat)

#however, all the fish included in the cleaner_reef_fish_to_merge data frame
#should be (by definition) reef associated
#so, we will correct the all_fish_habitat with this information
cleaner_reef_fish_to_merge_species <- select(cleaner_reef_fish_to_merge, scientificName)
cleaner_reef_fish_to_merge_species <- unique(cleaner_reef_fish_to_merge_species)

#delete the cleaner_reef_fish_to_merge_species from the all_fish_habitat and
#then add them again with the correct habitat information
all_fish_habitat <- anti_join(all_fish_habitat, cleaner_reef_fish_to_merge_species, 
                  by = c("Species"="scientificName"))
cleaner_reef_fish_to_merge_species <- cleaner_reef_fish_to_merge_species %>% mutate(DemersPelag = "reef-associated")
colnames(cleaner_reef_fish_to_merge_species)[colnames(cleaner_reef_fish_to_merge_species) == "scientificName"] ="Species"

all_fish_habitat <- rbind(all_fish_habitat, cleaner_reef_fish_to_merge_species)


#doublecheck if the fish that are not Reef-Associated in FishBase
#are indeed Reef-Associated
all_fish_other_habitats <- subset(all_fish_habitat, DemersPelag!="reef-associated")
all_fish_other_habitats_species <- select(all_fish_other_habitats, Species)
length(unique(all_fish_other_habitats$Species))

#import the data from the Reef Life Survey (RLS)
#and check if the all_fish_other_habitats are included in the RLS data
#and therefore, should inherit the Reef-Associated tag
IMOS <- read.csv("IMOS.csv", header = TRUE, sep = ",")
colnames(IMOS)[colnames(IMOS) == "species_name"] ="Species"
IMOS_species <- select(IMOS, Species)
IMOS_species <- unique(IMOS_species)

#check if IMOS_species are found in all_fish_other_habitats_species
IMOS_species <- semi_join(IMOS_species, all_fish_other_habitats_species)

#delete the IMOS_species from the all_fish_habitat and
#then add them again with the correct habitat information

all_fish_habitat <- anti_join(all_fish_habitat, IMOS_species, 
                              by = c("Species"="Species"))
IMOS_species <- IMOS_species %>% mutate(DemersPelag = "reef-associated")

all_fish_habitat <- rbind(all_fish_habitat, IMOS_species)

#estimate again which are the other habitat species
all_fish_other_habitats <- subset(all_fish_habitat, DemersPelag!="reef-associated")
all_fish_other_habitats_species <- select(all_fish_other_habitats, Species)
length(unique(all_fish_other_habitats$Species))

#check if IUCN has habitat information for the all_fish_other_habitats_species
#with the function rl_habitats()
#it requires to sey up an API Key which at the moment is not functional 

#check if the all_fish_other_habitats_species are included in the Hubert et al 2012 checklist
checklist_Hubert_et_al <- read.csv("checklist_Hubert_et_al.txt", header=TRUE, sep='\t')
checklist_Hubert_et_al <- select(checklist_Hubert_et_al, Species)
checklist_Hubert_et_al <- unique(checklist_Hubert_et_al)

#check if checklist_Hubert_et_al are found in all_fish_other_habitats_species
checklist_Hubert_et_al <- semi_join(checklist_Hubert_et_al, all_fish_other_habitats_species)

#delete the checklist_Hubert_et_al from the all_fish_habitat and
#then add them again with the correct habitat information

all_fish_habitat <- anti_join(all_fish_habitat, checklist_Hubert_et_al, 
                              by = c("Species"="Species"))
checklist_Hubert_et_al <- checklist_Hubert_et_al %>% mutate(DemersPelag = "reef-associated")

all_fish_habitat <- rbind(all_fish_habitat, checklist_Hubert_et_al)

#estimate again which are the other habitat species
all_fish_other_habitats <- subset(all_fish_habitat, DemersPelag!="reef-associated")
all_fish_other_habitats_species <- select(all_fish_other_habitats, Species)
length(unique(all_fish_other_habitats$Species))

#correct the all_fish_habitat based on manually checking of the species
#some species with NA habitats are reef-associated
#and some species with pelagic-neritic habitats are reef-associated

NA_reef <- read.csv("NA_reef.txt", header=TRUE, sep='\t')
pelagic_neritic_reef <- read.csv("pelagic-neritic_reef.txt", header=TRUE, sep='\t')
merge_manual <- rbind(NA_reef, pelagic_neritic_reef)

#delete the merge_manual from the all_fish_habitat and
#then add them again with the correct habitat information

all_fish_habitat <- anti_join(all_fish_habitat, merge_manual, 
                              by = c("Species"="Species"))
merge_manual <- merge_manual %>% mutate(DemersPelag = "reef-associated")

all_fish_habitat <- rbind(all_fish_habitat, merge_manual)

#estimate again which are the other habitat species
all_fish_other_habitats <- subset(all_fish_habitat, DemersPelag!="reef-associated")
all_fish_other_habitats_species <- select(all_fish_other_habitats, Species)
length(unique(all_fish_other_habitats$Species))

#some of the reef associated species actually are not from our region of interest
#after manual correction, we decided to exclude certain species that were found
#erroneously documented from our regions of interest
#here we exclude the fish that were found only in one data source and only in 
#a few number of provinces (less than 3)
fish_dubious <- read.csv("fish_dubious_distribution.txt", header=TRUE, sep='\t')

all_fish_habitat <- anti_join(all_fish_habitat, fish_dubious, 
                              by = c("Species"= "Species"))

write.table(all_fish_habitat, "all_fish_habitat.txt",
            row.names = FALSE, col.names = TRUE, sep =";")

#calculate statistics

df <- data.frame(matrix(ncol = 1, nrow = 9))

rownames(df) <- c("reef-associated", 
                  "pelagic-neritic", 
                  "demersal", 
                  "benthopelagic", 
                  "bathypelagic", 
                  "pelagic-oceanic",
                  "bathydemersal",
                  "pelagic", 
                  "NA")

col_all_fish_habitat <- c(sum(all_fish_habitat$DemersPelag == "reef-associated"), 
                          sum(all_fish_habitat$DemersPelag == "pelagic-neritic"), 
                          sum(all_fish_habitat$DemersPelag == "demersal"), 
                          sum(all_fish_habitat$DemersPelag == "benthopelagic"), 
                          sum(all_fish_habitat$DemersPelag == "bathypelagic"), 
                          sum(all_fish_habitat$DemersPelag == "pelagic-oceanic"), 
                          sum(all_fish_habitat$DemersPelag == "bathydemersal"), 
                          sum(all_fish_habitat$DemersPelag == "pelagic"), 
                          sum(all_fish_habitat$DemersPelag == "NA"))

colnames(df) <- c("Habitat")
df$Habitat <- col_all_fish_habitat

write.table(df, "all_fish_habitat_statistics.txt",
            row.names = TRUE, col.names = TRUE, sep =";")

all_fish_reef <- subset(all_fish_habitat, DemersPelag=="reef-associated")
all_fish_reef_species <- select(all_fish_reef, Species)
length(unique(all_fish_reef_species$Species))
colnames(all_fish_reef_species)[colnames(all_fish_reef_species) == "Species"] ="scientificName"

#correct the all_fish_with_classification and calculate again the statistics
all_fish_with_classification <- semi_join(all_fish_with_classification, all_fish_habitat, 
                  by = c("scientificName"="Species"))

write.table(all_fish_with_classification, "all_fish_province_with_classification.txt", 
            row.names = FALSE, col.names = TRUE, sep = ";")

#calculate statistics

df <- data.frame(matrix(ncol = 1, nrow = 18))

rownames(df) <- c("Eastern Coral Triangle", 
                  "Java Transitional", 
                  "Lord Howe and Norfolk Islands", 
                  "Northeast Australian Shelf", 
                  "Northwest Australian Shelf", 
                  "Sahul Shelf", 
                  "South China Sea", 
                  "South Kuroshio", 
                  "Sunda Shelf", 
                  "Tropical Northwestern Pacific", 
                  "Tropical Southwestern Pacific", 
                  "Western Coral Triangle", 
                  "Central Polynesia", 
                  "Easter Island", 
                  "Hawaii", 
                  "Marquesas", 
                  "Marshall, Gilbert and Ellis Islands", 
                  "Southeast Polynesia")

col_all_fish_with_classification <- c(sum(all_fish_with_classification$PROVINCE == "Eastern Coral Triangle"), 
                  sum(all_fish_with_classification$PROVINCE == "Java Transitional"), 
                  sum(all_fish_with_classification$PROVINCE == "Lord Howe and Norfolk Islands"), 
                  sum(all_fish_with_classification$PROVINCE == "Northeast Australian Shelf"), 
                  sum(all_fish_with_classification$PROVINCE == "Northwest Australian Shelf"), 
                  sum(all_fish_with_classification$PROVINCE == "Sahul Shelf"), 
                  sum(all_fish_with_classification$PROVINCE == "South China Sea"), 
                  sum(all_fish_with_classification$PROVINCE == "South Kuroshio"), 
                  sum(all_fish_with_classification$PROVINCE == "Sunda Shelf"), 
                  sum(all_fish_with_classification$PROVINCE == "Tropical Northwestern Pacific"), 
                  sum(all_fish_with_classification$PROVINCE == "Tropical Southwestern Pacific"), 
                  sum(all_fish_with_classification$PROVINCE == "Western Coral Triangle"), 
                  sum(all_fish_with_classification$PROVINCE == "Central Polynesia"), 
                  sum(all_fish_with_classification$PROVINCE == "Easter Island"), 
                  sum(all_fish_with_classification$PROVINCE == "Hawaii"), 
                  sum(all_fish_with_classification$PROVINCE == "Marquesas"), 
                  sum(all_fish_with_classification$PROVINCE == "Marshall, Gilbert and Ellis Islands"), 
                  sum(all_fish_with_classification$PROVINCE == "Southeast Polynesia"))

colnames(df) <- c("Fish")
df$Fish <- col_all_fish_with_classification

write.table(df, "all_fish_statistics_province.txt",
            row.names = TRUE, col.names = TRUE, sep =";")

#calculate again the statistics for the reef fish
all_reef_fish_with_classification <- semi_join(all_fish_with_classification, all_fish_reef, 
                                          by = c("scientificName"="Species"))

write.table(all_reef_fish_with_classification, "all_reef_fish_province_with_classification.txt", 
            row.names = FALSE, col.names = TRUE, sep = "\t")

df <- data.frame(matrix(ncol = 1, nrow = 18))

rownames(df) <- c("Eastern Coral Triangle", 
                  "Java Transitional", 
                  "Lord Howe and Norfolk Islands", 
                  "Northeast Australian Shelf", 
                  "Northwest Australian Shelf", 
                  "Sahul Shelf", 
                  "South China Sea", 
                  "South Kuroshio", 
                  "Sunda Shelf", 
                  "Tropical Northwestern Pacific", 
                  "Tropical Southwestern Pacific", 
                  "Western Coral Triangle", 
                  "Central Polynesia", 
                  "Easter Island", 
                  "Hawaii", 
                  "Marquesas", 
                  "Marshall, Gilbert and Ellis Islands", 
                  "Southeast Polynesia")

col_all_reef_fish <- c(sum(all_reef_fish_with_classification$PROVINCE == "Eastern Coral Triangle"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Java Transitional"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Lord Howe and Norfolk Islands"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Northeast Australian Shelf"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Northwest Australian Shelf"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Sahul Shelf"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "South China Sea"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "South Kuroshio"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Sunda Shelf"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Tropical Northwestern Pacific"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Tropical Southwestern Pacific"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Western Coral Triangle"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Central Polynesia"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Easter Island"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Hawaii"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Marquesas"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Marshall, Gilbert and Ellis Islands"), 
                                      sum(all_reef_fish_with_classification$PROVINCE == "Southeast Polynesia"))

colnames(df) <- c("Reef_Fish")
df$Reef_Fish <- col_all_reef_fish

write.table(df, "all_reef_fish_statistics_province.txt",
            row.names = TRUE, col.names = TRUE, sep =";")


################################################################################
################ CHECK WHICH FISH DON'T HAVE PARASITE INFO #####################
################################################################################

#check which are the fish species that are not included in the Trematoda and Copepoda checklists, 
#i.e. in the Fish_Hosts_to_merge

colnames(all_fish_species)[colnames(all_fish_species) == "Species"] ="scientificName"
Fish_Hosts_to_merge_species <- select(Fish_Hosts_to_merge, scientificName)

fish_with_no_parasite <- anti_join(all_fish_species, Fish_Hosts_to_merge_species, 
                                     by=c('scientificName'='scientificName'))
all_fish_species_aphia <- select(all_fish_species_aphia_classification, AphiaID, scientificname)
fish_with_no_parasite <- inner_join(fish_with_no_parasite, all_fish_species_aphia, 
                                    by=c('scientificName'='scientificname'))

write.table(fish_with_no_parasite, "fish_with_no_parasite.txt",
            row.names = FALSE, col.names = TRUE, sep =";")

################################################################################
############################ RETRIEVE BODY SIZE DATA ###########################
################################################################################

all_fish_aphia <- select(all_fish_species_aphia, AphiaID)
all_fish_aphia <- unique(all_fish_aphia)

#merge with TL
# Select Rows by Index Range
all_fish_Aphia_ids_1000 <- all_fish_aphia %>% slice(1:1000)
all_fish_Aphia_ids_2000 <- all_fish_aphia %>% slice(1001:2000)
all_fish_Aphia_ids_3000 <- all_fish_aphia %>% slice(2001:3000)
all_fish_Aphia_ids_4000 <- all_fish_aphia %>% slice(3001:4000)
all_fish_Aphia_ids_5000 <- all_fish_aphia %>% slice(4001:5000)
all_fish_Aphia_ids_6000 <- all_fish_aphia %>% slice(5001:6000)
all_fish_Aphia_ids_7000 <- all_fish_aphia %>% slice(6001:7000)
all_fish_Aphia_ids_8000 <- all_fish_aphia %>% slice(7001:8000)
all_fish_Aphia_ids_9000 <- all_fish_aphia %>% slice(8001:9000)
all_fish_Aphia_ids_9545 <- all_fish_aphia %>% slice(9001:9545)


all_fish_Aphia_ids_1000_list <- list()
for (i in all_fish_Aphia_ids_1000) {
  all_fish_Aphia_ids_1000_list <- append(all_fish_Aphia_ids_1000_list, i)
}
all_fish_Aphia_ids_1000_list <- as.integer(all_fish_Aphia_ids_1000_list)
all_fish_attributes_1000 <- wm_attr_data_(id = all_fish_Aphia_ids_1000_list)


all_fish_Aphia_ids_2000_list <- list()
for (i in all_fish_Aphia_ids_2000) {
  all_fish_Aphia_ids_2000_list <- append(all_fish_Aphia_ids_2000_list, i)
}
all_fish_Aphia_ids_2000_list <- as.integer(all_fish_Aphia_ids_2000_list)
all_fish_attributes_2000 <- wm_attr_data_(id = all_fish_Aphia_ids_2000_list)

all_fish_Aphia_ids_3000_list <- list()
for (i in all_fish_Aphia_ids_3000) {
  all_fish_Aphia_ids_3000_list <- append(all_fish_Aphia_ids_3000_list, i)
}
all_fish_Aphia_ids_3000_list <- as.integer(all_fish_Aphia_ids_3000_list)
all_fish_attributes_3000 <- wm_attr_data_(id = all_fish_Aphia_ids_3000_list)


all_fish_Aphia_ids_4000_list <- list()
for (i in all_fish_Aphia_ids_4000) {
  all_fish_Aphia_ids_4000_list <- append(all_fish_Aphia_ids_4000_list, i)
}
all_fish_Aphia_ids_4000_list <- as.integer(all_fish_Aphia_ids_4000_list)
all_fish_attributes_4000 <- wm_attr_data_(id = all_fish_Aphia_ids_4000_list)

all_fish_Aphia_ids_5000_list <- list()
for (i in all_fish_Aphia_ids_5000) {
  all_fish_Aphia_ids_5000_list <- append(all_fish_Aphia_ids_5000_list, i)
}
all_fish_Aphia_ids_5000_list <- as.integer(all_fish_Aphia_ids_5000_list)
all_fish_attributes_5000 <- wm_attr_data_(id = all_fish_Aphia_ids_5000_list)

all_fish_Aphia_ids_6000_list <- list()
for (i in all_fish_Aphia_ids_6000) {
  all_fish_Aphia_ids_6000_list <- append(all_fish_Aphia_ids_6000_list, i)
}
all_fish_Aphia_ids_6000_list <- as.integer(all_fish_Aphia_ids_6000_list)
all_fish_attributes_6000 <- wm_attr_data_(id = all_fish_Aphia_ids_6000_list)

all_fish_Aphia_ids_7000_list <- list()
for (i in all_fish_Aphia_ids_7000) {
  all_fish_Aphia_ids_7000_list <- append(all_fish_Aphia_ids_7000_list, i)
}
all_fish_Aphia_ids_7000_list <- as.integer(all_fish_Aphia_ids_7000_list)
all_fish_attributes_7000 <- wm_attr_data_(id = all_fish_Aphia_ids_7000_list)

all_fish_Aphia_ids_8000_list <- list()
for (i in all_fish_Aphia_ids_8000) {
  all_fish_Aphia_ids_8000_list <- append(all_fish_Aphia_ids_8000_list, i)
}
all_fish_Aphia_ids_8000_list <- as.integer(all_fish_Aphia_ids_8000_list)
all_fish_attributes_8000 <- wm_attr_data_(id = all_fish_Aphia_ids_8000_list)

all_fish_Aphia_ids_9000_list <- list()
for (i in all_fish_Aphia_ids_9000) {
  all_fish_Aphia_ids_9000_list <- append(all_fish_Aphia_ids_9000_list, i)
}
all_fish_Aphia_ids_9000_list <- as.integer(all_fish_Aphia_ids_9000_list)
all_fish_attributes_9000 <- wm_attr_data_(id = all_fish_Aphia_ids_9000_list)
all_fish_attributes_9000 <- select(all_fish_attributes_9000, -message)

all_fish_Aphia_ids_9545_list <- list()
for (i in all_fish_Aphia_ids_9545) {
  all_fish_Aphia_ids_9545_list <- append(all_fish_Aphia_ids_9545_list, i)
}
all_fish_Aphia_ids_9545_list <- as.integer(all_fish_Aphia_ids_9545_list)
all_fish_attributes_9545 <- wm_attr_data_(id = all_fish_Aphia_ids_9545_list)

all_fish_attributes <- rbind(all_fish_attributes_1000, all_fish_attributes_2000, 
                             all_fish_attributes_3000, all_fish_attributes_4000, 
                             all_fish_attributes_5000, all_fish_attributes_6000, 
                             all_fish_attributes_7000,  all_fish_attributes_8000, 
                             all_fish_attributes_9000, all_fish_attributes_9545)
unique(all_fish_attributes$measurementType)

all_fish_attributes_bodysize <- all_fish_attributes %>% 
  filter(str_detect(measurementType, "Body size"))
all_fish_attributes_bodysize <- all_fish_attributes_bodysize %>% unnest(children, names_sep = "_")

##Coerce the data.frame to all-character
all_fish_attributes_bodysize = data.frame(lapply(all_fish_attributes_bodysize, as.character), stringsAsFactors=FALSE)

all_fish_attributes_bodysize <- select(all_fish_attributes_bodysize, AphiaID, measurementValue)
all_fish_attributes_bodysize <- merge(all_fish_attributes_bodysize, all_fish_species_aphia, 
                                      by = c("AphiaID" = "AphiaID"), all.x=TRUE)
all_fish_attributes_bodysize_max <- all_fish_attributes_bodysize %>% group_by(AphiaID,scientificname) %>% slice(which.max(measurementValue))

#correct based on the all_fish_habitat species

all_fish_attributes_bodysize_max <- semi_join(all_fish_attributes_bodysize_max, all_fish_habitat, 
                                          by = c("scientificname"="Species"))


################################################################################
##################### RETRIEVE DIET AND FEEDING TYPE ###########################
################################################################################

# Retrieve ecology from FishBase 
## trophic levels and standard errors for a list of species
all_fish_ecology <- ecology(species_list = all_fish_habitat$Species, 
                                  fields=c("Species", "Herbivory2", "FeedingType", "DietRemark", "FoodRemark"))
write.table(all_fish_ecology, "all_fish_ecology.txt", 
            row.names = FALSE, col.names = TRUE, sep = ";")

length(unique(all_fish_ecology$Species))

all_fish_fooditems <- fooditems(species_list = all_fish_habitat$Species)
all_fish_fooditems <- select(all_fish_fooditems, -Locality, -C_Code, -FoodsRefNo, 
                                   -Commoness, -CommonessII)
write.table(all_fish_fooditems, "all_fish_fooditems.txt", 
            row.names = FALSE, col.names = TRUE, sep = ";")

all_fish_diet <- diet(species_list = all_fish_habitat$Species)
write.table(all_fish_diet, "all_fish_diet.txt", 
            row.names = FALSE, col.names = TRUE, sep = ";")

all_fish_diet_items <- diet_items(species_list = all_fish_habitat$Species)
write.table(all_fish_diet_items, "all_fish_diet_items.txt", 
            row.names = FALSE, col.names = TRUE, sep = ";")

#Save the workspace
save.image(file = "fish_checklist_all.RData")

################################################################################
################################################################################
################################################################################

