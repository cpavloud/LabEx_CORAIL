################################################################################
########################### LOAD LIBRARIES #####################################
################################################################################

# List of packages needed
.packages = c("readr", "stringr", "tidyverse", "ape", "Orcs")

# Install CRAN packages (if not already installed)
.inst <- .packages %in% installed.packages()
if(length(.packages[!.inst]) > 0) install.packages(.packages[!.inst])

# Load packages into session 
lapply(.packages, require, character.only=TRUE)

packageVersion("readr")
packageVersion("stringr")
packageVersion("tidyverse")
packageVersion("ape")
packageVersion("Orcs")

################################################################################
############################# IMPORT FILES #####################################
################################################################################

################################################################################
################################# COPEPODA #####################################
################################################################################

#read results from getGenes.py
Copepoda_genes_species <- read_tsv("Copepoda_reef_species_from_NCBI.txt", col_names = T)
Copepoda_genes_species <- unique(Copepoda_genes_species)
Copepoda_genes_genera <- read_tsv("Copepoda_reef_genera_from_NCBI.txt", col_names = T)
Copepoda_genes_genera <- unique(Copepoda_genes_genera)
Copepoda_genes_families <- read_tsv("Copepoda_reef_family_from_NCBI.txt", col_names = T)
Copepoda_genes_families <- unique(Copepoda_genes_families)

Copepoda_genes <- rbind(Copepoda_genes_species, Copepoda_genes_genera, Copepoda_genes_families)
Copepoda_genes <- unique(Copepoda_genes)

data <- Copepoda_genes

# Remove UNVERIFIED sequences (https://www.ncbi.nlm.nih.gov/genbank/unverified/)
data <- dplyr::filter(data, !grepl("UNVERIFIED", Sequence_Title))

# Remove erroneous assignations  
nrow(data) - length(unique(data$Acc_Number)) #if this value >0 run the step. If =0, move to next step 
n_occur <- data.frame(table(data$Acc_Number))
n_occur<- n_occur[n_occur$Freq > 1, ]
duplicated <- data[data$Acc_Number %in% n_occur$Var1, ]
duplicated$check <- NA
for (i in  c(1:dim(duplicated[1]))) {
  duplicated$check[i]<- ifelse((str_detect(duplicated$Sequence_Title[i],duplicated$Species_Name[i]))== "FALSE", "ERROR", NA)
}
duplicated <- duplicated %>% filter(check =="ERROR")
duplicated$check <-NULL
data <- anti_join(data, duplicated) 

# Assign content of the sequences by descrition (Sequence_Title)
data$regionCOI <- NA
data$regionCOI <- ifelse((str_detect(data$Sequence_Title , "cytocrome c oxidase subunit 1")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "cytochrome oxidase subunit 1")) == "TRUE" 
                         |(str_detect(data$Sequence_Title, "cytochrome c oxidase subunit 1")) == "TRUE" 
                         |(str_detect(data$Sequence_Title,"cytochrome c oxidase 1")) =="TRUE"
                         |(str_detect(data$Sequence_Title,"cytochrome oxidase subunit I gene")) == "TRUE" 
                         |(str_detect(data$Sequence_Title,"cytochrome oxidase subunit I-like gene"))=="TRUE"
                         |(str_detect(data$Sequence_Title, "cytochrome c oxidase subunit I gene")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "cytochrome oxidase subunit I,")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "cytochrome c oxidase subunit I mRNA,")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "cytochrome c oxidase subunits I and")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "cytochrome c oxidase subunit I,")) == "TRUE"
                         |(str_detect(data$Sequence_Title,"cytochrome oxidase I gene")) == "TRUE"
                         |(str_detect(data$Sequence_Title,"COI gene")) =="TRUE"
                         |(str_detect(data$Sequence_Title,"COX1")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "COI (partial)"))== "TRUE"
                         |(str_detect(data$Sequence_Title,"coi gene" ))== "TRUE"
                         |(str_detect(data$Sequence_Title, "cox1 gene"))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(co1)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title, "(COI)"))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(CO1)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(COXI)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(cox1)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(CO-I)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(COX I)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(COX-1)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(coxI)"))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(CoxI)"))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(cox I)" ))== "TRUE",
                         "COI", data$regionCOI)

