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
###################### IMPORT WORMS PARASITE LISTS #############################
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

################################################################################
############## DELETE THE HOSTS THAT ARE NOT OF INTEREST #######################
################################################################################

load(file = "fish_checklist_all.RData")

all_fish_valid_aphia <- select(all_fish_with_classification, valid_AphiaID)
all_fish_valid_aphia <- unique(all_fish_valid_aphia)
colnames(all_fish_valid_aphia)[colnames(all_fish_valid_aphia) == "valid_AphiaID"] ="AphiaID"

all_fish_aphia_valid_aphia <- rbind(all_fish_aphia, all_fish_valid_aphia)
all_fish_aphia_valid_aphia <- unique(all_fish_aphia_valid_aphia)
all_fish_aphia_valid_aphia$AphiaID <- as.integer(all_fish_aphia_valid_aphia$AphiaID)
host_prey_attributes$AphiaID_Host <- as.integer(host_prey_attributes$AphiaID_Host)

host_prey_attributes <- semi_join(host_prey_attributes, all_fish_aphia_valid_aphia, 
                  by = c("AphiaID_Host"="AphiaID"))

write.table(host_prey_attributes, "worms_info_parasites_hosts.txt", 
            row.names = FALSE, col.names = TRUE, sep = "\t")

################################################################################
############################## CHECK DISTRIBUTION ##############################
################################################################################

host_prey_attributes_aphia <- select(host_prey_attributes, AphiaID)
host_prey_attributes_aphia <- unique(host_prey_attributes_aphia)

##Get distribution data by AphiaID
host_prey_attributes_aphia_list <- list()
for (i in host_prey_attributes_aphia) {
  host_prey_attributes_aphia_list <- append(host_prey_attributes_aphia_list, i)
}
host_prey_attributes_aphia_list <- as.integer(host_prey_attributes_aphia_list)
host_prey_attributes_aphia_dist <- wm_distribution_(id = host_prey_attributes_aphia_list)

species_with_distribution <- select(host_prey_attributes_aphia_dist, id)
species_with_distribution <- unique(species_with_distribution)
species_with_distribution$id <- as.integer(species_with_distribution$id)
species_with_no_distribution <- anti_join(host_prey_attributes_aphia, species_with_distribution, 
                                          by=c('AphiaID'='id'))

write.table(species_with_no_distribution, "species_with_no_distribution.txt", 
            row.names = FALSE, col.names = TRUE, sep = "\t")

################################################################################
############################# FILTER DISTRIBUTION ##############################
################################################################################

