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
.packages = c("tidyverse", "rfishbase", "readxl", "taxize", 
              "Orcs", "usefun", "RSQLite", "DBI", "rredlist")

# Install CRAN packages (if not already installed)
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])

# Load packages into session 
lapply(.packages, require, character.only=TRUE)

packageVersion("tidyverse")
packageVersion("rfishbase")
packageVersion("readxl")
packageVersion("taxize")
packageVersion("Orcs")
packageVersion("usefun")
packageVersion("RSQLite")
packageVersion("DBI")
packageVersion("rredlist")

################################################################################
#################### CREATION OF THE FISHBASE LIST# ############################
################################################################################

# Import data from fishbase
Arhem <-species_by_ecosystem(ecosystem = "Arnhem Coast to Gulf of Carpenteria", server = "fishbase")
Arhem <- Arhem %>% mutate(PROVINCE = "Sahul Shelf")
Arhem <- Arhem %>% mutate(REALM = "Central Indo-Pacific")

Arafura <-species_by_ecosystem(ecosystem = "Arafura Sea", server = "fishbase")
Arafura <- Arafura %>% mutate(PROVINCE = "Sahul Shelf")
Arafura <- Arafura %>% mutate(REALM = "Central Indo-Pacific")

Banda <-species_by_ecosystem(ecosystem = "Banda Sea", server = "fishbase")
Banda <- Banda %>% mutate(PROVINCE = "Western Coral Triangle")
Banda <- Banda %>% mutate(REALM = "Central Indo-Pacific")

Bismarck <-species_by_ecosystem(ecosystem = "Bismarck Sea", server = "fishbase")
Bismarck <- Bismarck %>% mutate(PROVINCE = "Eastern Coral Triangle")
Bismarck <- Bismarck %>% mutate(REALM = "Central Indo-Pacific")

Bonaparte <-species_by_ecosystem(ecosystem = "Bonaparte Coast", server = "fishbase")
Bonaparte <- Bonaparte %>% mutate(PROVINCE = "Sahul Shelf")
Bonaparte <- Bonaparte %>% mutate(REALM = "Central Indo-Pacific")

Cocos <-species_by_ecosystem(ecosystem = "Cocos-Keeling/Christmas Island", server = "fishbase")
Cocos <- Cocos %>% mutate(PROVINCE = "Java Transitional")
Cocos <- Cocos %>% mutate(REALM = "Central Indo-Pacific")

Coral <-species_by_ecosystem(ecosystem = "Coral Sea", server = "fishbase")
Coral <- Coral %>% mutate(PROVINCE = "Tropical Southwestern Pacific")
Coral <- Coral %>% mutate(REALM = "Central Indo-Pacific")

East_Caroline <-species_by_ecosystem(ecosystem = "East Caroline Islands", server = "fishbase")
East_Caroline <- East_Caroline %>% mutate(PROVINCE = "Tropical Northwestern Pacific")
East_Caroline <- East_Caroline %>% mutate(REALM = "Central Indo-Pacific")

Easter <-species_by_ecosystem(ecosystem = "Easter Island", server = "fishbase")
Easter <- Easter %>% mutate(PROVINCE = "Easter Island")
Easter <- Easter %>% mutate(REALM = "Eastern Indo-Pacific")

Philippines <-species_by_ecosystem(ecosystem = "Eastern Philippines", server = "fishbase")
Philippines <- Philippines %>% mutate(PROVINCE = "Western Coral Triangle")
Philippines <- Philippines %>% mutate(REALM = "Central Indo-Pacific")

Exmouth <-species_by_ecosystem(ecosystem = "Exmouth to Broome", server = "fishbase")
Exmouth <- Exmouth %>% mutate(PROVINCE = "Northwest Australian Shelf")
Exmouth <- Exmouth %>% mutate(REALM = "Central Indo-Pacific")

Fiji <-species_by_ecosystem(ecosystem = "Fiji Islands", server = "fishbase")
Fiji <- Fiji %>% mutate(PROVINCE = "Tropical Southwestern Pacific")
Fiji <- Fiji %>% mutate(REALM = "Central Indo-Pacific")

Gilbert <-species_by_ecosystem(ecosystem = "Gilbert/Ellis Islands", server = "fishbase")
Gilbert <- Gilbert %>% mutate(PROVINCE = "Marshall, Gilbert and Ellis Islands")
Gilbert <- Gilbert %>% mutate(REALM = "Eastern Indo-Pacific")