data$region16S <- NA
data$region16S <- ifelse((str_detect(data$Sequence_Title, "SSU"))== "TRUE" 
                         |(str_detect(data$Sequence_Title, "SSU rRNA"))== "TRUE"
                         | (str_detect(data$Sequence_Title, "small subunit ribosomal RNA"))== "TRUE" 
                         | (str_detect(data$Sequence_Title, "16 ribosomal RNA gene"))== "TRUE"
                         | (str_detect(data$Sequence_Title, "16S ribosomal RNA"))== "TRUE"
                         | (str_detect(data$Sequence_Title, "16S rRNA"))== "TRUE"
                         | (str_detect(data$Sequence_Title, "16S"))== "TRUE",
                         "16S", data$region16S)

data$region18S <- NA
data$region18S <- ifelse((str_detect(data$Sequence_Title, "18S ribosomal RNA"))== "TRUE"
                         |(str_detect(data$Sequence_Title, "18 ribosomal RNA gene"))== "TRUE"
                         |(str_detect(data$Sequence_Title, "18S rRNA"))== "TRUE" 
                         |(str_detect(data$Sequence_Title, "18S")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "LSU rRNA"))== "TRUE"
                         | (str_detect(data$Sequence_Title, "LSU"))== "TRUE"
                         |(str_detect(data$Sequence_Title, "large subunit ribosomal RNA"))== "TRUE",
                         "18S", data$region18S) 

data$regioncytb <- NA
data$regioncytb <- ifelse((str_detect(data$Sequence_Title, "cyt b"))== "TRUE" 
                          | (str_detect(data$Sequence_Title, "cytb"))== "TRUE" 
                          | (str_detect(data$Sequence_Title,"CYTB"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "cytochrome B"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "cytochrome b"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "cytochrome oxidase B")) == "TRUE"
                          | (str_detect(data$Sequence_Title, "cytochrome-b"))== "TRUE",
                          "cytb", data$regioncytb)

data$regionnd1 <- NA
data$regionnd1 <- ifelse((str_detect(data$Sequence_Title, "NADH dehydrogenase subunit 1 (ND1)"))== "TRUE" 
                         | (str_detect(data$Sequence_Title, "ND1 gene"))== "TRUE" 
                         | (str_detect(data$Sequence_Title,"ND1"))== "TRUE"
                         | (str_detect(data$Sequence_Title, "NADH"))== "TRUE",
                         "nd1", data$regionnd1)

data$wholemtDNA <- NA
data$wholemtDNA <- ifelse((str_detect(data$Sequence_Title, "complete genome"))== "TRUE" 
                          | (str_detect(data$Sequence_Title, "complete mitochondiral genome"))== "TRUE" 
                          | (str_detect(data$Sequence_Title,"complete mitochondrial DNA sequence"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "complete mitochondrial DNA genome"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "genome assembly, organelle: mitochondrion"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrial DNA, almost complete sequence")) == "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrial DNA, compete genome"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrial DNA, complete and partial sequence"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrial DNA, complete sequence"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrial genome"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrion, complete sequence"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrionial geneome"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "whole genome shotgun"))== "TRUE",
                          "wholemtDNA", data$wholemtDNA)

data$partialmtDNA <- NA
data$partialmtDNA <- ifelse((str_detect(data$Sequence_Title, "mitochondrion, partiale genome"))== "TRUE" 
                            | (str_detect(data$Sequence_Title, "mitochondrial DNA, partial sequence"))== "TRUE"
                            | (str_detect(data$Sequence_Title, "mitochondrial DNA, partial genome"))== "TRUE"
                            | (str_detect(data$Sequence_Title, "mitochondrion, partial genome"))== "TRUE",
                            "partialmtDNA", data$partialmtDNA)

for (i in c(1:dim(data)[1])) {
  if (!is.na(data$wholemtDNA[i])) {
    data$regionCOI[i] <- "COI"
    data$region18S[i] <- "18S"
    data$region16S[i] <- "16S"
    data$regioncytb[i] <- "cytb"
    data$regionnd1[i] <- "nd1"
    data$partialmtDNA[i] <- "partialmtDNA"
  }
}
data$wholemtDNA <- NULL


