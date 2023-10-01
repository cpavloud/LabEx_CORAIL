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
                         "18S", data$region16S) 

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

for (i in c(1:dim(data)[1])) {
  if (!is.na(data$wholemtDNA[i])) {
    data$regionCOI[i] <- "COI"
    data$region18S[i] <- "18S"
    data$region16S[i] <- "16S"
    data$regioncytb[i] <- "cytb"
    data$regionnd1[i] <- "ND1"
  }
}
data$wholemtDNA <- NULL

data$partialmtDNA <- NA
data$partialmtDNA <- ifelse((str_detect(data$Sequence_Title, "mitochondrion, partiale genome"))== "TRUE" 
                            | (str_detect(data$Sequence_Title, "mitochondrial DNA, partial sequence"))== "TRUE"
                            | (str_detect(data$Sequence_Title, "mitochondrial DNA, partial genome"))== "TRUE"
                            | (str_detect(data$Sequence_Title, "mitochondrion, partial genome"))== "TRUE",
                            "partialmtDNA", data$partialmtDNA)

data$othermtDNA <- NA
data$othermtDNA <- ifelse(is.na(data$regionCOI) & is.na(data$regionnd1) & is.na(data$region18S) & is.na(data$region16S) & is.na(data$regioncytb) & is.na(data$partialmtDNA),
                          "other mtDNA", data$othermtDNA)

# # In order to identify partialmtDNA, we will download the sequences to perform an alignment 
# # Create a vector with GenBank accession numbers
# partialmtDNA <- data %>% filter(partialmtDNA == "partialmtDNA" )
# partialmtDNA_accession_numbers <- unlist(partialmtDNA[,4])
# # Download FASTA file
# partialmtDNA_sequences <- read.GenBank(partialmtDNA_accession_numbers, quiet = F) 
# write.dna(partialmtDNA_sequences, file ="PartialmtDNA.fasta", format = "fasta", append = FALSE, nbcol = 6, colsep = " ", colw = 10) #BLAST input file
# 
# #Among the already identified sequences, choose complete sequences corresponding to target regions to be used as references for the alignment 
# data$Sequence_Length <- as.numeric(data$Sequence_Length)
# gene_COI <- data %>% filter(regionCOI=="COI" & is.na(region18S) & is.na(regionnd1) & is.na(region16S) & is.na(regioncytb))
# gene_COI <- filter(gene_COI, Sequence_Length > 700 & Sequence_Length < 1800)
# gene_COI <- dplyr::filter(gene_COI, !grepl("partial", Sequence_Title))
# gene_COI <- gene_COI$Acc_Number
# ref_seq_COI <- read.GenBank(gene_COI,quiet = F)
# write.dna(ref_seq_COI, file ="completeCOI_ref_seq.fasta", format = "fasta", append = FALSE, nbcol = 6, colsep = " ", colw = 10) #BLAST input file (COI alignment)
# 
# gene_18S <- data %>% filter(is.na(regionCOI) & region18S=="18S" & is.na(regionnd1) & is.na(region16S) & is.na(regioncytb))
# gene_18S <- filter(gene_18S, Sequence_Length > 500 & Sequence_Length < 1300) #if & does not work, try |
# #gene_18S <- dplyr::filter(gene_18S, !grepl("partial", Sequence_Title))
# gene_18S <- gene_18S$Acc_Number
# ref_seq_18S <- read.GenBank(gene_18S,quiet = F)
# write.dna(ref_seq_18S, file ="complete18S_ref_seq.fasta", format = "fasta", append = FALSE, nbcol = 6, colsep = " ", colw = 10) #BLAST input file (18S alignment))
# 
# gene_16S <- data %>% filter(is.na(regionCOI) & is.na(region18S)  & is.na(regionnd1) & region16S=="16S" &  is.na(regioncytb))
# gene_16S <- filter(gene_16S, Sequence_Length > 1200 & Sequence_Length < 1800) 
# gene_16S <- dplyr::filter(gene_16S, !grepl("partial", Sequence_Title))
# gene_16S <- gene_16S$Acc_Number
# ref_seq_16S <- read.GenBank(gene_16S,quiet = F)
# write.dna(ref_seq_16S, file ="complete16S_ref_seq.fasta", format = "fasta", append = FALSE, nbcol = 6, colsep = " ", colw = 10) #BLAST input file (16S alignment)
# 
# gene_cytb <- data %>% filter(is.na(regionCOI) & is.na(region18S) & is.na(region16S) & regioncytb=="cytb")
# gene_cytb <- dplyr::filter(gene_cytb, Sequence_Length > 800 & Sequence_Length < 1400)
# gene_cytb <- dplyr::filter(gene_cytb, !grepl("partial", Sequence_Title))
# gene_cytb <- gene_cytb[sample(nrow(gene_cytb), 100), ]#random sampling of 100 sequences
# gene_cytb <- gene_cytb$Acc_Number
# ref_seq_cytb <- read.GenBank(gene_cytb,quiet = F)
# write.dna(ref_seq_cytb, file ="completecytb_ref_seq.fasta", format = "fasta", append = FALSE, nbcol = 6, colsep = " ", colw = 10) #BLAST input file (cytb alignment)

