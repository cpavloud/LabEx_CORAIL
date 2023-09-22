1st step --> Run mregions.R to create the wkt geometries of the Spalding regions of interest --> save workspace as mregions.RData
2nd step --> Run script_big_wkt.R to convert the wkt to smaller boxes --> save workspace as geo_boxes.RData

3rd step --> Run obis.R to fetch the occurrences for the 7 taxonomic groups of interest for a) the smaller boxes and b) a big Pacific polygon --> save workspace as occurrences.RData
4th step --> Run worms.R to a) combine the smaller boxes with the Pacific polygon (DO NOT DO IT)
							b) extract unique species AphiaIDs (XXX_aphiaID and XXX_aphiaID_list)
							c) get unique species attribute data by AphiaID (XXX_attr), select only the parasitic and delete the children_children column (XXX_attr2)
							d) select the unique species AphiaIDs for which attributes couldn't be found (XXX_unmatched_aphiaID) (DO NOT DO IT)
							e) retrieve hosts for the parasitic species (XXX_host_aphiaID)
							f) get classification for the hosts (XXX_host_clas) and separate for fish (XXX_host_clas_fish) and other hosts (XXX_host_clas_notfish)
							g) filter the attribute data frames for only the fish/parasite pairs (XXX_attr3) and only the other pairs (XXX_attr4)
							h) get attribute data by fish host AphiaID (XXX_fishhost)
							i) select the unique fish host species AphiaIDs for which attributes couldn't be found (XXX_fishhost_unmatched_aphiaID)							
							--> save workspace as worms.RData
5th step --> 	Run add_entries.R to include species lists from Tom & Rob (Trematoda) and Spalding province in all

6th step --> 	Run species_lists_for_etulis.R to create the species list for the getGenes.py
7th step --> 	Run getGenes.py to retrieve the genes 
				e.g. python2.7 getGenes.py Trematoda_species_for_NCBI.txt Trematoda_genes_from_NCBI.txt
					python2.7 getGenes.py Copepoda_species_for_NCBI.txt Copepoda_genes_from_NCBI.txt
8th step --> 	Run makeGeneTable.R
9th step --> 	Run maps.R to create maps