data$othermtDNA <- NA
data$othermtDNA <- ifelse(is.na(data$regionCOI) & is.na(data$regionnd1) & is.na(data$region18S) & is.na(data$region16S) & is.na(data$regioncytb) & is.na(data$partialmtDNA),
                          "other mtDNA", data$othermtDNA)

#Save dataset
write.table(data, "Genbank_available_sequences_Copepoda.txt", row.names = FALSE, col.names = TRUE)

#Download sequences
Sequences <- unique(data$Acc_Number)
Sequences <- read.GenBank(Sequences, chunk.size = 300, quiet=F) 

# Make summary file
#Prepare data
data_elongated <- data %>% gather(colname, Gene, -c(Species_Name, Taxa_Id, Gi, Acc_Number, Sequence_Title, Sequence_Length))
data_elongated <- data_elongated %>% filter(!is.na(Gene))
data_elongated <- data_elongated %>% dplyr::select(Species_Name, Gene)

species <- unique(data_elongated$Species_Name)
genes <- unique(data_elongated$Gene)
vector<-c()
for (i in species) { 
  for (ii in genes) {
    vector <-c(vector,length(data_elongated[(data_elongated$Species_Name==i) & (data_elongated$Gene == ii), 2]))
  }
}
summary <- data.frame(matrix(data = vector, byrow=TRUE, nrow=length(species), ncol=length(genes)))
colnames(summary) <- genes
rownames(summary) <- species
summary$Species_Name <- rownames(summary)

# Merge all the taxonomy files created in previous step
#names(Copepoda_species)[1] <- "Species_Name"
Copepoda_genes_species_names <- select(Copepoda_genes_species, Species_Name)
Copepoda_genes_genera_names <- select(Copepoda_genes_genera, Species_Name)
Copepoda_genes_families_names <- select(Copepoda_genes_families, Species_Name)
Copepoda_species <- rbind(Copepoda_genes_species_names, Copepoda_genes_genera_names, Copepoda_genes_families_names)
Copepoda_species <- unique(Copepoda_species)

#Merge taxonomy with gene information
data_with_taxa <- merge(Copepoda_species, summary, by="Species_Name", all = T) 
data_with_taxa[is.na(data_with_taxa)]<- 0

#Export data
write.table(data_with_taxa, "Available_sequences_parasites_copepoda.txt", sep = "\t", dec = ".",
            row.names = FALSE, col.names = TRUE)


################################################################################
################################### TREMATODA ##################################
################################################################################

#read results from getGenes.py
Trematoda_genes_species <- read_tsv("Trematoda_reef_species_from_NCBI.txt", col_names = T)
Trematoda_genes_species <- unique(Trematoda_genes_species)
Trematoda_genes_genera <- read_tsv("Trematoda_reef_genera_from_NCBI.txt", col_names = T)
Trematoda_genes_genera <- unique(Trematoda_genes_genera)
Trematoda_genes_families <- read_tsv("Trematoda_reef_family_from_NCBI.txt", col_names = T)
Trematoda_genes_families <- unique(Trematoda_genes_families)

Trematoda_genes <- rbind(Trematoda_genes_species, Trematoda_genes_genera, Trematoda_genes_families)

data <- Trematoda_genes

# Remove UNVERIFIED sequences (https://www.ncbi.nlm.nih.gov/genbank/unverified/)
data <- dplyr::filter(data, !grepl("UNVERIFIED", Sequence_Title))

# Remove erroneous assignations  
nrow(data) - length(unique(data$Acc_Number)) #if this value >0 run the step. If =0, move to next step 
n_occur <- data.frame(table(data$Acc_Number))
n_occur<- n_occur[n_occur$Freq > 1, ]
duplicated <- data[data$Acc_Number %in% n_occur$Var1, ]
duplicated$check <- NA
for (i in  c(1:dim(duplicated[1]))) {
  duplicated$check[i]<- ifelse((str_detect(duplicated$Sequence_Title[i],duplicated$Species_Name[i]))== "FALSE", "ERROR", NA)
}
duplicated <- duplicated %>% filter(check =="ERROR")
duplicated$check <-NULL
data <- anti_join(data, duplicated) 

