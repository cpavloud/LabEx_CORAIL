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

################################################################################
####################### RETRIEVE FISH LISTS FROM ###############################
############# LOCALLY STORED DATABASES ON TREMATOD AND COPEPODS ################
################### AND FROM THE TREMATOD DATABASE OF NHM ######################
################################################################################

#import the information on the MEOW provinces
MEOW_provinces <- read.csv("Spalding_provinces.txt", sep = '\t', header = TRUE)

#import the local Trematoda database
Trematoda_local <- read.csv("Trematoda_local_database.txt", sep = '\t', header = TRUE)
Trematoda_local <- merge(MEOW_provinces, Trematoda_local, by=c('PROV_CODE'='PROV_CODE'), all.y=TRUE)
Trematoda_local <- select(Trematoda_local, -RLM_CODE, -REALM, -Lat_Zone)
#sanity check
colSums(is.na(Trematoda_local))

#import the NHM Trematoda database
Trematoda_NHM <- read.csv("NHM_trematoda_host_species_province.txt", sep = '\t', header = TRUE)
Trematoda_NHM <- select(Trematoda_NHM, -Authority, -Location)
Trematoda_NHM <- merge(MEOW_provinces, Trematoda_NHM, by=c('PROVINCE'='PROVINCE'), all.y=TRUE)
Trematoda_NHM <- select(Trematoda_NHM, -RLM_CODE, -REALM, -Lat_Zone)
#sanity check
colSums(is.na(Trematoda_NHM))

#merge the Trematoda data frames
Trematoda <- rbind(Trematoda_local, Trematoda_NHM)
#sanity check
colSums(is.na(Trematoda))
Trematoda <- unique(Trematoda)

#import the local Copepoda database
Copepoda_local <- read.csv("Copepoda_local_database.txt", sep = '\t', header = TRUE)
Copepoda_local <- merge(MEOW_provinces, Copepoda_local, by=c('PROVINCE'='PROVINCE'), all.y=TRUE)
Copepoda_local <- select(Copepoda_local, -RLM_CODE, -REALM, -Lat_Zone)

#sanity check
colSums(is.na(Copepoda_local))
Copepoda_local <- unique(Copepoda_local)

################################################################################
################################ COMBINE FISH HOSTS ############################
################################################################################

Copepoda_host <- select(Copepoda_local, scientificName_Host)
Copepoda_host <- unique(Copepoda_host)
Trematoda_host <- select(Trematoda, scientificName_Host)
Trematoda_host <- unique(Trematoda_host)

Fish_Hosts <- rbind(Copepoda_host, Trematoda_host)
Fish_Hosts <- unique(Fish_Hosts)


#Save the workspace
save.image(file = "Fish_Hosts.RData")

################################################################################
################################################################################
################################################################################
