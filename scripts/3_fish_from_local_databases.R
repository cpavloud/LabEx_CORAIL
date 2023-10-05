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
Trematoda_local <- select(Trematoda_local, -RLM_CODE, -PROV_CODE, -Lat_Zone)
#sanity check
colSums(is.na(Trematoda_local))

#import the NHM Trematoda database
Trematoda_NHM <- read.csv("NHM_trematoda_host_species_province.txt", sep = '\t', header = TRUE)
Trematoda_NHM <- select(Trematoda_NHM, -Authority, -Location)
Trematoda_NHM <- merge(MEOW_provinces, Trematoda_NHM, by=c('PROVINCE'='PROVINCE'), all.y=TRUE)
Trematoda_NHM <- select(Trematoda_NHM, -RLM_CODE, -PROV_CODE, -Lat_Zone)
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
Copepoda_local <- select(Copepoda_local, -RLM_CODE, -PROV_CODE, -Lat_Zone)

#sanity check
colSums(is.na(Copepoda_local))
Copepoda_local <- unique(Copepoda_local)

################################################################################
################################ COMBINE PARASITES# ############################
################################################################################

Parasites <- rbind(Copepoda_local, Trematoda)

#delete rows containg fish which cannot be found in WoRMS
Parasites <- Parasites %>% 
  dplyr::filter(!scientificName_Host %in% c("Synodus elongatus", "Chlorurus frenatus", 
                                            "Mugil parvus", "Carangoides kalla", 
                                            "Lagocephalus lunaris spadiceus", "Carangoides mate", 
                                            "Carangoides djeddaba", "Polymorphus indicus", 
                                            "Tetraodon viridipunctatus", "Tylosurus anstomella", 
                                            "Synagris taeniopterus"))

################################################################################
################################ COMBINE FISH HOSTS ############################
################################################################################

Fish_Hosts <- select(Parasites, -scientificName_Parasite)
Fish_Hosts <- unique(Fish_Hosts)

Fish_Hosts_species <- select(Fish_Hosts, scientificName_Host)
Fish_Hosts_species <- unique(Fish_Hosts_species)
Fish_Hosts_species_list <- list()
for (i in Fish_Hosts_species) {
  Fish_Hosts_species_list <- append(Fish_Hosts_species_list, i)
}
Fish_Hosts_species_list <- as.character(Fish_Hosts_species_list)

#RETRIEVE APHIA IDs
Fish_Hosts_species_Aphia <- match_taxa(Fish_Hosts_species_list, ask=TRUE)
Fish_Hosts_species_Aphia <- Fish_Hosts_species_Aphia %>% drop_na()
A <- select(Fish_Hosts_species_Aphia, scientificName)
A <- unique(A)
B <- select(Fish_Hosts_species, scientificName_Host)
B <- unique(B)
colnames(B)[colnames(B) == "scientificName_Host"] ="scientificName"
Species_with_no_aphia <- anti_join(B, A)

Species_with_no_aphia <- Species_with_no_aphia %>% mutate(aphiaID =
                                                            case_when(scientificName == "Tandanus tandanus" ~ "1022552", 
                                                                      scientificName == "Neoceratodus forsteri" ~ "1421405", 
                                                                      scientificName == "Xiphophorus maculatus" ~ "862549", 
                                                                      scientificName == "Neosilurus ater" ~ "991288", 
                                                                      scientificName == "Craterocephalus marjoriae" ~ "1014294", 
                                                                      scientificName == "Melanotaenia duboulayi" ~ "1020149", 
                                                                      scientificName == "Sphoeroides ocellatus" ~ "298214", 
                                                                      scientificName == "Leiocassis brashnikowi" ~ "1623431",
                                                                      scientificName == "Pseudecheneis sulcata" ~ "1022207",
                                                                      scientificName == "Leiopotherapon plumbeus" ~ "1020693", 
                                                                      scientificName == "Maccullochella macquariensis" ~ "991272",
                                                                      scientificName == "Glyptothorax sinensis" ~ "1018215",
                                                                      scientificName == "Leiocassis hainanensis" ~ "1015325"))

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

Fish_Hosts_species_Aphia <- Fish_Hosts_species_Aphia %>% 
  bind_cols(split_into_multiple(.$scientificNameID, ":", "scientificNameID")) %>% 
  # selecting those that start with 'type_' will remove the original 'type' column
  select(scientificName, match_type, starts_with("scientificNameID_"))

colnames(Fish_Hosts_species_Aphia)[colnames(Fish_Hosts_species_Aphia) == "scientificNameID_5"] ="aphiaID"
Fish_Hosts_species_Aphia <- select(Fish_Hosts_species_Aphia, scientificName, aphiaID)
Fish_Hosts_species_Aphia <- rbind(Fish_Hosts_species_Aphia, Species_with_no_aphia)

#merge the AphiaID to the intial data frame
Fish_Hosts_to_merge <- inner_join(Fish_Hosts, Fish_Hosts_species_Aphia, 
                                      by=c('scientificName_Host'='scientificName'))

#Save the workspace
save.image(file = "Fish_Hosts.RData")

################################################################################
################################################################################
################################################################################