# Assign content of the sequences by descrition (Sequence_Title)
data$regionCOI <- NA
data$regionCOI <- ifelse((str_detect(data$Sequence_Title , "cytocrome c oxidase subunit 1")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "cytochrome oxidase subunit 1")) == "TRUE" 
                         |(str_detect(data$Sequence_Title, "cytochrome c oxidase subunit 1")) == "TRUE" 
                         |(str_detect(data$Sequence_Title,"cytochrome c oxidase 1")) =="TRUE"
                         |(str_detect(data$Sequence_Title,"cytochrome oxidase subunit I gene")) == "TRUE" 
                         |(str_detect(data$Sequence_Title,"cytochrome oxidase subunit I-like gene"))=="TRUE"
                         |(str_detect(data$Sequence_Title, "cytochrome c oxidase subunit I gene")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "cytochrome oxidase subunit I,")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "cytochrome c oxidase subunit I mRNA,")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "cytochrome c oxidase subunits I and")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "cytochrome c oxidase subunit I,")) == "TRUE"
                         |(str_detect(data$Sequence_Title,"cytochrome oxidase I gene")) == "TRUE"
                         |(str_detect(data$Sequence_Title,"COI gene")) =="TRUE"
                         |(str_detect(data$Sequence_Title,"COX1")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "COI (partial)"))== "TRUE"
                         |(str_detect(data$Sequence_Title,"coi gene" ))== "TRUE"
                         |(str_detect(data$Sequence_Title, "cox1 gene"))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(co1)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title, "(COI)"))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(CO1)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(COXI)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(cox1)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(CO-I)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(COX I)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(COX-1)" ))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(coxI)"))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(CoxI)"))== "TRUE"
                         |(str_detect(data$Sequence_Title,"(cox I)" ))== "TRUE",
                         "COI", data$regionCOI)

data$region16S <- NA
data$region16S <- ifelse((str_detect(data$Sequence_Title, "SSU"))== "TRUE" 
                         |(str_detect(data$Sequence_Title, "SSU rRNA"))== "TRUE"
                         | (str_detect(data$Sequence_Title, "small subunit ribosomal RNA"))== "TRUE" 
                         | (str_detect(data$Sequence_Title, "16 ribosomal RNA gene"))== "TRUE"
                         | (str_detect(data$Sequence_Title, "16S ribosomal RNA"))== "TRUE"
                         | (str_detect(data$Sequence_Title, "16S rRNA"))== "TRUE"
                         | (str_detect(data$Sequence_Title, "16S"))== "TRUE",
                         "16S", data$region16S)

data$region18S <- NA
data$region18S <- ifelse((str_detect(data$Sequence_Title, "18S ribosomal RNA"))== "TRUE"
                         |(str_detect(data$Sequence_Title, "18 ribosomal RNA gene"))== "TRUE"
                         |(str_detect(data$Sequence_Title, "18S rRNA"))== "TRUE" 
                         |(str_detect(data$Sequence_Title, "18S")) == "TRUE"
                         |(str_detect(data$Sequence_Title, "LSU rRNA"))== "TRUE"
                         | (str_detect(data$Sequence_Title, "LSU"))== "TRUE"
                         |(str_detect(data$Sequence_Title, "large subunit ribosomal RNA"))== "TRUE",
                         "18S", data$region18S) 

data$regioncytb <- NA
data$regioncytb <- ifelse((str_detect(data$Sequence_Title, "cyt b"))== "TRUE" 
                          | (str_detect(data$Sequence_Title, "cytb"))== "TRUE" 
                          | (str_detect(data$Sequence_Title,"CYTB"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "cytochrome B"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "cytochrome b"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "cytochrome oxidase B")) == "TRUE"
                          | (str_detect(data$Sequence_Title, "cytochrome-b"))== "TRUE",
                          "cytb", data$regioncytb)

data$regionnd1 <- NA
data$regionnd1 <- ifelse((str_detect(data$Sequence_Title, "NADH dehydrogenase subunit 1 (ND1)"))== "TRUE" 
                         | (str_detect(data$Sequence_Title, "ND1 gene"))== "TRUE" 
                         | (str_detect(data$Sequence_Title,"ND1"))== "TRUE"
                         | (str_detect(data$Sequence_Title, "NADH"))== "TRUE",
                         "nd1", data$regionnd1)

