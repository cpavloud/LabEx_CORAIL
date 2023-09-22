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
Fish_Barcoding$species_name[Fish_Barcoding$genus_name == 'Ferdauia'] <- 'Carangoides'
length(unique(Fish_Barcoding$species_name))

################################################################################
################ CREATION OF THE CLEANER REEF FISH LIST ########################
################################################################################

#read the cleaner reef fish fauna checklist 
#(Quimbayo et al., 2021)

cleaner_reef_fish <- read.csv("Cleaner_reef_fish_checklist.txt", sep = '\t', header = TRUE)
cleaner_reef_fish_only_species <- select(cleaner_reef_fish, Species)
cleaner_reef_fish_only_species <- unique(cleaner_reef_fish_only_species)

#Save the workspace
save.image(file = "checklists_fish.RData")


################################################################################
################################################################################
################################################################################