#Make a database with PartialmtDNA fasta sequences
#cmd: makeblastdb --in 'PartialmtDNA.fasta' -dbtype 'nucl' -out 'PartialmtDNA_Database'

#For each gene, perform an aligment by Basic Local Aligment Seach Tool with the created FASTA file
#cmd: blastn -db PartialmtDNA_Database -query completeCOI_ref_seq.fasta -outfmt '6 qseqid sseqid pident length qstart qend sstart send evalue stitle' -perc_identity 60 -evalue 0.0001 -out Output_blast_COI_PartialmtDNA.txt
#cmd: blastn -db PartialmtDNA_Database -query complete18S_ref_seq.fasta -outfmt '6 qseqid sseqid pident length qstart qend sstart send evalue stitle' -perc_identity 60 -evalue 0.0001 -out Output_blast_18S_PartialmtDNA.txt
#cmd:blastn -db PartialmtDNA_Database -query complete16S_ref_seq.fasta -outfmt '6 qseqid sseqid pident length qstart qend sstart send evalue stitle' -perc_identity 60 -evalue 0.0001 -out Output_blast_16S_PartialmtDNA.txt
#cmd:blastn -db PartialmtDNA_Database -query completecytb_ref_seq.fasta -outfmt '6 qseqid sseqid pident length qstart qend sstart send evalue stitle' -perc_identity 60 -evalue 0.0001 -out Output_blast_cytb_PartialmtDNA.txt

#blast_COI <- read.delim("Output_blast_COI_PartialmtDNA.txt", header=FALSE)
#blast_COI$regionCOI <- c(rep("COI", nrow(blast_COI)))
#blast_COI <- dplyr::select(blast_COI, "V2", "regionCOI")
#blast_COI <- unique(blast_COI)

#blast_18S <- read.delim("Output_blast_18S_PartialmtDNA.txt", header=FALSE)
#blast_18S$region12S <- c(rep("18S", nrow(blast_18S)))
#blast_18S <- dplyr::select(blast_18S, "V2", "region18S")
#blast_18S <- unique(blast_18S)

#blast_16S <- read.delim("Output_blast_16S_PartialmtDNA.txt", header=FALSE)
#blast_16S$region16S <- c(rep("16S", nrow(blast_16S)))
#blast_16S <- dplyr::select(blast_16S, "V2", "region16S")
#blast_16S <- unique(blast_16S)

#blast_cytb <- read.delim("Output_blast_cytb_PartialmtDNA.txt", header=FALSE)
#blast_cytb$regioncytb <- c(rep("cytb", nrow(blast_cytb)))
#blast_cytb <- dplyr::select(blast_cytb, "V2", "regioncytb")
#blast_cytb <- unique(blast_cytb)

#blast <- Orcs::merge(list(blast_COI, blast_18S, blast_16S, blast_cytb), by = "V2", all=T)
#names(blast)[1] <- "Acc_Number"

# Add new identified sequences to the main dataset
#data <- left_join(data, blast, by = c("Acc_Number")) %>% 
#  mutate(regionCOI = ifelse(is.na(regionCOI.x), regionCOI.y, regionCOI.x)) %>% 
#  mutate(region18S = ifelse(is.na(region18S.x), region18S.y, region18S.x)) %>% 
#  mutate(region16S = ifelse(is.na(region16S.x), region16S.y, region16S.x)) %>% 
#  mutate(regioncytb = ifelse(is.na(regioncytb.x), regioncytb.y, regioncytb.x)) %>% 
#  dplyr::select(Species_Name,Taxa_Id, Gi, Acc_Number, Sequence_Title, Sequence_Length, regionCOI, region18S, region16S, regioncytb, partialmtDNA, othermtDNA)
#data$partialmtDNA <- NULL
# Remove other mtDNA sequences
#data <- data %>% filter(is.na(othermtDNA))
#data$othermtDNA<-NULL

# Save dataset
#write.table(data, "Genbank_available_sequences_Copepoda_September.txt", row.names = FALSE, col.names = TRUE)
write.table(data, "Genbank_available_sequences_Trematoda_September.txt", row.names = FALSE, col.names = TRUE)