Gulf_Papua <-species_by_ecosystem(ecosystem = "Gulf of Papua", server = "fishbase")
Gulf_Papua <- Gulf_Papua %>% mutate(PROVINCE = "Sahul Shelf")
Gulf_Papua <- Gulf_Papua %>% mutate(REALM = "Central Indo-Pacific")

Gulf_Thailand <-species_by_ecosystem(ecosystem = "Gulf of Thailand", server = "fishbase")
Gulf_Thailand <- Gulf_Thailand %>% mutate(PROVINCE = "Sunda Shelf")
Gulf_Thailand <- Gulf_Thailand %>% mutate(REALM = "Central Indo-Pacific")

Gulf_Tonkin <-species_by_ecosystem(ecosystem = "Gulf of Tonkin", server = "fishbase")
Gulf_Tonkin <- Gulf_Tonkin %>% mutate(PROVINCE = "South China Sea")
Gulf_Tonkin <- Gulf_Tonkin %>% mutate(REALM = "Central Indo-Pacific")

Halmahera <-species_by_ecosystem(ecosystem = "Halmahera", server = "fishbase")
Halmahera <- Gulf_Tonkin %>% mutate(PROVINCE = "Western Coral Triangle")
Halmahera <- Gulf_Tonkin %>% mutate(REALM = "Central Indo-Pacific")

Hawaii <-species_by_ecosystem(ecosystem = "Hawaii", server = "fishbase")
Hawaii <- Hawaii %>% mutate(PROVINCE = "Hawaii")
Hawaii <- Hawaii %>% mutate(REALM = "Eastern Indo-Pacific")

Lesser_Sunda <-species_by_ecosystem(ecosystem = "Lesser Sunda", server = "fishbase")
Lesser_Sunda <- Lesser_Sunda %>% mutate(PROVINCE = "Western Coral Triangle")
Lesser_Sunda <- Lesser_Sunda %>% mutate(REALM = "Central Indo-Pacific")

Line_Islands <-species_by_ecosystem(ecosystem = "Line Islands", server = "fishbase")
Line_Islands <- Line_Islands %>% mutate(PROVINCE = "Central Polynesia")
Line_Islands <- Line_Islands %>% mutate(REALM = "Eastern Indo-Pacific")

Lord <-species_by_ecosystem(ecosystem = "Lord Howe and Norfolk Islands", server = "fishbase")
Lord <- Lord %>% mutate(PROVINCE = "Lord Howe and Norfolk Islands")
Lord <- Lord %>% mutate(REALM = "Central Indo-Pacific")

Malacca <-species_by_ecosystem(ecosystem = "Malacca Strait", server = "fishbase")
Malacca <- Malacca %>% mutate(PROVINCE = "Sunda Shelf")
Malacca <- Malacca %>% mutate(REALM = "Central Indo-Pacific")

Mariana <-species_by_ecosystem(ecosystem = "Mariana Islands", server = "fishbase")
Mariana <- Mariana %>% mutate(PROVINCE = "Tropical Northwestern Pacific")
Mariana <- Mariana %>% mutate(REALM = "Central Indo-Pacific")

Tuamotus <-species_by_ecosystem(ecosystem = "Tuamotus", server = "fishbase")
Tuamotus <- Tuamotus %>% mutate(PROVINCE = "Southeast Polynesia")
Tuamotus <- Tuamotus %>% mutate(REALM = "Eastern Indo-Pacific")

Marshall <-species_by_ecosystem(ecosystem = "Marshall Islands", server = "fishbase")
Marshall <- Marshall %>% mutate(PROVINCE = "Marshall, Gilbert and Ellis Islands")
Marshall <- Marshall %>% mutate(REALM = "Eastern Indo-Pacific")

Caledonia <-species_by_ecosystem(ecosystem = "New Caledonia", server = "fishbase")
Caledonia <- Caledonia %>% mutate(PROVINCE = "Tropical Southwestern Pacific")
Caledonia <- Caledonia %>% mutate(REALM = "Central Indo-Pacific")

Ningaloo <-species_by_ecosystem(ecosystem = "Ningaloo", server = "fishbase")
Ningaloo <- Ningaloo %>% mutate(PROVINCE = "Northwest Australian Shelf")
Ningaloo <- Ningaloo %>% mutate(REALM = "Central Indo-Pacific")

Northeast_Sulawesi <-species_by_ecosystem(ecosystem = "Northeast Sulawesi", server = "fishbase")
Northeast_Sulawesi <- Northeast_Sulawesi %>% mutate(PROVINCE = "Western Coral Triangle")
Northeast_Sulawesi <- Northeast_Sulawesi %>% mutate(REALM = "Central Indo-Pacific")