host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist %>% 
  dplyr::filter(!higherGeography %in% c("South Africa", "Bay of Bengal", "Egypt", "Mexico",  "Estonia", 
                                        "Mediterranean Sea - Eastern Basin", "Gulf of Mexico", "Azerbaijan", 
                                        "Mediterranean Sea - Western Basin", "Mediterranean Sea", "Kazakhstan", 
                                        "English Channel", "Bay of Biscay", "Tyrrhenian Sea", "Poland", "Spain",
                                        "Ukraine", "Romania", "Netherlands", "Austria", "Hungary", "Israel", 
                                        "Germany", "Gulf of California"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!higherGeography %in% c("Caribbean Sea" , "North Atlantic Ocean" , "Brazil" ,  "Colombia" , 
                                        "Venezuela" , "Black Sea", "Adriatic Sea" , "Bristol Channel" , "Italy", 
                                        "Red Sea" , "South Atlantic Ocean", "Sea of Marmara", "North Sea" , "Aegean Sea"  , 
                                        "Gulf of Aden" , "Tunisia",  "Peru", "Chile",  "North Pacific Ocean", 
                                        "Portugal"  , "Canada" , "Inner Seas off the West Coast of Scotland" , "Mozambique Channel", 
                                        "United Kingdom" , "Kattegat" ,  "Labrador Sea", "Denmark"   , "Baltic Sea"  ,  "Norwegian Sea", 
                                        "Barentsz Sea" , "Skagerrak"  ,  "Ionian Sea"  , "Yemen"  , "Cuba"  , "Balearic Sea"  , 
                                        "Switzerland", "Arctic Ocean"  ,  "Gulf of Oman"   , "Levantine Sea" , "Strait of Gibraltar" , 
                                        "Angola", "South Korea" , "Gulf of Suez" ))  
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!higherGeography %in% c("Turkiye" , "Gulf of Finland"  , "Panama" , "Democratic Republic of the Congo", 
                                        "Qatar", "Iran" , "Persian Gulf" ,  "Arabian Sea", "Jamaica"  , "Ligurian Sea" , 
                                        "Pakistan", "Algeria" , "Mozambique", "Uruguay", "India", "Ireland"  , 
                                        "Great Australian Bight", "Bangladesh" ,  "Oman" , "Ecuador" , "Tanzania" , 
                                        "Bahamas", "Haiti", "Ross Sea", "Gulf of Aqaba" ,  "Sri Lanka"  , "Wadden Sea" , 
                                        "Gulf of Riga"  , "Norway" , "Maldives", "Bass Strait"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!higherGeography %in% c("Argentina", "Celtic Sea" , "Namibia" , "Sweden", "Bay of Fundy" , "New Zealand", 
                                        "Irminger Sea" , "Baffin Bay", "Pechora Sea", "Greenland Sea", "Gulf of Bothnia", 
                                        "Seto Inland Sea", "Davis Strait", "Inland Sea", "Iceland" , 
                                        "Japan Sea/East Sea", "Sea of Okhotsk", "White Sea", "Bering Sea" , "Gulf of Saint Lawrence" , 
                                        "Irish Sea and St. George's Channel"  , "Belgium"  , "Sea of Azov", "Eritrea", 
                                        "Amundsen Sea", "Kara Sea", "Baelt Sea"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Corsica", "Chilean part of the South Pacific Ocean" ,  "Peruvian part of the South Pacific Ocean", 
                                 "Black Sea"  , "Cold Temperate Northwest Atlantic", "North Sea", "Sea of Okhotsk" , 
                                 "Banyuls-sur-Mer" ,  "Pyrenees-Orientales", "Caspian Sea", "Soviet Union" , "Austria", 
                                 "Hungary", "Germany" , "Central European Russia" ,  "Siberia" , "Russia",
                                 "Egypt", "Palestine" ,   "Romania" , "Morocco"  , "Baja California"   , "Southern California Bight" , "Mediterranean Sea", 
                                 "Gulf of Marseille", "French part of Western Mediterranean Sea" , "Tunisian Plateau/Gulf of Sidra", "Aegean Sea"  , "Western Arabian Sea" , 
                                 "Gulf of Mannar" , "Mexican Tropical Pacific", "Pakistan" ,  "Delaware",  "Sea of Japan/East Sea"  ,  "Celtic Seas"  , "Northern California" , "Patagonian Shelf" , "Oregon, Washington, Vancouver Coast and Shelf" , "Central Chile", 
                                 "Atlantic Ocean", "Oregon", "Jamaican part of the Caribbean Sea" ,  "New Zealand part of the South Pacific Ocean" , 
                                 "Galapagos part of the North Pacific Ocean", "Venezuelan part of the Caribbean Sea", "Colombian part of the North Pacific Ocean", 
                                 "Azores part of the North Atlantic Ocean", "Seychellois part of the Indian Ocean", "Maldives", 
                                 "Korea" , "Qatari part of the Persian Gulf", "Pakistani Exclusive Economic Zone", "Panama Bay", 
                                 "Kuwait Bay", "Iberian Peninsula" , "Kara Sea", "Mozambican part of the Indian Ocean", "Western and Northern Madagascar", 
                                 "Israeli part of the Mediterranean Sea - Eastern Basin", "South India and Sri Lanka", 
                                 "Northern Gulf of Mexico", "Galapagos" , "Southeastern Brazil", "Puerto Rican Exclusive Economic Zone" , 
                                 "Western Mediterranean", "Central New Zealand" , "Bermuda", "South European Atlantic Shelf" , "Antarctic Ocean" , 
                                 "Subantarctic Waters", "East Greenland Shelf", "South West Atlantic" ,  "Channels and Fjords of Southern Chile" ,  "North East Pacific" , 
                                 "Baffin Bay - Davis Strait", "Subantarctic Islands", "Norwegian part of the Norwegian Sea"   , 
                                 "Cuban Exclusive Economic Zone"  , "North Indian Ocean" , "New York" , "Massachusetts Continental Shelf" , 
                                 "Gulf of Oman",  "Pakistani part of the Arabian Sea", "Gulf of Gabes", "Curacaoan part of the Caribbean Sea" , 
                                 "Curacaoan Exclusive Economic Zone",  "Puerto Rican part of the Caribbean Sea",  "Puerto Rican part of the North Atlantic Ocean", 
                                 "Kuwaiti part of the Persian Gulf" ,  "Panamanian part of the Caribbean Sea" , "Gulf of Panama", 
                                 "Benguela" , "Massachusetts" ,  "Biscayne Bay" , "Arabian Sea" , "Gulf of Suez", "Ionian Sea"   , 
                                 "Spanish part of the Balearic Sea" , "Gulf of Aden" , "Saudi Arabian part of the Red Sea"))   
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("New Brunswick" , "Palaearctic", "Northern European Russia", "Dardanelles" ,  "Tyrrhenian Sea"     ,"Norway"   , "Czech Republic"  ,"Northwest European Russia"  ,  "Czechoslovakia"  ,"North America"  ,  "Kamchatka",
                                 "Turkey" , "West Siberia" ,  "Russian Far East" , "French part of the Mediterranean Sea - Western Basin", 
                                 "Egyptian Exclusive Economic Zone" , "Baltic Sea" , "Antarctica" ,  "Ireland" , "Sahara Coast" ,  "North American Pacific Fijordland", 
                                 "West Greenland Shelf", "Greenlandic Exclusive Economic Zone" , "Kamchatka Shelf and Coast", "Faroes",  "Gulf of St. Lawrence - Eastern Scotian Shelf", 
                                 "South and West Iceland"   , "Southern Norway" , "Alboran Sea", "Virginian"  ,  "North and East Iceland" ,  "South New Zealand"   ,  "Northern Norway and Finnmark"  , 
                                 "Arctic" ,  "Northern European Seas" , "Uruguay-Buenos Aires Shelf"  ,  "Gulf of Maine/Bay of Fundy"   , "Shetland Islands" , "South Shetland Islands"   , 
                                 "Saharan Upwelling" , "Adriatic Sea", "Western India","New Zealand Exclusive Economic Zone",  "Nigerian part of the Gulf of Guinea", "Sri Lankan Exclusive Economic Zone" , 
                                 "Swedish Exclusive Economic Zone" ,    "Rio Grande" , "Bosporus" ,  "North West Atlantic" ,  "Atlantic Coast of United States of America", "Brazilian Exclusive Economic Zone" ,  "Cape Verde" , 
                                 "Belizean part of the Caribbean Sea"   , "Indian part of the Arabian Sea"  ,  "Ghanaian Exclusive Economic Zone"  , "Jamaican Exclusive Economic Zone"  , 
                                 "Spanish Exclusive Economic Zone [Mediterranean part]"  , "Angolan" , "Ecuadorean Exclusive Economic Zone"  ,  "Texas-Louisiana Shelf"   , 
                                 "Eastern Canada" , "Mexican part of the North Pacific Ocean", "North and East Barents Sea" ,   "Gulf of Maine" ,  "Malvinas/Falklands", "Ross Sea" , "Faroe Plateau" , "White Sea"   ,   "Beaufort Sea - continental coast and shelf", 
                                 "California", "Bay of Bengal"  , "Walvis Bay"  , "Suez canal" ,  "Mozambican Exclusive Economic Zone",  "Mozambican Coast"   , "Indian part of the Bay of Bengal"   , 
                                 "Cuban part of the Gulf of Mexico"  , "Southwestern Caribbean", "Tasmania", "Panama Bight"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Bahamian", "Galapagos Exclusive Economic Zone" , "Namib"  ,  "Warm Temperate Northeast Pacific" ,
                                 "Eastern Brazil" , "Chesapeake Bay" , "Northeastern Brazil", "South African part of the Indian Ocean" , "Madagascan part of the Indian Ocean" , "Mid-Atlantic Bight" ,  "Red Sea"  ,                             
                                 "Kenyan part of the Indian Ocean",  "Warm Temperate Northwest Atlantic",  "Tropical Atlantic", 
                                 "Punta Arenas" , "East Antarctic Wilkes Land", "Antarctic Peninsula" , "Lusitanian" , "Mid-Atlantic Ridge", "Buenos Aires" , "Red Sea and Gulf of Aden"  , 
                                 "Gulf of Mexico" , "Baja California Sur", "Southern Gulf of Mexico", "Arabian (Persian) Gulf" , 
                                 "Eastern Caribbean", "Japanese part of the North Pacific Ocean", "South Georgia"   , "Alaskan Exclusive Economic Zone"  , 
                                 "Brazil"  ,  "Azov sea", "Cleveland Bay", "Cameroonian part of the Gulf of Guinea", "Northeast Atlantic Ocean (40W)"  , 
                                 "European waters (ERMS scope)",  "Bangladeshi part of the Bay of Bengal" , "Northeastern New Zealand"  , 
                                 "West African Transition", "India"   , "Senegalese part of the North Atlantic Ocean" ))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Thau Lagoon", "Cortezian", "Bassian", "Floridian", "Carolinian", "Humboldtian", 
                                 "Cape Hatteras", "Pamlico Sound (Sound)", "Scotian Shelf", "Hachijo-jima", "Murmansk Coast", 
                                 "Murman Coast", "United States Exclusive Economic Zone", "Northeastern Honshu", "Friday Harbor", 
                                 "Heard and Macdonald Islands"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Wimereux", "Tosa Bay", "Guerrero", "Amur", "Sinaloa", "France", "Campbell Island" , 
                                 "Comoran part of the Indian Ocean", "Revillagigedos", "Columbia River", "Leeuwin", 
                                 "Magdalena Transition"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locationID %in% c("http://marineregions.org/mrgid/21831", "http://marineregions.org/mrgid/21864", 
                                   "http://marineregions.org/mrgid/25376", "http://marineregions.org/mrgid/47746", 
                                   "http://marineregions.org/mrgid/22872"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!higherGeography %in% c("South Africa", "Bay of Bengal", "Egypt", "Mexico",  "Estonia", 
                                        "Mediterranean Sea - Eastern Basin", "Gulf of Mexico", "Azerbaijan", 
                                        "Mediterranean Sea - Western Basin", "Mediterranean Sea", "Kazakhstan", 
                                        "English Channel", "Bay of Biscay", "Tyrrhenian Sea", "Poland", "Spain",
                                        "Ukraine", "Romania", "Netherlands", "Austria", "Hungary", "Israel", 
                                        "Germany", "Gulf of California", "Caribbean Sea" , "North Atlantic Ocean" , "Brazil" ,  "Colombia" , 
                                        "Venezuela" , "Black Sea", "Adriatic Sea" , "Bristol Channel" , "Italy", 
                                        "Red Sea" , "South Atlantic Ocean", "Sea of Marmara", "North Sea" , "Aegean Sea"  , 
                                        "Gulf of Aden" , "Tunisia",  "Peru", "Chile",  "North Pacific Ocean", 
                                        "Portugal"  , "Canada" , "Inner Seas off the West Coast of Scotland" , "Mozambique Channel", 
                                        "United Kingdom" , "Kattegat" ,  "Labrador Sea", "Denmark"   , "Baltic Sea"  ,  "Norwegian Sea", 
                                        "Barentsz Sea" , "Skagerrak"  ,  "Ionian Sea"  , "Yemen"  , "Cuba"  , "Balearic Sea"  , 
                                        "Switzerland", "Arctic Ocean"  ,  "Gulf of Oman"   , "Levantine Sea" , "Strait of Gibraltar" , 
                                        "Angola", "South Korea" , "Gulf of Suez" , "Turkiye" , "Gulf of Finland"  , "Panama" , "Democratic Republic of the Congo", 
                                        "Qatar", "Iran" , "Persian Gulf" ,  "Arabian Sea", "Jamaica"  , "Ligurian Sea" , 
                                        "Pakistan", "Algeria" , "Mozambique", "Uruguay", "India", "Ireland"  , 
                                        "Great Australian Bight", "Bangladesh" ,  "Oman" , "Ecuador" , "Tanzania" , 
                                        "Bahamas", "Haiti", "Ross Sea", "Gulf of Aqaba" ,  "Sri Lanka"  , "Wadden Sea" , 
                                        "Gulf of Riga"  , "Norway" , "Maldives", "Bass Strait", "Argentina", "Celtic Sea" , "Namibia" , "Sweden", "Bay of Fundy" , "New Zealand", 
                                        "Irminger Sea" , "Baffin Bay", "Pechora Sea", "Greenland Sea", "Gulf of Bothnia", 
                                        "Seto Inland Sea", "Davis Strait", "Inland Sea", "Iceland" , 
                                        "Japan Sea/East Sea", "Sea of Okhotsk", "White Sea", "Bering Sea" , "Gulf of Saint Lawrence" , 
                                        "Irish Sea and St. George's Channel"  , "Belgium"  , "Sea of Azov", "Eritrea", 
                                        "Amundsen Sea", "Kara Sea", "Baelt Sea"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!higherGeography %in% c("Benin",  "Seychelles", "Federal Republic of Somalia", "Republic of Mauritius" , "Djibouti" , 
                                        "Greece" , "Turkiye" , "Kenya"  , "Madagascar" , "Comores" , "Alboran Sea"  , "The Coastal Waters of Southeast Alaska and British Columbia" ))                                                
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Mauritian Exclusive Economic Zone", "Reunion Exclusive Economic Zone", 
                                 "North East Pacific", "Western Indian Ocean", "Chagos"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Turkey", "Wimereux", "Cargados Carajos", "FAO fishing area 37", 
                                 "FAO fishing area 87"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locationID %in% c("http://marineregions.org/mrgid/8338"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Japanese Exclusive Economic Zone", "Japanese part of the Inland Sea", "Karachi Coast", "Pacific Coast of Mexico", 
                                 "United States part of the Gulf of Mexico", "Ivory Coast", "Atlantic Coast of South America", "Atlantic Coast of Florida",
                                 "Iranian part of the Persian Gulf", "Rio de la Plata", "Indian Ocean", "Somali part of the Indian Ocean", "Gulf of Eilat",
                                 "Japanese part of the Eastern China Sea",  "East China Sea", "Hong Kong", "Curacaoan Exclusive Economic Zone", "Nicaragua", 
                                 "West Europe", "Michigan", "South East Atlantic", "Europe", "Argentina", "Bulgaria", "Mediterranean Sea Area", "Crete Sea", "Poland", 
                                 "Malawi", "Guinea", "Sierra Leone", "Tanganyika, Lake", "Uganda", "Congo", "Jordan", "Puerto Rico", "South African Coast", 
                                 "British Columbia", "Russian Exclusive economic Zone", "Moldova", "Uzbekistan", "Georgia (Country)", "Tadzhikistan", 
                                 "Minnesota", "Mississippi", "New Jersey", "Oaxaca", "Ohio", "Veracruz", "South Korea", "Bengal", "New Zealand South", 
                                 "South European Russia", "Canada (Arctic)", "Chiapas", "Wyoming", "Montana", "Lithuania", "Crimea", "Pacific Coast of Canada",
                                 "Iceland", "Ontario", "Tennessee", "Faroe Islands", "Idaho", "Connecticut", "Sweden", "Korean Peninsula", "Great Britain", 
                                 "Baltic States", "Turkmenistan", "Arkansas", "Catalan Sea", "Italian part of the Adriatic Sea", "Argentina Northeast", 
                                 "South Atlantic", "Netherlands", "Rio Grande do Sul", "French Exclusive Economic Zone [Atlantic part]", "Kirgizistan", 
                                 "Burkina Faso", "Cameroon", "Benin", "Senegal", "Zimbabwe", "Ghana", "Israel", "Plymouth Sound", "Cypriote Exclusive Economic Zone", 
                                 "Temperate Northern Atlantic", "South African part of the South Atlantic Ocean", "United States part of the North Atlantic Ocean", "United States part of the North Pacific Ocean", 
                                 "Monterey Bay", "Volga", "Slovakia", "Middle Europe", "Sardinia", "Spanish part of the Mediterranean Sea - Western Basin", "Yangtze Estuary", 
                                 "United Kingdom part of the North Sea", "Southwest Australian Shelf", "Costa Rica", "Indian Ocean, Antarctic and Southern Ocean", "Mexican part of the Caribbean Sea", 
                                 "Brazilian Exclusive Economic Zone (Trindade)", "Senegalese Exclusive Economic Zone", "Canary Islands Exclusive Economic Zone", 
                                 "Sea of Japan", "Pacific Coast of Costa Rica", "Yucatan"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Virginia", "North Dakota", "Canadian Atlantic Coast", "Sumatra", "Belgian part of the North Sea", 
                                 "Los Angeles Bay", "Galicia", "Canadian part of the North Atlantic Ocean", "Uruguay", "North East Atlantic", 
                                 "Algerian part of the Mediterranean Sea - Western Basin", "Belarus", "Parana", "Niger", "Caribbean Sea", 
                                 "Pennsylvania", "Amazonas", "Azerbaijan", "Rio de Janeiro", "Ivory Coast Exclusive Economic Zone", 
                                 "Azores Canaries Madeira", "Gulf of St. Vincent", "Goa", "Croatia", "Iberian Atlantic", 
                                 "Atlantic coast of Europe", "Maine", "Bay of Biscay", "English Channel", "Louisiana", "Kentucky", "Oklahoma", 
                                 "Washington (State)", "New York Bight", "South East Australia", "Quebec", "Baikal Lake", "Yugoslavia", "South Korean Exclusive Economic Zone", 
                                 "Georgian part of the Black Sea", "Latvia", "Kaliningrad", "Denmark", "Cuba", "Florida"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Seychelles", "Curacaoan part of the Caribbean Sea", "Gulf of Guinea", "Curacaoan Exclusive Economic Zone",
                                 "Japan", "Iraqi part of the Persian Gulf", "Southeast Australian Shelf", "Inland Sea off Seto", "Naha Bay"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!higherGeography %in% c("Eastern China Sea", "Japan", "United States", "Indian Ocean","Southern Ocean", "Antilles Sea", "France", 
                                 "Tasman Sea", "Yellow Sea", "Guyana", "Sudan", "Andaman Sea", "Myanmar", "Mali", "Finland", "Laptev Sea"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Eurasia", "Cosmopolitan (World Oceans)", "North Patagonian Gulfs", 
                                 "Northern and Central Red Sea", "Cape Howe", "Chatham Island, New Zealand", 
                                 "St. Helena and Ascension Islands", "Crozet Islands", "Ukraine",
                                 "Kerguelen Islands", "Macquarie Island", "Prince Edward Islands", "South Australian Gulfs", 
                                 "Central Kuroshio Current", "Araucanian", "Sahelian Upwelling", "Shark Bay"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Houtman", "Transbaikalia", "Celtic Sea", "Kaikoura District", "Skagerrak", 
                                 "Baltic sea", "Brazilian part of the South Atlantic Ocean", 
                                 "Buryatia", "Karelia", "Andaman Sea", "Great Lakes", "Lake Huron", 
                                 "Yellow Sea", "Japanese Sea", "Bering Sea"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("French Exclusive Economic Zone", "Irish Exclusive economic Zone", 
                                 "Chatham Rise", "Andaman and Nicobar Islands Exclusive Economic Zone", 
                                 "Madagascan Exclusive Economic Zone", "Maldives Exclusive Economic Zone", 
                                 "Omani Exclusive Economic Zone", "Reunion", "Alabama", "Rio De Janeiro", 
                                 "Kerala", "Tasman Sea", "New Zealand", "Bangladesh", "Kazakhstan", 
                                 "Mongolia", "Switzerland", "East European Russia", "South Carolina", 
                                 "South Australia", "Texas", "East Atlantic", "Pacific Ocean", "Great Australian Bight", 
                                 "Chiloense", "Graham Land", "Admiralty Bay", "Indo-Pacific", "Cronulla", 
                                 "Port Phillip Bay", "Victoria", "Victoria (Australian state)", "Circumtropical", 
                                 "Palmyra Atoll Exclusive Economic Zone", "Northumberland Coast", "Oran Bight", 
                                 "Tsushima Basin", "Yucatan"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Puget Sound", "Adelie Land [RAMS]", "Adventure Bay", "Africa", "Andhra Pradesh",
                                 "Agulhas Bank", "Bay of Islands", "Bihar", "Biwa lake", "Bohai Bay", "Aral Sea", 
                                 "Brittany", "Andaman", "Andaman and Nicobar Islands", "Andaman Islands", 
                                 "Ariake Sea", "Assam", "Australia", "Australian part of the Bass Strait", 
                                 "Bass Strait", "Campeche","Central Indo-Pacific", "Chattisgarh", "Chihuahua", 
                                 "Chile Central", "Deep Bay", "Durango", "East Central Australian Shelf", 
                                 "Chubut", "Chukotka", "Clarion Island", "Commander Islands", "Cook Strait",
                                 "Cockburn Sound", "Curacaoan Exclusive Economic Zone", "Curacaoan part of the Caribbean Sea", 
                                 "Dagestan", "East European Russia", "Egyptian part of the Gulf of Suez", 
                                 "FAO fishing area 67", "Finland", "Florida Bay", "Gulf of Gabes", "Healesville Sanctuary", 
                                 "Heard Island"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locality %in% c("Gotland", "Grand Bank", "Green Island", "Guanajuato", "Guizhou", "Kerala", "Liaoning", "Madhya Pradesh", "Nuevo Leon",
                                 "High seas of the South Pacific Ocean", "Natal", "New South Wales", "Jilin", "Kobe", "Long Island Sound (bay)", "Shandong",
                                 "New Zealand North", "North China", "North European Russia", "Northern New Zealand", "Kuril Is.", "Maria Island",
                                 "Northwest Territories", "Omani part of the Gulf of Oman", "Hokkaido", "Holarctic", "Magellanic", "Miwi Island", "Rottnest Island",
                                 "Honshu", "Hubei", "Hunan", "Nei Mongol", "Neuquen", "Oyashio Current", "Patagonia", "Magadan", "Morelos", "Seto Inland Sea",
                                 "Pacific Coast of Panama", "Pacific Coast of the United States","Parana", "Kyushu", "Lake Erie", "Manipur", "Shag Rocks",
                                 "Phillip Island", "Persian Gulf", "Peter the Great Bay", "Point Peron", "Wisconsin", "Laccadive Sea", "Milford Haven", "Shikoku",
                                 "Xinjiang", "Yakutskiya", "Yunnan", "Western Indo-Pacific", "West Bengal", "Kagoshima Prefecture", "Mexican part of the Gulf of Mexico",
                                 "Virgin Gorda", "Warm Temperate Northwest Pacific", "Weddell Sea", "Tunisian part of the Mediterranean Sea - Eastern Basin", 
                                 "Toyama Bay", "Tweed-Moreton", "Ural Mountains", "Uttar Pradesh", "Tropical Southwestern Atlantic", "Meghalaya",
                                 "Tianjin", "Temperate Australasia", "Temperate Northern Pacific", "Sodwana Bay","Jiangxi", "Maharashtra", "Shark Bay, Western Australia",
                                 "Taiwanese part of the Eastern China Sea", "Tamil Nadu", "Tampa Bay", "Sundarbans", "Jiangsu", "Michoacan", "Shelley Beach",
                                 "Sudan", "Tabasco", "Spencer Gulf", "Southern New Zealand", "South West India", "Sakhalin", "Melbourne", "rasdu atoll",
                                 "South Carolina", "South Andaman Islands", "Jalisco", "Jammu-Kashmir", "Saint Joseph Bay", "Quintana Roo", "Rio Negro",
                                 "Scotia Sea", "San Jorge Gulf", "San Luis Potosi", "Santiago del Estero", "Sergipe", "Sagami Bay", "Rockall Trough",
                                "Porcupine Abyssal Plain", "Porcupine Seabight", "Port Natal", "Port Willunga", "Portuguese part of the North Atlantic Ocean",
                                 "Primorie", "Primorsky Krai", "Primorye", "Prince Edward I.", "Puri"))
host_prey_attributes_aphia_dist_filt <- host_prey_attributes_aphia_dist_filt %>% 
  dplyr::filter(!locationID %in% c("http://marineregions.org/mrgid/48685", "http://marineregions.org/mrgid/26517",
                                   "http://marineregions.org/mrgid/26569", "http://marineregions.org/mrgid/3879",
                                   "http://marineregions.org/mrgid/48329", "http://marineregions.org/mrgid/47933",
                                   "http://marineregions.org/mrgid/48313", "http://marineregions.org/mrgid/48025",
                                   "http://marineregions.org/mrgid/8609", "http://marineregions.org/mrgid/48315",
                                   "http://marineregions.org/mrgid/48336", "http://marineregions.org/mrgid/19141"))
                                  
host_prey_attributes_aphia_dist_filt <- select(host_prey_attributes_aphia_dist_filt, -recordStatus, typeStatus, 
                                                -establishmentMeans, -qualityStatus, -typeStatus, -decimalLatitude, -decimalLongitude)

#import a file containing the correspondence of the localities to provinces
mregionsID <- read.csv("mregions.txt", sep = '\t', header = TRUE)

#add province information to the host_prey_attributes_aphia_dist_filt
host_prey_attributes_ecoregion  <- inner_join(host_prey_attributes_aphia_dist_filt, mregionsID, 
                                  by = c("locality"="locality"))

missing_locality <- anti_join(host_prey_attributes_aphia_dist_filt, mregionsID, 
                by = c("locality"="locality"))

missing_locality <- missing_locality %>% mutate(ECOREGION = "New Caledonia")
missing_locality <- missing_locality %>% mutate(PROVINCE = "Tropical Southwestern Pacific")

host_prey_attributes_ecoregion <- rbind(host_prey_attributes_ecoregion, missing_locality)
host_prey_attributes_ecoregion$id <- as.integer(host_prey_attributes_ecoregion$id)
colnames(host_prey_attributes_ecoregion)[colnames(host_prey_attributes_ecoregion) == "id"] ="AphiaID"

host_prey_attributes_province <- select(host_prey_attributes_ecoregion, AphiaID, PROVINCE)
host_prey_attributes_province <- unique(host_prey_attributes_province)
  
#add host AphiaID
host_prey_attributes_ecoregion_aphia <- merge(host_prey_attributes, host_prey_attributes_province, 
                                                   by = c("AphiaID"="AphiaID"), relationship = "many-to-many")
colnames(host_prey_attributes_ecoregion_aphia)[colnames(host_prey_attributes_ecoregion_aphia) == "AphiaID"] ="AphiaID"
colnames(host_prey_attributes_ecoregion_aphia)[colnames(host_prey_attributes_ecoregion_aphia) == "id"] ="AphiaID"

#select only parasites identified to the species level
host_prey_attributes_ecoregion_aphia <- host_prey_attributes_ecoregion_aphia %>% filter(str_detect(scientificName, "[ ]"))

#select only the hosts and retrieve their classification
#we should already have that from 4_worms.R but why not do it again
host_prey_attributes_hosts <- select(host_prey_attributes, AphiaID_Host)
host_prey_attributes_hosts <- unique(host_prey_attributes_hosts)

##Extract the aphiaIDs into a list
host_prey_attributes_hosts_list <- list()
for (i in host_prey_attributes_hosts) {
  host_prey_attributes_hosts_list <- append(host_prey_attributes_hosts_list, i)
}
host_prey_attributes_hosts_list <- as.integer(host_prey_attributes_hosts_list)
host_prey_attributes_hosts_classification <- wormsbyid(host_prey_attributes_hosts_list)

host_prey_attributes_hosts_classification <- select(host_prey_attributes_hosts_classification, AphiaID, 
                                                scientificname, valid_AphiaID, valid_name, 
                                                genus, family, order, class, phylum, kingdom)

#select only the parasites and retrieve their classification
host_prey_attributes_parasites <- select(host_prey_attributes, AphiaID)
host_prey_attributes_parasites <- unique(host_prey_attributes_parasites)

##Extract the aphiaIDs into a list
host_prey_attributes_parasites_list <- list()
for (i in host_prey_attributes_parasites) {
  host_prey_attributes_parasites_list <- append(host_prey_attributes_parasites_list, i)
}
host_prey_attributes_parasites_list <- as.integer(host_prey_attributes_parasites_list)
host_prey_attributes_parasites_classification <- wormsbyid(host_prey_attributes_parasites_list)

host_prey_attributes_parasites_classification <- select(host_prey_attributes_parasites_classification, AphiaID, 
                                                    scientificname, valid_AphiaID, valid_name, 
                                                    genus, family, order, class, phylum, kingdom)


################################################################################
######################## LOAD OTHER PARASITE LISTS #############################
################################################################################

load(file = "Fish_Hosts.RData")
#to import the Parasites

#select only parasites identified to the species level
Parasites <- Parasites %>% filter(str_detect(scientificName_Parasite, "[ ]"))

#retrieve AphiaIDs for Parasites 
Parasites_species <- select(Parasites, scientificName_Parasite)
Parasites_species <- unique(Parasites_species)
Parasites_species_list <- list()
for (i in Parasites_species) {
  Parasites_species_list <- append(Parasites_species_list, i)
}
Parasites_species_list <- as.character(Parasites_species_list)

#RETRIEVE APHIA IDs
Parasites_species_Aphia <- match_taxa(Parasites_species_list, ask=TRUE)
Parasites_species_Aphia <- Parasites_species_Aphia %>% drop_na()
A <- select(Parasites_species_Aphia, scientificName)
A <- unique(A)
B <- select(Parasites_species, scientificName_Parasite)
B <- unique(B)
colnames(B)[colnames(B) == "scientificName_Parasite"] ="scientificName"
Species_with_no_aphia <- anti_join(B, A)

#add manually retrieved data for the 21 species
Species_with_no_aphia <- Species_with_no_aphia %>% mutate(aphiaID = "")
Species_with_no_aphia <- Species_with_no_aphia %>% mutate(aphiaID =
                                                            case_when(scientificName == "Azygia anguillae" ~ "726174", 
                                                                      scientificName == "Coitocaecum kuhliae" ~ "934941", 
                                                                      scientificName == "Spirocaecum lafii" ~ "1532903", 
                                                                      scientificName == "Opegaster lobulus" ~ "728462", 
                                                                      scientificName == "Opecoelus minimus" ~ "728423", 
                                                                      scientificName == "Prosorhynchoides ozakii" ~ "725948", 
                                                                      scientificName == "Antorchis tsushimaensis" ~ "767632", 
                                                                      scientificName == "Centrocestus formosanus" ~ "1376193", 
                                                                      scientificName == "Monodhelmis trichofurcata" ~ "736131", 
                                                                      scientificName == "Opecoelus variabilis" ~ "728442", 
                                                                      scientificName == "Bancroftrema neoceratodi" ~ "1338098", 
                                                                      scientificName == "Isoparorchis hypselobagri" ~ "1324007", 
                                                                      scientificName == "Pretestis australianus" ~ "1324009", 
                                                                      scientificName == "Phyllodistomum magnificum" ~ "1245644", 
                                                                      scientificName == "Stegodexamene callista" ~ "727530", 
                                                                      scientificName == "Tetracerasta blepta" ~ "727531", 
                                                                      scientificName == "Prosorhynchus glyptothoracis" ~ "734129", 
                                                                      scientificName == "Plagioporus serotinus" ~ "728517", 
                                                                      scientificName == "Neoprosorhynchus pseudecheneis" ~ "725975", 
                                                                      scientificName == "Plagioporus myoxocephalis" ~ "1255318", 
                                                                      scientificName == "Rhipidocotyloides tsengi" ~ "579718"))

Parasites_species_Aphia <- Parasites_species_Aphia %>% 
  bind_cols(split_into_multiple(.$scientificNameID, ":", "scientificNameID")) %>% 
  # selecting those that start with 'type_' will remove the original 'type' column
  select(scientificName, match_type, starts_with("scientificNameID_"))

colnames(Parasites_species_Aphia)[colnames(Parasites_species_Aphia) == "scientificNameID_5"] ="aphiaID"
Parasites_species_Aphia <- select(Parasites_species_Aphia, scientificName, aphiaID)
Parasites_species_Aphia <- rbind(Parasites_species_Aphia, Species_with_no_aphia)

#retrieve classification for Parasites 
Parasites_species_only_aphia <- select(Parasites_species_Aphia, aphiaID)
Parasites_species_only_aphia_list <- list()
for (i in Parasites_species_only_aphia) {
  Parasites_species_only_aphia_list <- append(Parasites_species_only_aphia_list, i)
}
Parasites_species_only_aphia_list <- as.integer(Parasites_species_only_aphia_list)
Parasites_species_classification <- wormsbyid(Parasites_species_only_aphia_list)

Parasites_species_classification <- select(Parasites_species_classification, AphiaID, 
                                                    scientificname, valid_AphiaID, valid_name, 
                                                    genus, family, order, class, phylum, kingdom)

#retrieve AphiaIDs for Hosts 
Parasites_hosts <- select(Parasites, scientificName_Host)
Parasites_hosts <- unique(Parasites_hosts)
Parasites_hosts_list <- list()
for (i in Parasites_hosts) {
  Parasites_hosts_list <- append(Parasites_hosts_list, i)
}
Parasites_hosts_list <- as.character(Parasites_hosts_list)

#RETRIEVE APHIA IDs
Parasites_hosts_Aphia <- match_taxa(Parasites_hosts_list, ask=TRUE)
Parasites_hosts_Aphia <- Parasites_hosts_Aphia %>% drop_na()

A <- select(Parasites_hosts_Aphia, scientificName)
A <- unique(A)
B <- select(Parasites_hosts, scientificName_Host)
B <- unique(B)
colnames(B)[colnames(B) == "scientificName_Host"] ="scientificName"
Species_with_no_aphia <- anti_join(B, A)

Parasites_hosts_Aphia <- Parasites_hosts_Aphia %>% 
  bind_cols(split_into_multiple(.$scientificNameID, ":", "scientificNameID")) %>% 
  # selecting those that start with 'type_' will remove the original 'type' column
  select(scientificName, match_type, starts_with("scientificNameID_"))

colnames(Parasites_hosts_Aphia)[colnames(Parasites_hosts_Aphia) == "scientificNameID_5"] ="aphiaID"
Parasites_hosts_Aphia <- select(Parasites_hosts_Aphia, scientificName, aphiaID)

#add manually retrieved data for the 13 species
Species_with_no_aphia <- Species_with_no_aphia %>% mutate(aphiaID = "")
Species_with_no_aphia <- Species_with_no_aphia %>% mutate(aphiaID =
                                                            case_when(scientificName == "Maccullochella macquariensis" ~ "991272", 
                                                                      scientificName == "Tandanus tandanus" ~ "1022552", 
                                                                      scientificName == "Neoceratodus forsteri" ~ "1421405", 
                                                                      scientificName == "Xiphophorus maculatus" ~ "862549", 
                                                                      scientificName == "Neosilurus ater" ~ "991288", 
                                                                      scientificName == "Craterocephalus marjoriae" ~ "1014294", 
                                                                      scientificName == "Melanotaenia duboulayi" ~ "1020149", 
                                                                      scientificName == "Glyptothorax sinensis" ~ "1018215", 	
                                                                      scientificName == "Sphoeroides ocellatus" ~ "298214", 	
                                                                      scientificName == "Leiocassis hainanensis" ~ "1015325", 	
                                                                      scientificName == "Leiocassis brashnikowi" ~ "1623431", 	
                                                                      scientificName == "Pseudecheneis sulcata" ~ "1022207", 	
                                                                      scientificName == "Leiopotherapon plumbeus" ~ "1020693"))
                                                                      
                                                                                                                                            
Parasites_hosts_Aphia <- rbind(Parasites_hosts_Aphia, Species_with_no_aphia)


#retrieve classification for Hosts 
Parasites_hosts_only_aphia <- select(Parasites_hosts_Aphia, aphiaID)
Parasites_hosts_only_aphia_list <- list()
for (i in Parasites_hosts_only_aphia) {
  Parasites_hosts_only_aphia_list <- append(Parasites_hosts_only_aphia_list, i)
}
Parasites_hosts_only_aphia_list <- as.integer(Parasites_hosts_only_aphia_list)
Parasites_hosts_classification <- wormsbyid(Parasites_hosts_only_aphia_list)

Parasites_hosts_classification <- select(Parasites_hosts_classification, AphiaID, 
                                           scientificname, valid_AphiaID, valid_name, 
                                           genus, family, order, class, phylum, kingdom)



#merge Parasites with host_prey_attributes_ecoregion_aphia

colnames(host_prey_attributes_ecoregion_aphia)[colnames(host_prey_attributes_ecoregion_aphia) == "scientificName"] ="scientificName_Parasite"

host_prey_attributes_ecoregion_aphia_reduced <- select(host_prey_attributes_ecoregion_aphia, 
                                                       AphiaID, scientificName_Parasite, AphiaID_Host, PROVINCE)
host_prey_attributes_hosts_classification_only_species_aphia <- select(host_prey_attributes_hosts_classification, AphiaID, 
                                                                       scientificname)
host_prey_attributes_ecoregion_aphia_reduced <- inner_join(host_prey_attributes_ecoregion_aphia_reduced, 
                                                           host_prey_attributes_hosts_classification_only_species_aphia,
                                by = c("AphiaID_Host"="AphiaID"))
colnames(host_prey_attributes_ecoregion_aphia_reduced)[colnames(host_prey_attributes_ecoregion_aphia_reduced) == "scientificname"] ="scientificName_Host"

Parasites_reduced <- select(Parasites, PROVINCE, scientificName_Parasite, scientificName_Host)
Parasites_reduced <- inner_join(Parasites_reduced, Parasites_hosts_Aphia,
                   by = c("scientificName_Host"="scientificName"))
colnames(Parasites_reduced)[colnames(Parasites_reduced) == "aphiaID"] ="AphiaID_Host"
Parasites_reduced <- inner_join(Parasites_reduced, Parasites_species_Aphia,
                                by = c("scientificName_Parasite"="scientificName"))
colnames(Parasites_reduced)[colnames(Parasites_reduced) == "aphiaID"] ="AphiaID"

#merge Parasites_reduced with host_prey_attributes_ecoregion_aphia_reduced
host_prey_attributes_ecoregion_aphia <- rbind(Parasites_reduced, host_prey_attributes_ecoregion_aphia_reduced)
colnames(host_prey_attributes_ecoregion_aphia)[colnames(host_prey_attributes_ecoregion_aphia) == "AphiaID"] ="AphiaID_Parasite"
host_prey_attributes_ecoregion_aphia$AphiaID_Host <- as.integer(host_prey_attributes_ecoregion_aphia$AphiaID_Host)
host_prey_attributes_ecoregion_aphia$AphiaID_Parasite <- as.integer(host_prey_attributes_ecoregion_aphia$AphiaID_Parasite)

#merge Parasites_hosts_classification with host_prey_attributes_hosts_classification
host_prey_attributes_hosts_classification <- rbind(host_prey_attributes_hosts_classification, 
                                                   Parasites_hosts_classification)
colnames(host_prey_attributes_hosts_classification)[colnames(host_prey_attributes_hosts_classification) == "AphiaID"] ="AphiaID_Host"
colnames(host_prey_attributes_hosts_classification)[colnames(host_prey_attributes_hosts_classification) == "scientificname"] ="scientificName_Host"
colnames(host_prey_attributes_hosts_classification)[colnames(host_prey_attributes_hosts_classification) == "valid_AphiaID"] ="valid_AphiaID_Host"
colnames(host_prey_attributes_hosts_classification)[colnames(host_prey_attributes_hosts_classification) == "valid_name"] ="valid_name_Host"
colnames(host_prey_attributes_hosts_classification)[colnames(host_prey_attributes_hosts_classification) == "genus"] ="genus_Host"
colnames(host_prey_attributes_hosts_classification)[colnames(host_prey_attributes_hosts_classification) == "family"] ="family_Host"
colnames(host_prey_attributes_hosts_classification)[colnames(host_prey_attributes_hosts_classification) == "order"] ="order_Host"
colnames(host_prey_attributes_hosts_classification)[colnames(host_prey_attributes_hosts_classification) == "class"] ="class_Host"
colnames(host_prey_attributes_hosts_classification)[colnames(host_prey_attributes_hosts_classification) == "phylum"] ="phylum_Host"
colnames(host_prey_attributes_hosts_classification)[colnames(host_prey_attributes_hosts_classification) == "kingdom"] ="kingdom_Host"

#merge Parasites_species_classification with host_prey_attributes_parasites_classification
host_prey_attributes_parasites_classification <- rbind(host_prey_attributes_parasites_classification, 
                                                       Parasites_species_classification)
colnames(host_prey_attributes_parasites_classification)[colnames(host_prey_attributes_parasites_classification) == "AphiaID"] ="AphiaID_Parasite"
colnames(host_prey_attributes_parasites_classification)[colnames(host_prey_attributes_parasites_classification) == "scientificname"] ="scientificName_Parasite"
colnames(host_prey_attributes_parasites_classification)[colnames(host_prey_attributes_parasites_classification) == "valid_AphiaID"] ="valid_AphiaID_Parasite"
colnames(host_prey_attributes_parasites_classification)[colnames(host_prey_attributes_parasites_classification) == "valid_name"] ="valid_name_Parasite"
colnames(host_prey_attributes_parasites_classification)[colnames(host_prey_attributes_parasites_classification) == "genus"] ="genus_Parasite"
colnames(host_prey_attributes_parasites_classification)[colnames(host_prey_attributes_parasites_classification) == "family"] ="family_Parasite"
colnames(host_prey_attributes_parasites_classification)[colnames(host_prey_attributes_parasites_classification) == "order"] ="order_Parasite"
colnames(host_prey_attributes_parasites_classification)[colnames(host_prey_attributes_parasites_classification) == "class"] ="class_Parasite"
colnames(host_prey_attributes_parasites_classification)[colnames(host_prey_attributes_parasites_classification) == "phylum"] ="phylum_Parasite"
colnames(host_prey_attributes_parasites_classification)[colnames(host_prey_attributes_parasites_classification) == "kingdom"] ="kingdom_Parasite"

#create one big table with everything
#so, in a way, merge host_prey_attributes_ecoregion_aphia 
#with host_prey_attributes_hosts_classification
#with host_prey_attributes_parasites_classification

test <- inner_join(host_prey_attributes_ecoregion_aphia, host_prey_attributes_parasites_classification)

test <- inner_join(test, host_prey_attributes_hosts_classification) 

colSums(is.na(test))
#fill in valid_AphiaID_Parasite column
repeat {
  for (i in 1:nrow(test))
    if (is.na(test$valid_AphiaID_Parasite[i])){
      test$valid_AphiaID_Parasite[i]=test$AphiaID_Parasite[i]
    }
  if (sum(is.na(test$valid_AphiaID_Parasite))==0) {
    break
  }
}
#fill in valid_name_Parasite column
repeat {
  for (i in 1:nrow(test))
    if (is.na(test$valid_name_Parasite[i])){
      test$valid_name_Parasite[i]=test$scientificName_Parasite[i]
    }
  if (sum(is.na(test$valid_name_Parasite))==0) {
    break
  }
}
#fill in family_Parasite column
repeat {
  for (i in 1:nrow(test))
    if (is.na(test$family_Parasite[i])){
      test$family_Parasite[i]=test$genus_Parasite[i]
    }
  if (sum(is.na(test$family_Parasite))==0) {
    break
  }
}

all_parasites_province <- test
write.table(all_parasites_province, "all_parasites_province.txt", 
            row.names = FALSE, col.names = TRUE, sep = "\t")

################################################################################
############################# SUBSET PER GROUP #################################
################################################################################  

Isopoda <- all_parasites_province %>% 
  dplyr::filter(order_Parasite %in% c("Isopoda"))
length(unique(Isopoda$valid_name_Parasite))
Isopoda <- unique(Isopoda)

Nematoda <- all_parasites_province %>% 
  dplyr::filter(phylum_Parasite %in% c("Nematoda"))
length(unique(Nematoda$valid_name_Parasite))
Nematoda <- unique(Nematoda)

Cestoda <- all_parasites_province %>% 
  dplyr::filter(class_Parasite %in% c("Cestoda"))
length(unique(Cestoda$valid_name_Parasite))
Cestoda <- unique(Cestoda)

Monogenea <- all_parasites_province %>% 
  dplyr::filter(class_Parasite %in% c("Monogenea"))
length(unique(Monogenea$valid_name_Parasite))
Monogenea <- unique(Monogenea)

Myxozoa <- all_parasites_province %>% 
  dplyr::filter(class_Parasite %in% c("Myxozoa"))
length(unique(Myxozoa$valid_name_Parasite))
Myxozoa <- unique(Myxozoa)

Acanthocephala <- all_parasites_province %>% 
  dplyr::filter(phylum_Parasite %in% c("Acanthocephala"))
length(unique(Acanthocephala$valid_name_Parasite))
Acanthocephala <- unique(Acanthocephala)

Trematoda <- all_parasites_province %>% 
  dplyr::filter(class_Parasite %in% c("Trematoda"))
length(unique(Trematoda$valid_name_Parasite))
Trematoda <- unique(Trematoda)

Copepoda <- all_parasites_province %>% 
  dplyr::filter(class_Parasite %in% c("Copepoda"))
length(unique(Copepoda$valid_name_Parasite))
Copepoda <- unique(Copepoda)

Others <- anti_join(all_parasites_province, Acanthocephala)
Others <- anti_join(Others, Myxozoa)
Others <- anti_join(Others, Monogenea)
Others <- anti_join(Others, Cestoda)
Others <- anti_join(Others, Nematoda)
Others <- anti_join(Others, Isopoda)
Others <- anti_join(Others, Trematoda)
Others <- anti_join(Others, Copepoda)
length(unique(Others$valid_name_Parasite))
Others <- unique(Others)

################################################################################
##################### SELECT ONLY THOSE WITH REEF HOSTS ########################
################################################################################  

Isopoda_reef <- semi_join(Isopoda, all_fish_reef, 
                          by = c("scientificName_Host"="scientificName"))
Isopoda_reef_species <- select(Isopoda_reef, scientificName_Parasite, PROVINCE)
Isopoda_reef_species <- unique(Isopoda_reef_species)
length(unique(Isopoda_reef_species$scientificName_Parasite))

Acanthocephala_reef <- semi_join(Acanthocephala, all_fish_reef, 
                                 by = c("scientificName_Host"="scientificName"))
Acanthocephala_reef_species <- select(Acanthocephala_reef, scientificName_Parasite, PROVINCE)
Acanthocephala_reef_species <- unique(Acanthocephala_reef_species)
length(unique(Acanthocephala_reef_species$scientificName_Parasite))

Myxozoa_reef <- semi_join(Myxozoa, all_fish_reef, 
                          by = c("scientificName_Host"="scientificName"))
Myxozoa_reef_species <- select(Myxozoa_reef, scientificName_Parasite, PROVINCE)
Myxozoa_reef_species <- unique(Myxozoa_reef_species)
length(unique(Myxozoa_reef_species$scientificName_Parasite))

Monogenea_reef <- semi_join(Monogenea, all_fish_reef, 
                            by = c("scientificName_Host"="scientificName"))
Monogenea_reef_species <- select(Monogenea_reef, scientificName_Parasite, PROVINCE)
Monogenea_reef_species <- unique(Monogenea_reef_species)
length(unique(Monogenea_reef_species$scientificName_Parasite))

Cestoda_reef <- semi_join(Cestoda, all_fish_reef, 
                          by = c("scientificName_Host"="scientificName"))
Cestoda_reef_species <- select(Cestoda_reef, scientificName_Parasite, PROVINCE)
Cestoda_reef_species <- unique(Cestoda_reef_species)
length(unique(Cestoda_reef_species$scientificName_Parasite))

Nematoda_reef <- semi_join(Nematoda, all_fish_reef, 
                           by = c("scientificName_Host"="scientificName"))
Nematoda_reef_species <- select(Nematoda_reef, scientificName_Parasite, PROVINCE)
Nematoda_reef_species <- unique(Nematoda_reef_species)
length(unique(Nematoda_reef_species$scientificName_Parasite))

Trematoda_reef <- semi_join(Trematoda, all_fish_reef, 
                            by = c("scientificName_Host"="scientificName"))
Trematoda_reef_species <- select(Trematoda_reef, scientificName_Parasite, PROVINCE)
Trematoda_reef_species <- unique(Trematoda_reef_species)
length(unique(Trematoda_reef_species$scientificName_Parasite))

Others_reef <- semi_join(Others, all_fish_reef, 
                         by = c("scientificName_Host"="scientificName"))
Others_reef_species <- select(Others_reef, scientificName_Parasite, PROVINCE)
Others_reef_species <- unique(Others_reef_species)
length(unique(Others_reef_species$scientificName_Parasite))

Copepoda_reef <- semi_join(Copepoda, all_fish_reef, 
                           by = c("scientificName_Host"="scientificName"))
Copepoda_reef_species <- select(Copepoda_reef, scientificName_Parasite, PROVINCE)
Copepoda_reef_species <- unique(Copepoda_reef_species)
length(unique(Copepoda_reef_species$scientificName_Parasite))


################################################################################
########################### CALCULATE STATISTICS ###############################
################################################################################  

#calculate statistics
df <- data.frame(matrix(ncol = 9, nrow = 18))
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
col_Acanthocephala <- c(sum(Acanthocephala_reef_species$PROVINCE == "Eastern Coral Triangle"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Java Transitional"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Lord Howe and Norfolk Islands"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Northeast Australian Shelf"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Northwest Australian Shelf"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Sahul Shelf"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "South China Sea"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "South Kuroshio"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Sunda Shelf"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Tropical Northwestern Pacific"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Tropical Southwestern Pacific"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Western Coral Triangle"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Central Polynesia"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Easter Island"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Hawaii"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Marquesas"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Marshall, Gilbert and Ellis Islands"), 
                        sum(Acanthocephala_reef_species$PROVINCE == "Southeast Polynesia"))

col_Myxozoa <- c(sum(Myxozoa_reef_species$PROVINCE == "Eastern Coral Triangle"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Java Transitional"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Lord Howe and Norfolk Islands"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Northeast Australian Shelf"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Northwest Australian Shelf"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Sahul Shelf"), 
                 sum(Myxozoa_reef_species$PROVINCE == "South China Sea"), 
                 sum(Myxozoa_reef_species$PROVINCE == "South Kuroshio"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Sunda Shelf"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Tropical Northwestern Pacific"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Tropical Southwestern Pacific"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Western Coral Triangle"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Central Polynesia"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Easter Island"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Hawaii"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Marquesas"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Marshall, Gilbert and Ellis Islands"), 
                 sum(Myxozoa_reef_species$PROVINCE == "Southeast Polynesia"))


col_Monogenea <- c(sum(Monogenea_reef_species$PROVINCE == "Eastern Coral Triangle"), 
                   sum(Monogenea_reef_species$PROVINCE == "Java Transitional"), 
                   sum(Monogenea_reef_species$PROVINCE == "Lord Howe and Norfolk Islands"), 
                   sum(Monogenea_reef_species$PROVINCE == "Northeast Australian Shelf"), 
                   sum(Monogenea_reef_species$PROVINCE == "Northwest Australian Shelf"), 
                   sum(Monogenea_reef_species$PROVINCE == "Sahul Shelf"), 
                   sum(Monogenea_reef_species$PROVINCE == "South China Sea"), 
                   sum(Monogenea_reef_species$PROVINCE == "South Kuroshio"), 
                   sum(Monogenea_reef_species$PROVINCE == "Sunda Shelf"), 
                   sum(Monogenea_reef_species$PROVINCE == "Tropical Northwestern Pacific"), 
                   sum(Monogenea_reef_species$PROVINCE == "Tropical Southwestern Pacific"), 
                   sum(Monogenea_reef_species$PROVINCE == "Western Coral Triangle"), 
                   sum(Monogenea_reef_species$PROVINCE == "Central Polynesia"), 
                   sum(Monogenea_reef_species$PROVINCE == "Easter Island"), 
                   sum(Monogenea_reef_species$PROVINCE == "Hawaii"), 
                   sum(Monogenea_reef_species$PROVINCE == "Marquesas"), 
                   sum(Monogenea_reef_species$PROVINCE == "Marshall, Gilbert and Ellis Islands"), 
                   sum(Monogenea_reef_species$PROVINCE == "Southeast Polynesia"))

col_Cestoda <- c(sum(Cestoda_reef_species$PROVINCE == "Eastern Coral Triangle"), 
                 sum(Cestoda_reef_species$PROVINCE == "Java Transitional"), 
                 sum(Cestoda_reef_species$PROVINCE == "Lord Howe and Norfolk Islands"), 
                 sum(Cestoda_reef_species$PROVINCE == "Northeast Australian Shelf"), 
                 sum(Cestoda_reef_species$PROVINCE == "Northwest Australian Shelf"), 
                 sum(Cestoda_reef_species$PROVINCE == "Sahul Shelf"), 
                 sum(Cestoda_reef_species$PROVINCE == "South China Sea"), 
                 sum(Cestoda_reef_species$PROVINCE == "South Kuroshio"), 
                 sum(Cestoda_reef_species$PROVINCE == "Sunda Shelf"), 
                 sum(Cestoda_reef_species$PROVINCE == "Tropical Northwestern Pacific"), 
                 sum(Cestoda_reef_species$PROVINCE == "Tropical Southwestern Pacific"), 
                 sum(Cestoda_reef_species$PROVINCE == "Western Coral Triangle"), 
                 sum(Cestoda_reef_species$PROVINCE == "Central Polynesia"), 
                 sum(Cestoda_reef_species$PROVINCE == "Easter Island"), 
                 sum(Cestoda_reef_species$PROVINCE == "Hawaii"), 
                 sum(Cestoda_reef_species$PROVINCE == "Marquesas"), 
                 sum(Cestoda_reef_species$PROVINCE == "Marshall, Gilbert and Ellis Islands"), 
                 sum(Cestoda_reef_species$PROVINCE == "Southeast Polynesia"))



col_Nematoda <- c(sum(Nematoda_reef_species$PROVINCE == "Eastern Coral Triangle"), 
                  sum(Nematoda_reef_species$PROVINCE == "Java Transitional"), 
                  sum(Nematoda_reef_species$PROVINCE == "Lord Howe and Norfolk Islands"), 
                  sum(Nematoda_reef_species$PROVINCE == "Northeast Australian Shelf"), 
                  sum(Nematoda_reef_species$PROVINCE == "Northwest Australian Shelf"), 
                  sum(Nematoda_reef_species$PROVINCE == "Sahul Shelf"), 
                  sum(Nematoda_reef_species$PROVINCE == "South China Sea"), 
                  sum(Nematoda_reef_species$PROVINCE == "South Kuroshio"), 
                  sum(Nematoda_reef_species$PROVINCE == "Sunda Shelf"), 
                  sum(Nematoda_reef_species$PROVINCE == "Tropical Northwestern Pacific"), 
                  sum(Nematoda_reef_species$PROVINCE == "Tropical Southwestern Pacific"), 
                  sum(Nematoda_reef_species$PROVINCE == "Western Coral Triangle"), 
                  sum(Nematoda_reef_species$PROVINCE == "Central Polynesia"), 
                  sum(Nematoda_reef_species$PROVINCE == "Easter Island"), 
                  sum(Nematoda_reef_species$PROVINCE == "Hawaii"), 
                  sum(Nematoda_reef_species$PROVINCE == "Marquesas"), 
                  sum(Nematoda_reef_species$PROVINCE == "Marshall, Gilbert and Ellis Islands"), 
                  sum(Nematoda_reef_species$PROVINCE == "Southeast Polynesia"))

col_Isopoda <- c(sum(Isopoda_reef_species$PROVINCE == "Eastern Coral Triangle"), 
                 sum(Isopoda_reef_species$PROVINCE == "Java Transitional"), 
                 sum(Isopoda_reef_species$PROVINCE == "Lord Howe and Norfolk Islands"), 
                 sum(Isopoda_reef_species$PROVINCE == "Northeast Australian Shelf"), 
                 sum(Isopoda_reef_species$PROVINCE == "Northwest Australian Shelf"), 
                 sum(Isopoda_reef_species$PROVINCE == "Sahul Shelf"), 
                 sum(Isopoda_reef_species$PROVINCE == "South China Sea"), 
                 sum(Isopoda_reef_species$PROVINCE == "South Kuroshio"), 
                 sum(Isopoda_reef_species$PROVINCE == "Sunda Shelf"), 
                 sum(Isopoda_reef_species$PROVINCE == "Tropical Northwestern Pacific"), 
                 sum(Isopoda_reef_species$PROVINCE == "Tropical Southwestern Pacific"), 
                 sum(Isopoda_reef_species$PROVINCE == "Western Coral Triangle"), 
                 sum(Isopoda_reef_species$PROVINCE == "Central Polynesia"), 
                 sum(Isopoda_reef_species$PROVINCE == "Easter Island"), 
                 sum(Isopoda_reef_species$PROVINCE == "Hawaii"), 
                 sum(Isopoda_reef_species$PROVINCE == "Marquesas"), 
                 sum(Isopoda_reef_species$PROVINCE == "Marshall, Gilbert and Ellis Islands"), 
                 sum(Isopoda_reef_species$PROVINCE == "Southeast Polynesia"))


col_Trematoda <- c(sum(Trematoda_reef_species$PROVINCE == "Eastern Coral Triangle"), 
                   sum(Trematoda_reef_species$PROVINCE == "Java Transitional"), 
                   sum(Trematoda_reef_species$PROVINCE == "Lord Howe and Norfolk Islands"), 
                   sum(Trematoda_reef_species$PROVINCE == "Northeast Australian Shelf"), 
                   sum(Trematoda_reef_species$PROVINCE == "Northwest Australian Shelf"), 
                   sum(Trematoda_reef_species$PROVINCE == "Sahul Shelf"), 
                   sum(Trematoda_reef_species$PROVINCE == "South China Sea"), 
                   sum(Trematoda_reef_species$PROVINCE == "South Kuroshio"), 
                   sum(Trematoda_reef_species$PROVINCE == "Sunda Shelf"), 
                   sum(Trematoda_reef_species$PROVINCE == "Tropical Northwestern Pacific"), 
                   sum(Trematoda_reef_species$PROVINCE == "Tropical Southwestern Pacific"), 
                   sum(Trematoda_reef_species$PROVINCE == "Western Coral Triangle"), 
                   sum(Trematoda_reef_species$PROVINCE == "Central Polynesia"), 
                   sum(Trematoda_reef_species$PROVINCE == "Easter Island"), 
                   sum(Trematoda_reef_species$PROVINCE == "Hawaii"), 
                   sum(Trematoda_reef_species$PROVINCE == "Marquesas"), 
                   sum(Trematoda_reef_species$PROVINCE == "Marshall, Gilbert and Ellis Islands"), 
                   sum(Trematoda_reef_species$PROVINCE == "Southeast Polynesia"))


col_Copepoda <- c(sum(Copepoda_reef_species$PROVINCE == "Eastern Coral Triangle"), 
                               sum(Copepoda_reef_species$PROVINCE == "Java Transitional"), 
                               sum(Copepoda_reef_species$PROVINCE == "Lord Howe and Norfolk Islands"), 
                               sum(Copepoda_reef_species$PROVINCE == "Northeast Australian Shelf"), 
                               sum(Copepoda_reef_species$PROVINCE == "Northwest Australian Shelf"), 
                               sum(Copepoda_reef_species$PROVINCE == "Sahul Shelf"), 
                               sum(Copepoda_reef_species$PROVINCE == "South China Sea"), 
                               sum(Copepoda_reef_species$PROVINCE == "South Kuroshio"), 
                               sum(Copepoda_reef_species$PROVINCE == "Sunda Shelf"), 
                               sum(Copepoda_reef_species$PROVINCE == "Tropical Northwestern Pacific"), 
                               sum(Copepoda_reef_species$PROVINCE == "Tropical Southwestern Pacific"), 
                               sum(Copepoda_reef_species$PROVINCE == "Western Coral Triangle"), 
                               sum(Copepoda_reef_species$PROVINCE == "Central Polynesia"), 
                               sum(Copepoda_reef_species$PROVINCE == "Easter Island"), 
                               sum(Copepoda_reef_species$PROVINCE == "Hawaii"), 
                               sum(Copepoda_reef_species$PROVINCE == "Marquesas"), 
                               sum(Copepoda_reef_species$PROVINCE == "Marshall, Gilbert and Ellis Islands"), 
                               sum(Copepoda_reef_species$PROVINCE == "Southeast Polynesia"))

col_Others <- c(sum(Others_reef_species$PROVINCE == "Eastern Coral Triangle"), 
                sum(Others_reef_species$PROVINCE == "Java Transitional"), 
                sum(Others_reef_species$PROVINCE == "Lord Howe and Norfolk Islands"), 
                sum(Others_reef_species$PROVINCE == "Northeast Australian Shelf"), 
                sum(Others_reef_species$PROVINCE == "Northwest Australian Shelf"), 
                sum(Others_reef_species$PROVINCE == "Sahul Shelf"), 
                sum(Others_reef_species$PROVINCE == "South China Sea"), 
                sum(Others_reef_species$PROVINCE == "South Kuroshio"), 
                sum(Others_reef_species$PROVINCE == "Sunda Shelf"), 
                sum(Others_reef_species$PROVINCE == "Tropical Northwestern Pacific"), 
                sum(Others_reef_species$PROVINCE == "Tropical Southwestern Pacific"), 
                sum(Others_reef_species$PROVINCE == "Western Coral Triangle"), 
                sum(Others_reef_species$PROVINCE == "Central Polynesia"), 
                sum(Others_reef_species$PROVINCE == "Easter Island"), 
                sum(Others_reef_species$PROVINCE == "Hawaii"), 
                sum(Others_reef_species$PROVINCE == "Marquesas"), 
                sum(Others_reef_species$PROVINCE == "Marshall, Gilbert and Ellis Islands"), 
                sum(Others_reef_species$PROVINCE == "Southeast Polynesia"))

colnames(df) <- c("Acanthocephala", "Myxozoa", "Monogenea", "Cestoda", 
                  "Nematoda", "Isopoda", "Trematoda", "Copepoda", "Others")

df$Acanthocephala <- col_Acanthocephala
df$Myxozoa <- col_Myxozoa
df$Monogenea <- col_Monogenea
df$Cestoda <- col_Cestoda
df$Nematoda <- col_Nematoda
df$Isopoda <- col_Isopoda
df$Trematoda <- col_Trematoda
df$Copepoda <- col_Copepoda
df$Others <- col_Others


write.table(df, "all_parasites_reef_statistics_province.txt",
            row.names = TRUE, col.names = TRUE, sep =";")

#Save the workspace
save.image(file = "parasite.RData")

################################################################################
########################## CREATE LISTS FOR EUTILS #############################
################################################################################

Copepoda_reef_species_for_NCBI <- select(Copepoda_reef_species, scientificName_Parasite)
Copepoda_reef_species_for_NCBI <- unique(Copepoda_reef_species_for_NCBI)
write.table(Copepoda_reef_species_for_NCBI, "Copepoda_reef_species_for_NCBI.txt",
            row.names = FALSE, col.names = FALSE, sep =";")

Copepoda_reef_genera_for_NCBI <- select(Copepoda_reef, genus_Parasite)
Copepoda_reef_genera_for_NCBI <- unique(Copepoda_reef_genera_for_NCBI)
write.table(Copepoda_reef_genera_for_NCBI, "Copepoda_reef_genera_for_NCBI.txt",
            row.names = FALSE, col.names = FALSE, sep =";")

Copepoda_reef_family_for_NCBI <- select(Copepoda_reef, family_Parasite)
Copepoda_reef_family_for_NCBI <- unique(Copepoda_reef_family_for_NCBI)
write.table(Copepoda_reef_family_for_NCBI, "Copepoda_reef_family_for_NCBI.txt",
            row.names = FALSE, col.names = FALSE, sep =";")

Trematoda_reef_species_for_NCBI <- select(Trematoda_reef_species, scientificName_Parasite)
Trematoda_reef_species_for_NCBI <- unique(Trematoda_reef_species_for_NCBI)
write.table(Trematoda_reef_species_for_NCBI, "Trematoda_reef_species_for_NCBI.txt",
            row.names = FALSE, col.names = FALSE, sep =";")

Trematoda_reef_genera_for_NCBI <- select(Trematoda_reef, genus_Parasite)
Trematoda_reef_genera_for_NCBI <- unique(Trematoda_reef_genera_for_NCBI)
write.table(Trematoda_reef_genera_for_NCBI, "Trematoda_reef_genera_for_NCBI.txt",
            row.names = FALSE, col.names = FALSE, sep =";")

Trematoda_reef_family_for_NCBI <- select(Trematoda_reef, family_Parasite)
Trematoda_reef_family_for_NCBI <- unique(Trematoda_reef_family_for_NCBI)
write.table(Trematoda_reef_family_for_NCBI, "Trematoda_reef_family_for_NCBI.txt",
            row.names = FALSE, col.names = FALSE, sep =";")




################################################################################
################################################################################
################################################################################
  
