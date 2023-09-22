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
.packages = c("tidyverse")

# Install CRAN packages (if not already installed)
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])

# Load packages into session 
lapply(.packages, require, character.only=TRUE)

packageVersion("tidyverse")

################################################################################
################## CREATION OF THE BARCODE FISH LIST ###########################
################################################################################

#read the DNA barcode reference library of French Polynesian shore fishes 
#(Delrieu-Trottin et al., 2019)

Fish_Barcoding <- read.csv("Fish_Barcoding_FrenchPolynesia.txt", header = TRUE, 
                           sep = "\t")
Fish_Barcoding$species_name[Fish_Barcoding$species_name == 'Trachinotus sp.'] <- 'Trachinotus'
Fish_Barcoding$species_name[Fish_Barcoding$species_name == 'Aseraggodes sp. 2 Moorea'] <- 'Aseraggodes'
Fish_Barcoding$species_name[Fish_Barcoding$species_name == 'Ferdauia ferdau'] <- 'Carangoides ferdau'
Fish_Barcoding$genus_name[Fish_Barcoding$genus_name == 'Ferdauia'] <- 'Carangoides'
Fish_Barcoding[Fish_Barcoding == ""] <- NA                     # Replace blank by NA
Fish_Barcoding <- Fish_Barcoding %>% drop_na(species_name)
Fish_Barcoding <- Fish_Barcoding[!(Fish_Barcoding$species_name=="Aseraggodes" | Fish_Barcoding$species_name=="Trachinotus"),]
colnames(Fish_Barcoding)[colnames(Fish_Barcoding) == "family_name"] ="Family"
colnames(Fish_Barcoding)[colnames(Fish_Barcoding) == "order_name"] ="Order"
colnames(Fish_Barcoding)[colnames(Fish_Barcoding) == "genus_name"] ="Genus"
colnames(Fish_Barcoding)[colnames(Fish_Barcoding) == "species_name"] ="Species"
length(unique(Fish_Barcoding$Species))

Fish_Barcoding_to_merge <- select(Fish_Barcoding, Species, ECOREGION, PROVINCE, REALM)

Fish_Barcoding_to_merge_species <- select(Fish_Barcoding_to_merge, Species)
Fish_Barcoding_to_merge_species <- unique(Fish_Barcoding_to_merge_species)
Fish_Barcoding_to_merge_species_list <- list()
for (i in Fish_Barcoding_to_merge_species) {
  Fish_Barcoding_to_merge_species_list <- append(Fish_Barcoding_to_merge_species_list, i)
}
Fish_Barcoding_to_merge_species_list <- as.character(Fish_Barcoding_to_merge_species_list)

#RETRIEVE APHIA IDs
Fish_Barcoding_to_merge_species_Aphia <- match_taxa(Fish_Barcoding_to_merge_species_list, ask=TRUE)
Fish_Barcoding_to_merge_species_Aphia <- Fish_Barcoding_to_merge_species_Aphia %>% drop_na()

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

Fish_Barcoding_to_merge_species_Aphia <- Fish_Barcoding_to_merge_species_Aphia %>% 
  bind_cols(split_into_multiple(.$scientificNameID, ":", "scientificNameID")) %>% 
  # selecting those that start with 'type_' will remove the original 'type' column
  select(scientificName, match_type, starts_with("scientificNameID_"))

colnames(Fish_Barcoding_to_merge_species_Aphia)[colnames(Fish_Barcoding_to_merge_species_Aphia) == "scientificNameID_5"] ="aphiaID"
Fish_Barcoding_to_merge_species_Aphia <- select(Fish_Barcoding_to_merge_species_Aphia, scientificName, aphiaID)

#merge the AphiaID to the intial data frame
Fish_Barcoding_to_merge <- inner_join(Fish_Barcoding_to_merge, Fish_Barcoding_to_merge_species_Aphia, 
                                    by=c('Species'='scientificName'))

################################################################################
################ CREATION OF THE CLEANER REEF FISH LIST ########################
################################################################################

#import the information on the MEOW provinces
MEOW_provinces <- read.csv("Spalding_provinces.txt", sep = '\t', header = TRUE)

#read the cleaner reef fish fauna checklist 
#(Quimbayo et al., 2021)

cleaner_reef_fish <- read.csv("Cleaner_reef_fish_checklist.txt", sep = '\t', header = TRUE)
cleaner_reef_fish <- merge(MEOW_provinces, cleaner_reef_fish, by=c('PROVINCE'='PROVINCE'), all.y=TRUE)
cleaner_reef_fish <- select(cleaner_reef_fish, -RLM_CODE, -PROV_CODE, -Lat_Zone)

cleaner_reef_fish_only_species <- select(cleaner_reef_fish, Species)
cleaner_reef_fish_only_species <- unique(cleaner_reef_fish_only_species)
cleaner_reef_fish_only_species_list <- list()
for (i in cleaner_reef_fish_only_species) {
  cleaner_reef_fish_only_species_list <- append(cleaner_reef_fish_only_species_list, i)
}
cleaner_reef_fish_only_species_list <- as.character(cleaner_reef_fish_only_species_list)

#RETRIEVE APHIA IDs
cleaner_reef_fish_only_species_Aphia <- match_taxa(cleaner_reef_fish_only_species_list, ask=TRUE)
cleaner_reef_fish_only_species_Aphia <- cleaner_reef_fish_only_species_Aphia %>% drop_na()
A <- select(cleaner_reef_fish_only_species_Aphia, scientificName)
A <- unique(A)
B <- select(cleaner_reef_fish_only_species, Species)
B <- unique(B)
colnames(B)[colnames(B) == "Species"] ="scientificName"
Species_with_no_aphia <- anti_join(B, A)

Species_with_no_aphia <- Species_with_no_aphia %>% mutate(aphiaID = "")
Species_with_no_aphia <- Species_with_no_aphia %>% mutate(aphiaID =
                                                            case_when(scientificName == "Amblyeleotris exilis" ~ "209271", 
                                                                      scientificName == "Hypseleotris everetti" ~ "1019323", 
                                                                      scientificName == "Bostrychus albooculata" ~ "1026367"))


cleaner_reef_fish_only_species_Aphia <- cleaner_reef_fish_only_species_Aphia %>% 
  bind_cols(split_into_multiple(.$scientificNameID, ":", "scientificNameID")) %>% 
  # selecting those that start with 'type_' will remove the original 'type' column
  select(scientificName, match_type, starts_with("scientificNameID_"))

colnames(cleaner_reef_fish_only_species_Aphia)[colnames(cleaner_reef_fish_only_species_Aphia) == "scientificNameID_5"] ="aphiaID"
cleaner_reef_fish_only_species_Aphia <- select(cleaner_reef_fish_only_species_Aphia, scientificName, aphiaID)
cleaner_reef_fish_only_species_Aphia <- rbind(cleaner_reef_fish_only_species_Aphia, Species_with_no_aphia)

#merge the AphiaID to the intial data frame
cleaner_reef_fish_to_merge <- inner_join(cleaner_reef_fish, cleaner_reef_fish_only_species_Aphia, 
                                      by=c('Species'='scientificName'))

#Save the workspace
save.image(file = "checklists_fish.RData")


################################################################################
################################################################################
################################################################################