data$wholemtDNA <- NA
data$wholemtDNA <- ifelse((str_detect(data$Sequence_Title, "complete genome"))== "TRUE" 
                          | (str_detect(data$Sequence_Title, "complete mitochondiral genome"))== "TRUE" 
                          | (str_detect(data$Sequence_Title,"complete mitochondrial DNA sequence"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "complete mitochondrial DNA genome"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "genome assembly, organelle: mitochondrion"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrial DNA, almost complete sequence")) == "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrial DNA, compete genome"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrial DNA, complete and partial sequence"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrial DNA, complete sequence"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrial genome"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrion, complete sequence"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "mitochondrionial geneome"))== "TRUE"
                          | (str_detect(data$Sequence_Title, "whole genome shotgun"))== "TRUE",
                          "wholemtDNA", data$wholemtDNA)

data$partialmtDNA <- NA
data$partialmtDNA <- ifelse((str_detect(data$Sequence_Title, "mitochondrion, partiale genome"))== "TRUE" 
                            | (str_detect(data$Sequence_Title, "mitochondrial DNA, partial sequence"))== "TRUE"
                            | (str_detect(data$Sequence_Title, "mitochondrial DNA, partial genome"))== "TRUE"
                            | (str_detect(data$Sequence_Title, "mitochondrion, partial genome"))== "TRUE",
                            "partialmtDNA", data$partialmtDNA)

for (i in c(1:dim(data)[1])) {
  if (!is.na(data$wholemtDNA[i])) {
    data$regionCOI[i] <- "COI"
    data$region18S[i] <- "18S"
    data$region16S[i] <- "16S"
    data$regioncytb[i] <- "cytb"
    data$regionnd1[i] <- "nd1"
    data$partialmtDNA[i] <- "partialmtDNA"
  }
}
data$wholemtDNA <- NULL


data$othermtDNA <- NA
data$othermtDNA <- ifelse(is.na(data$regionCOI) & is.na(data$regionnd1) & is.na(data$region18S) & is.na(data$region16S) & is.na(data$regioncytb) & is.na(data$partialmtDNA),
                          "other mtDNA", data$othermtDNA)

#Save dataset
write.table(data, "Genbank_available_sequences_Trematoda.txt", row.names = FALSE, col.names = TRUE)

#Download sequences
Sequences <- unique(data$Acc_Number)
Sequences <- read.GenBank(Sequences, chunk.size = 300, quiet=F) 

# Make summary file
#Prepare data
data_elongated <- data %>% gather(colname, Gene, -c(Species_Name, Taxa_Id, Gi, Acc_Number, Sequence_Title, Sequence_Length))
data_elongated <- data_elongated %>% filter(!is.na(Gene))
data_elongated <- data_elongated %>% dplyr::select(Species_Name, Gene)

species <- unique(data_elongated$Species_Name)
genes <- unique(data_elongated$Gene)
vector<-c()
for (i in species) { 
  for (ii in genes) {
    vector <-c(vector,length(data_elongated[(data_elongated$Species_Name==i) & (data_elongated$Gene == ii), 2]))
  }
}
summary <- data.frame(matrix(data = vector, byrow=TRUE, nrow=length(species), ncol=length(genes)))
colnames(summary) <- genes
rownames(summary) <- species
summary$Species_Name <- rownames(summary)

# Merge all the taxonomy files created in previous step
#names(Trematoda_species)[1] <- "Species_Name"
Trematoda_genes_species_names <- select(Trematoda_genes_species, Species_Name)
Trematoda_genes_genera_names <- select(Trematoda_genes_genera, Species_Name)
Trematoda_genes_families_names <- select(Trematoda_genes_families, Species_Name)
Trematoda_species <- rbind(Trematoda_genes_species_names, Trematoda_genes_genera_names, Trematoda_genes_families_names)
Trematoda_species <- unique(Trematoda_species)

#Merge taxonomy with gene information
data_with_taxa <- merge(Trematoda_species, summary, by="Species_Name", all = T) 
data_with_taxa[is.na(data_with_taxa)]<- 0

#Export data
write.table(data_with_taxa, "Available_sequences_parasites_Trematoda.txt", sep = "\t", dec = ".",
            row.names = FALSE, col.names = TRUE)



#Save the workspace
save.image(file = "makegene.RData")

################################################################################
################################################################################
################################################################################