# # Download COI and 18S gene sequences (will be used later)
# Sequences_COI <- data %>% filter(data$regionCOI=="COI")
# Sequences_COI <- unique(Sequences_COI$Acc_Number)
# Sequences_COI <- read.GenBank(Sequences_COI, chunk.size = 300, quiet=F) 
# write.dna(Sequences_COI, file ="Sequences_COI.fasta", format = "fasta", append = FALSE, nbcol = 6, colsep = " ", colw = 10) 
# 
# Sequences_18S <- data %>% filter(data$region18S=="18S")
# Sequences_18S <- unique(Sequences_18S$Acc_Number)
# Sequences_18S <- read.GenBank(Sequences_18S, chunk.size = 300, quiet=F) 
# write.dna(Sequences_18S, file ="Sequences_18S.fasta", format = "fasta", append = FALSE, nbcol = 6, colsep = " ", colw = 10) 
# 
# Sequences_16S <- data %>% filter(data$region16S=="16S")
# Sequences_16S <- unique(Sequences_16S$Acc_Number)
# Sequences_16S <- read.GenBank(Sequences_16S, chunk.size = 300, quiet=F) 
# write.dna(Sequences_16S, file ="Sequences_16S.fasta", format = "fasta", append = FALSE, nbcol = 6, colsep = " ", colw = 10) 
# 
# Sequences_cytb <- data %>% filter(data$regioncytb=="cytb")
# Sequences_cytb <- unique(Sequences_cytb$Acc_Number)
# Sequences_cytb <- read.GenBank(Sequences_cytb, chunk.size = 300, quiet=F) 
# write.dna(Sequences_cytb, file ="Sequences_cytb.fasta", format = "fasta", append = FALSE, nbcol = 6, colsep = " ", colw = 10) 
# 
# Sequences_nd1 <- data %>% filter(data$regionnd1=="nd1")
# Sequences_nd1 <- unique(Sequences_nd1$Acc_Number)
# Sequences_nd1 <- read.GenBank(Sequences_nd1, chunk.size = 300, quiet=F) 
# write.dna(Sequences_nd1, file ="Sequences_nd1.fasta", format = "fasta", append = FALSE, nbcol = 6, colsep = " ", colw = 10) 


# Make summary file
# Prepare data
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
#colnames(Nematoda_species)[colnames(Nematoda_species) == "Nematoda_species"] ="scientificName"
#colnames(Copepoda_species)[colnames(Copepoda_species) == "Copepoda_species"] ="scientificName"
#colnames(Cestoda_species)[colnames(Cestoda_species) == "Cestoda_species"] ="scientificName"
#colnames(Isopoda_species)[colnames(Isopoda_species) == "Isopoda_species"] ="scientificName"
#colnames(Monogenea_species)[colnames(Monogenea_species) == "Monogenea_species"] ="scientificName"
#colnames(Myxozoa_species)[colnames(Myxozoa_species) == "Myxozoa_species"] ="scientificName"
#colnames(Trematoda_combined)[colnames(Trematoda_combined) == "Trematoda_combined"] ="scientificName"
# 
# Species_list <- rbind(Nematoda_species, Copepoda_species, Cestoda_species, 
#                       Isopoda_species, Monogenea_species, Myxozoa_species, 
#                       Trematoda_combined)
# colnames(Species_list)[colnames(Species_list) == "scientificName"] ="Species_Name"

#Copepoda_species <- read.csv("Copepoda_species_for_NCBI_September.txt", sep = ';', header = FALSE)
#names(Copepoda_species)[1] <- "Species_Name"

Trematoda_species <- read.csv("Trematoda_species_for_NCBI_September.txt", sep = ';', header = FALSE)
names(Trematoda_species)[1] <- "Species_Name"

# Merge taxonomy with gene information
#data_with_taxa <- merge(Copepoda_species, summary, by="Species_Name", all = T) 
data_with_taxa <- merge(Trematoda_species, summary, by="Species_Name", all = T) 


#col_order <- c("Species_Name", "COI", "18S", "16S")
col_order <- c("Species_Name", "COI", "18S", "16S", "cytb", "nd1")

data_with_taxa <- data_with_taxa[, col_order]
data_with_taxa[is.na(data_with_taxa)]<- 0


# Export data
#write.table(data_with_taxa, "Available_sequences_parasites_copepoda_September.txt", sep = " ", dec = ".",
#            row.names = FALSE, col.names = TRUE)
write.table(data_with_taxa, "Available_sequences_parasites_trematoda_September.txt", sep = " ", dec = ".",
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










#Save the workspace
save.image(file = "makegene.RData")
