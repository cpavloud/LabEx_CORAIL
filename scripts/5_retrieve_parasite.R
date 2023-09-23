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

#host parasite list from worms
worms_info
#worms_info_parasites_hosts.txt

#fish I haven't searched for 
fish_to_search 
#fish_with_no_parasite_TO_SEARCH.txt
  

 
  
