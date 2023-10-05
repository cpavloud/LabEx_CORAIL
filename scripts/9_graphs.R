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
              "dplyr", "data.table", "gdata", "rfishbase", "readxl", "taxize", "ggdendro",
              "Orcs", "usefun", "RSQLite", "DBI", "rredlist", "ggplot2", "hrbrthemes", "vegan")

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
packageVersion("ggplot2")
packageVersion("hrbrthemes")
packageVersion("vegan")
packageVersion("ggdendro") 

remotes::install_github("ropensci/worrms")
library("worrms")
packageVersion("worrms")

################################################################################
############################### LOAD WORKSPACE #################################
################################################################################

load(file = "parasite.RData")

################################################################################
############################# IMPORT FILES #####################################
################################################################################

fish_species_number_Copepoda_species <- read.csv("fish_species_number_Copepoda_species.txt", sep = '\t', header = TRUE)
fish_species_number_Copepoda_species <- unique(fish_species_number_Copepoda_species)

fish_species_number_Trematoda_species <- read.csv("fish_species_number_Trematoda_species.txt", sep = '\t', header = TRUE)
fish_species_number_Trematoda_species <- unique(fish_species_number_Trematoda_species)

################################################################################
######################## SCATTERPLOT WITH BODY SIZE ############################
################################################################################

all_fish_attributes_bodysize_max_Cop <- inner_join(fish_species_number_Copepoda_species, all_fish_attributes_bodysize_max_Cop, 
                                                    by = c("Fish_species" = "scientificname"))
all_fish_attributes_bodysize_max_Trem <- inner_join(fish_species_number_Trematoda_species, all_fish_attributes_bodysize_max_Trem, 
                                                     by = c("Fish_species" = "scientificname"))

all_fish_attributes_bodysize_max_Cop <- all_fish_attributes_bodysize_max_Cop %>% mutate(Parasites = "Copepoda")
colnames(all_fish_attributes_bodysize_max_Cop)[colnames(all_fish_attributes_bodysize_max_Cop) == "Number_of_copepod_species"] ="Number_of_parasite_species"
colnames(all_fish_attributes_bodysize_max_Cop)[colnames(all_fish_attributes_bodysize_max_Cop) == "measurementValue"] ="Fish_Body_Size_cm"
all_fish_attributes_bodysize_max_Cop$Fish_Body_Size_cm <- as.integer((all_fish_attributes_bodysize_max_Cop$Fish_Body_Size_cm))


all_fish_attributes_bodysize_max_Trem <- all_fish_attributes_bodysize_max_Trem %>% mutate(Parasites = "Trematoda")
colnames(all_fish_attributes_bodysize_max_Trem)[colnames(all_fish_attributes_bodysize_max_Trem) == "Number_of_trematod_species"] ="Number_of_parasite_species"
colnames(all_fish_attributes_bodysize_max_Trem)[colnames(all_fish_attributes_bodysize_max_Trem) == "measurementValue"] ="Fish_Body_Size_cm"
all_fish_attributes_bodysize_max_Trem$Fish_Body_Size_cm <- as.integer(all_fish_attributes_bodysize_max_Trem$Fish_Body_Size_cm)

scatter_data <- rbind(all_fish_attributes_bodysize_max_Cop, all_fish_attributes_bodysize_max_Trem)

# A basic scatterplot with color depending on Parasite
ggplot(scatter_data, aes(x=Fish_Body_Size_cm, y=Number_of_parasite_species, color=Parasites, 
                         alpha=Parasites)) + 
  geom_point(size=6) +
  theme_ipsum()

# Transparency
ggplot(scatter_data, aes(x=Fish_Body_Size_cm, y=Number_of_parasite_species, alpha=Parasites)) + 
  geom_point(size=6, color="#69b3a2") +
  theme_ipsum()

ggplot(scatter_data, aes(x=Fish_Body_Size_cm, y=Number_of_parasite_species, alpha=Parasites, size=Parasites, color=Parasites)) + 
  geom_point() +
  theme_ipsum()

p <- ggplot(scatter_data, aes(x=Fish_Body_Size_cm, y=Number_of_parasite_species, color=Parasites)) + 
  geom_point(size=6) + 
  theme_bw() 
#theme(axis.text.x = element_text(angle=90, hjust=1)) 
#scale_x_continuous(breaks=seq(2, 910, 10))
p + labs(x = "Fish Body Size (cm)", y = "Number of parasite species")
ggsave("fish_size_parasite_number.png", dpi=300, width =8, height = 6)

################################################################################
##################################### CLUSTER ##################################
################################################################################

factors <- read.csv("province_realm.txt",  sep = '\t', header = TRUE)

trematod_presence_absence <- read.csv("trematod_dissim.txt", sep = '\t', header = TRUE, row.names = 1)
trematod_presence_absence <-  trematod_presence_absence %>% replace(is.na(.), 0)

