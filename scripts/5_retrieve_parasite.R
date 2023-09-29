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
################################################################################
################################################################################

#import host parasite list from worms
host_prey_attributes_20230627 <- read.csv("host-prey attributes_20230627.txt", header=TRUE, sep='\t')
host_prey_attributes_12092023 <- read.csv("host-prey attributes_12092023.txt", header=TRUE, sep='\t')
host_prey_attributes_20230925 <- read.csv("host-prey attributes_20230925.txt", header=TRUE, sep='\t')

host_prey_attributes_12092023 <- select(host_prey_attributes_12092023, -source_name, 
                                        -attribute_note, -at_group_root)
host_prey_attributes_20230925 <- select(host_prey_attributes_20230925, -source_name, 
                                        -attribute_note, -at_group_root)
host_prey_attributes <- rbind(host_prey_attributes_20230627, host_prey_attributes_12092023, 
                              host_prey_attributes_20230925)
host_prey_attributes <- select(host_prey_attributes, AphiaID, scientificName, kingdom, 
                               phylum, class, order, family, genus, measurementType, 
                               measurementValueID, measurementValue)

host_prey_attributes <- host_prey_attributes %>% 
  dplyr::filter(measurementType %in% c("Feedingtype > Host/prey"))

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

host_prey_attributes <- host_prey_attributes %>% 
  bind_cols(split_into_multiple(.$measurementValueID, ":", "measurementValueID")) %>% 
  # selecting those that start with 'type_' will remove the original 'type' column
  select(AphiaID, scientificName, genus, family, order, class, phylum, kingdom, measurementValue, starts_with("measurementValueID_"))
host_prey_attributes <- select(host_prey_attributes, -measurementValueID_1, 
                                     -measurementValueID_2, -measurementValueID_3, 
                                     -measurementValueID_4)
colnames(host_prey_attributes)[colnames(host_prey_attributes) == "measurementValueID_5"] ="AphiaID_Host"




worms_info
#worms_info_parasites_hosts.txt



################################################################################
######################## LOAD OTHER PARASITE LISTS #############################
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







  

#Save the workspace
save.image(file = "parasite.RData")

################################################################################
################################################################################
################################################################################
  