Ogasawara <-species_by_ecosystem(ecosystem = "Ogasawara Islands", server = "fishbase")
Ogasawara <- Ogasawara %>% mutate(PROVINCE = "Tropical Northwestern Pacific")
Ogasawara <- Ogasawara %>% mutate(REALM = "Central Indo-Pacific")

Palawan <-species_by_ecosystem(ecosystem = "Palawan/North Borneo", server = "fishbase")
Palawan <- Palawan %>% mutate(PROVINCE = "Western Coral Triangle")
Palawan <- Palawan %>% mutate(REALM = "Central Indo-Pacific")

Papua <-species_by_ecosystem(ecosystem = "Papua", server = "fishbase")
Papua <- Papua %>% mutate(PROVINCE = "Western Coral Triangle")
Papua <- Papua %>% mutate(REALM = "Central Indo-Pacific")

Phoenix <-species_by_ecosystem(ecosystem = "Phoenix/Tokelau/Northern Cook Islands", server = "fishbase")
Phoenix <- Phoenix %>% mutate(PROVINCE = "Central Polynesia")
Phoenix <- Phoenix %>% mutate(REALM = "Eastern Indo-Pacific")

Rapa <-species_by_ecosystem(ecosystem = "Rapa-Pitcairn", server = "fishbase")
Rapa <- Rapa %>% mutate(PROVINCE = "Southeast Polynesia")
Rapa <- Rapa %>% mutate(REALM = "Eastern Indo-Pacific")

Samoa <-species_by_ecosystem(ecosystem = "Samoa Islands", server = "fishbase")
Samoa <- Samoa %>% mutate(PROVINCE = "Central Polynesia")
Samoa <- Samoa %>% mutate(REALM = "Eastern Indo-Pacific")

Society <-species_by_ecosystem(ecosystem = "Society Islands", server = "fishbase")
Society <- Society %>% mutate(PROVINCE = "Southeast Polynesia")
Society <- Society %>% mutate(REALM = "Eastern Indo-Pacific")

Solomon_Archipelago <-species_by_ecosystem(ecosystem = "Solomon Archipelago", server = "fishbase")
Solomon_Archipelago <- Solomon_Archipelago %>% mutate(PROVINCE = "Eastern Coral Triangle")
Solomon_Archipelago <- Solomon_Archipelago %>% mutate(REALM = "Central Indo-Pacific")

Solomon_Sea <-species_by_ecosystem(ecosystem = "Solomon Sea", server = "fishbase")
Solomon_Sea <- Solomon_Sea %>% mutate(PROVINCE = "Eastern Coral Triangle")
Solomon_Sea <- Solomon_Sea %>% mutate(REALM = "Central Indo-Pacific")

South_China_Sea <-species_by_ecosystem(ecosystem = "South China Sea Oceanic Islands", server = "fishbase")
South_China_Sea <- South_China_Sea %>% mutate(PROVINCE = "South China Sea")
South_China_Sea <- South_China_Sea %>% mutate(REALM = "Central Indo-Pacific")

South_Kuroshio <-species_by_ecosystem(ecosystem = "South Kuroshio", server = "fishbase")
South_Kuroshio <- South_Kuroshio %>% mutate(PROVINCE = "South Kuroshio")
South_Kuroshio <- South_Kuroshio %>% mutate(REALM = "Central Indo-Pacific")

Papua_New_Guinea <-species_by_ecosystem(ecosystem = "Southeast Papua New Guinea", server = "fishbase")
Papua_New_Guinea <- Papua_New_Guinea %>% mutate(PROVINCE = "Eastern Coral Triangle")
Papua_New_Guinea <- Papua_New_Guinea %>% mutate(REALM = "Central Indo-Pacific")

Southern_China <-species_by_ecosystem(ecosystem = "Southern China", server = "fishbase")
Southern_China <- Southern_China %>% mutate(PROVINCE = "South China Sea")
Southern_China <- Southern_China %>% mutate(REALM = "Central Indo-Pacific")

Vietnam <-species_by_ecosystem(ecosystem = "Southern Vietnam", server = "fishbase")
Vietnam <- Vietnam %>% mutate(PROVINCE = "Sunda Shelf")
Vietnam <- Vietnam %>% mutate(REALM = "Central Indo-Pacific")

Sulawesi <-species_by_ecosystem(ecosystem = "Sulawesi Sea/Makassar Strait", server = "fishbase")
Sulawesi <- Sulawesi %>% mutate(PROVINCE = "Western Coral Triangle")
Sulawesi <- Sulawesi %>% mutate(REALM = "Central Indo-Pacific")

