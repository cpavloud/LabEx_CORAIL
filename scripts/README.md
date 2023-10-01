The analysis is done in several steps. 

**Step 1**

Since we are interested in specific Marine Ecoregions of the World (MEOW) provinces, the first step is to run [1_mregions.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/1_mregions.R) to create the .wkt geometries of the MEOW regions and provinces of interest.

**Step 2**

Since the .wkt geometries are too big to allow for occurrence searches, we need to run the [2_script_big_wkt.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/2_script_big_wkt.R) to convert the .wkt to smaller boxes. 

**Step 3**

Run [3_obis.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/3_obis.R) and [3_fishbase.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/3_fishbase.R) to fetch the occurrences for the fish in the regions of interest.
Also, run [3_checklists.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/3_checklists.R) to import the DNA barcode reference library of French Polynesian shore fishes ([Delrieu-Trottin et al., 2019](https://doi.org/10.1038/s41597-019-0123-5)) and the cleaner reef fish fauna checklist of [Quimbayo et al., (2021)](https://doi.org/10.1111/jbi.14214). The input files are found in the folder [input_files](https://github.com/cpavloud/LabEx_CORAIL/tree/main/input_files/).
In addition, run [3_fish_from_local_databases.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/3_fish_from_local_databases.R) to select the fish hosts from locally stored databases for Trematoda and Copepoda, as well as from the Trematoda data of the [Host-Parasite database of the Natural History Museum (NHM)](https://www.nhm.ac.uk/research-curation/scientific-resources/taxonomy-systematics/host-parasites/database/index.jsp).

**Step 4**

Run [4_worms.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/4_worms.R) to:

a) select only the fish taxa identified to species level,

b) merge all the above fish lists,

c) extract unique species AphiaIDs, 

d) retrieve classification,

e) calculate statistics, i.e. number of fish species per province,

f) check if they are characterized in FishBase as "Reef-associated", "Demersal" or "Pelagic".

*Note*: There are fish species which are indeed reef-associated but are not characterized as such in FishBase. Therefore, by exluding them from the lists, we may end up losing important information. We can manually curate the results from FishBase and increase the number of reef-associated fish species. 

g) check which are the fish species that are not included in the Trematoda and Copepoda checklists, i.e. the fish species for which there are no parasite data, and search (manually unfortunately) in [WoRMS](https://www.marinespecies.org/index.php) for the parasites infecting them. 

h) retrieve body size information for all the fish, 

i) retrieve information on feeding type and diet of all the fish. 

**Step 5**

Run [5_retrieve_parasite.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/5_retrieve_parasite.R) to 

a) add the new parasite information from WoRMS, 

b) check their distribution, 

c) delete those that are not occurring in the provinces of interest,

d) select only Trematoda and Copepoda (but also calculate brief statistics for the other groups), 

e) create lists (per species, genus, family) to search against GenBank. 

**Step 6**

Run the [6_getGenes.py](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/6_getGenes.py) script to retrieve DNA sequence accession numbers from Genbank. 
This python script was retrieved from the [GitHub page of Naiara Rodríguez-Ezpeleta](https://github.com/rodriguez-ezpeleta/NEA_fish_DB) and was used in the [Claver et al., 2023](https://doi.org/10.1002/edn3.433) publication. 

(*usage*: python2.7 6_getGenes.py *input_file* *output_file*)

**Step 7**



**Step 8**