copepod_presence_absence <- read.csv("copepod_dissim.txt", sep = '\t', header = TRUE, row.names = 1)
copepod_presence_absence <-  copepod_presence_absence %>% replace(is.na(.), 0)

parasite_presence_absence <- rbind(trematod_presence_absence, copepod_presence_absence)
parasite_presence_absence <- t(parasite_presence_absence)

parasite_dissimilarity <- vegdist(parasite_presence_absence, method = "jaccard")

dendro_parasite <- hclust(parasite_dissimilarity, method="average") 
dendro_parasite_2 <- dendro_parasite %>% as.dendrogram # convert into dendrogram object
dend_data_parasite <- dendro_data(dendro_parasite_2, type = "rectangle") # convert into object that can be used by ggplot
dd_parasite <- dend_data_parasite$labels %>% as.data.frame() %>% left_join(factors, by=c("label"="PROVINCE"))


ggplot(dend_data_parasite$segments) + 
  geom_segment(aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_text(data = dend_data_parasite$labels, aes(x, y, label = label), hjust = "right", angle = 90, size = 3, nudge_y=-0.05) +
  geom_point(data = dd_parasite, aes(x, y, colour = Realm), size=4) + # add dots at the end of the nodes and display them in colour depending on a factor
  theme_classic() +
  theme(axis.line.x =element_blank(),
        axis.text.x =element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank(),
        plot.margin = unit(c(1, 1, 9, 1), "lines")) + 
  ylab("Dissimilarity") +
  #ggtitle("Cluster diagram") + 
  coord_cartesian(clip="off") + 
  scale_y_continuous(labels = scales::percent)
ggsave("parasite_province.png", dpi=300, width =8, height = 6)

#####################################################################################
########################### ACCUMMULATION CURVES ####################################
#####################################################################################

#fish species as rows and parasite species as columns
Trem_accum <- read.csv("Trematoda_accum.txt", sep = '\t', header = TRUE, row.names = 1)
Trem_accum <-  Trem_accum %>% replace(is.na(.), 0)

sp1 <- specaccum(Trem_accum, permutations = 100)
sp2 <- specaccum(Trem_accum, "random", permutations = 100)
sp2
summary(sp2)
plot(sp1, ci.type="poly", col="blue", lwd=2, ci.lty=0, ci.col="lightblue", 
     xlab = "Number of Fish", ylab = "Number of Trematode species")
#boxplot(sp2, col="darkblue", add=TRUE, pch="+")
## Fit Lomolino model to the exact accumulation
#mod1 <- fitspecaccum(sp1, "lomolino")
#coef(mod1)
#fitted(mod1)
#plot(sp1)
## Add Lomolino model using argument 'add'
#plot(mod1, add = TRUE, col=2, lwd=2)
## Fit Arrhenius models to all random accumulations
mods <- fitspecaccum(sp2, "arrh")
plot(mods, col="lightblue", xlab = "Number of Fish", ylab = "Number of Trematode species")
#boxplot(sp2, col = "darkblue", border = "blue", lty=1, cex=0.3, add= TRUE)
## Use nls() methods to the list of models
sapply(mods$models, AIC)


Cop_accum <- read.csv("Copepoda_accum.txt", sep = '\t', header = TRUE, row.names = 1)
Cop_accum <-  Cop_accum %>% replace(is.na(.), 0)

sp3 <- specaccum(Cop_accum, permutations = 100)
sp4 <- specaccum(Cop_accum, "random", permutations = 100)
sp4
summary(sp4)
plot(sp3, ci.type="poly", col="darkred", lwd=2, ci.lty=0, ci.col="red", 
     xlab = "Number of Fish", ylab = "Number of Copepod species")
#boxplot(sp2, col="darkblue", add=TRUE, pch="+")
## Fit Lomolino model to the exact accumulation
#mod1 <- fitspecaccum(sp1, "lomolino")
#coef(mod1)
#fitted(mod1)
#plot(sp1)
## Add Lomolino model using argument 'add'
#plot(mod1, add = TRUE, col=2, lwd=2)
## Fit Arrhenius models to all random accumulations
mods2 <- fitspecaccum(sp4, "arrh")
plot(mods2, col="darkred", xlab = "Number of Fish", ylab = "Number of Copepod species")
#boxplot(sp2, col = "darkblue", border = "blue", lty=1, cex=0.3, add= TRUE)
## Use nls() methods to the list of models
sapply(mods$models, AIC)

plot(mods, col = "lightblue", xlab = "Number of Fish", ylab = "Number of parasite species")
plot(mods2, add = TRUE, col = "darkred")

################################################################################
############################# HOST DIET GRAPHS #################################
################################################################################

all_fish_ecology_Cop <- inner_join(fish_species_number_Copepoda_species, all_fish_ecology_Cop, 
                                        by = c("Fish_species" = "Species"))
all_fish_ecology_Trem <- inner_join(fish_species_number_Trematoda_species, all_fish_ecology_Trem, 
                                         by = c("Fish_species" = "Species"))
all_fish_ecology_Cop <- select(all_fish_ecology_Cop, -DietRemark, -FoodRemark)
all_fish_ecology_Trem <- select(all_fish_ecology_Trem, -DietRemark, -FoodRemark)

all_fish_ecology_Cop <- all_fish_ecology_Cop %>% drop_na()
all_fish_ecology_Trem <- all_fish_ecology_Trem %>% drop_na()

all_fish_ecology_Cop <- all_fish_ecology_Cop %>% remove_rownames %>% column_to_rownames(var="Fish_species")
all_fish_ecology_Trem <- all_fish_ecology_Trem %>% remove_rownames %>% column_to_rownames(var="Fish_species")

all_fish_ecology_trematoda_Herb <- select(all_fish_ecology_Trem, -FeedingType)
all_fish_ecology_trematoda_Feed <- select(all_fish_ecology_Trem, -Herbivory2) 

all_fish_ecology_copepoda_Herb <- select(all_fish_ecology_Cop, -FeedingType)
all_fish_ecology_copepoda_Feed <- select(all_fish_ecology_Cop, -Herbivory2) 


all_fish_ecology_copepoda_Herb_average <- aggregate(. ~ Herbivory2, data = all_fish_ecology_copepoda_Herb, FUN = mean)
all_fish_ecology_copepoda_Feed_average <- aggregate(. ~ FeedingType, data = all_fish_ecology_copepoda_Feed, FUN = mean)
all_fish_ecology_copepoda_Herb_average <- all_fish_ecology_copepoda_Herb_average %>% mutate(Parasites = "Copepoda")
all_fish_ecology_copepoda_Feed_average <- all_fish_ecology_copepoda_Feed_average %>% mutate(Parasites = "Copepoda")
colnames(all_fish_ecology_copepoda_Herb_average)[colnames(all_fish_ecology_copepoda_Herb_average) == "Number_of_copepod_species"] ="Average_number_of_species"
colnames(all_fish_ecology_copepoda_Feed_average)[colnames(all_fish_ecology_copepoda_Feed_average) == "Number_of_copepod_species"] ="Average_number_of_species"


all_fish_ecology_trematoda_Herb_average <- aggregate(. ~ Herbivory2, data = all_fish_ecology_trematoda_Herb, FUN = mean)
all_fish_ecology_trematoda_Feed_average <- aggregate(. ~ FeedingType, data = all_fish_ecology_trematoda_Feed, FUN = mean)
all_fish_ecology_trematoda_Herb_average <- all_fish_ecology_trematoda_Herb_average %>% mutate(Parasites = "Trematoda")
all_fish_ecology_trematoda_Feed_average <- all_fish_ecology_trematoda_Feed_average %>% mutate(Parasites = "Trematoda")
colnames(all_fish_ecology_trematoda_Herb_average)[colnames(all_fish_ecology_trematoda_Herb_average) == "Number_of_trematod_species"] ="Average_number_of_species"
colnames(all_fish_ecology_trematoda_Feed_average)[colnames(all_fish_ecology_trematoda_Feed_average) == "Number_of_trematod_species"] ="Average_number_of_species"

all_fish_ecology_Herb_average <- rbind(all_fish_ecology_copepoda_Herb_average, all_fish_ecology_trematoda_Herb_average)
all_fish_ecology_Feed_average <- rbind(all_fish_ecology_copepoda_Feed_average, all_fish_ecology_trematoda_Feed_average)

# Grouped
ggplot(all_fish_ecology_Herb_average, aes(fill=Parasites, y=Average_number_of_species, x=Herbivory2)) + 
  geom_bar(position = position_dodge2(preserve = "single", padding = 0), stat="identity") + 
  theme(axis.text.x=element_text(angle = 45,  hjust=1)) +
  labs(x = "Host Diet", y= "Average number of species") + 
  theme(panel.background = element_rect(fill = "white", colour = "grey50"))
ggsave("fish_diet_parasite_number.png", dpi=300, width =8, height = 6)

ggplot(all_fish_ecology_Feed_average, aes(fill=Parasites, y=Average_number_of_species, x=FeedingType)) + 
  geom_bar(position = position_dodge2(preserve = "single", padding = 0), stat="identity") + 
  theme(axis.text.x=element_text(angle = 45,  hjust=1)) +
  labs(x = "Host Feeding Type", y= "Average number of species") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"))
ggsave("fish_type_parasite_number.png", dpi=300, width =8, height = 6)


#Save the workspace
save.image(file = "graphs.RData")

################################################################################
################################################################################
################################################################################