Tonga  <-species_by_ecosystem(ecosystem = "Tonga Islands", server = "fishbase")
Tonga <- Tonga %>% mutate(PROVINCE = "Tropical Southwestern Pacific")
Tonga <- Tonga %>% mutate(REALM = "Central Indo-Pacific")

Marquesas <-species_by_ecosystem(ecosystem = "Marquesas", server = "fishbase")
Marquesas <- Marquesas %>% mutate(PROVINCE = "Marquesas")
Marquesas <- Marquesas %>% mutate(REALM = "Eastern Indo-Pacific")

Vanuatu <-species_by_ecosystem(ecosystem = "Vanuatu", server = "fishbase")
Vanuatu <- Vanuatu %>% mutate(PROVINCE = "Tropical Southwestern Pacific")
Vanuatu <- Vanuatu %>% mutate(REALM = "Central Indo-Pacific")

West_Caroline <-species_by_ecosystem(ecosystem = "West Caroline Islands", server = "fishbase")
West_Caroline <- West_Caroline %>% mutate(PROVINCE = "Tropical Northwestern Pacific")
West_Caroline <- West_Caroline %>% mutate(REALM = "Central Indo-Pacific")

Southern_Java <-species_by_ecosystem(ecosystem = "Southern Java", server = "fishbase")
Southern_Java <- Southern_Java %>% mutate(PROVINCE = "Java Transitional")
Southern_Java <- Southern_Java %>% mutate(REALM = "Central Indo-Pacific")

Torres <-species_by_ecosystem(ecosystem = "Torres Strait Northern Great Barrier Reef", server = "fishbase")
Torres <- Torres %>% mutate(PROVINCE = "Northeast Australian Shelf")
Torres <- Torres %>% mutate(REALM = "Central Indo-Pacific")

Central_Southern_Great_Barrier <-species_by_ecosystem(ecosystem = "Central and Southern Great Barrier Reef", server = "fishbase")
Central_Southern_Great_Barrier <- Central_Southern_Great_Barrier %>% mutate(PROVINCE = "Northeast Australian Shelf")
Central_Southern_Great_Barrier <- Central_Southern_Great_Barrier %>% mutate(REALM = "Central Indo-Pacific")

Sunda_Shelf_Java <-species_by_ecosystem(ecosystem = "Sunda Shelf/Java Sea", server = "fishbase")
Sunda_Shelf_Java <- Sunda_Shelf_Java %>% mutate(PROVINCE = "Sunda Shelf")
Sunda_Shelf_Java <- Sunda_Shelf_Java %>% mutate(REALM = "Central Indo-Pacific")

Southern_Cook <-species_by_ecosystem(ecosystem = "Southern Cook/Austral Islands", server = "fishbase")
Southern_Cook <- Southern_Cook %>% mutate(PROVINCE = "Southeast Polynesia")
Southern_Cook <- Southern_Cook %>% mutate(REALM = "Eastern Indo-Pacific")

all_fishbase_spalding <- rbind(Arhem, Arafura, Banda, Bismarck, Bonaparte, 
                               Cocos, Coral, East_Caroline, Easter, Philippines, 
                               Exmouth, Fiji, Gilbert, Gulf_Papua, Gulf_Thailand, Gulf_Tonkin, 
                               Halmahera, Hawaii, Lesser_Sunda, Line_Islands, Lord, 
                               Malacca, Mariana, Tuamotus, Marshall, Caledonia, Ningaloo, Northeast_Sulawesi, 
                               Ogasawara, Palawan, Papua, Phoenix, Rapa, Samoa, Society, Solomon_Archipelago, 
                               Solomon_Sea, South_China_Sea, South_Kuroshio, Papua_New_Guinea, Southern_China, 
                               Vietnam, Sulawesi, Tonga, Marquesas, Vanuatu, West_Caroline, Southern_Java, 
                               Torres, Central_Southern_Great_Barrier,Sunda_Shelf_Java, Southern_Cook)
length(unique(all_fishbase_spalding$Species))
all_fishbase_spalding$Species[all_fishbase_spalding$Species == 'Amblyrhynchote honckenii'] <- 'Amblyrhynchotes honckenii'
length(unique(all_fishbase_spalding$Species))

write.table(all_fishbase_spalding, "all_fishbase_spalding.txt", 
            row.names = FALSE, col.names = TRUE, sep = ";")

#Save the workspace
save.image(file = "fishbase_ecoregions.RData")

################################################################################
################################################################################
################################################################################
