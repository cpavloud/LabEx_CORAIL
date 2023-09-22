The analysis was done in several steps. 

**Step 1**

Since we were interested in specific Marine Ecoregions of the World (MEOW) provinces, the first step was to run [1_mregions.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/1_mregions.R) to create the .wkt geometries of the MEOW regions and provinces of interest.

**Step 2**

Since the .wkt are too big, we need to run the [2_script_big_wkt.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/2_script_big_wkt.R) to convert the .wkt to smaller boxes. 

**Step 3**

Run [3_obis.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/3_obis.R) and [3_fishbase.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/3_fishbase.R) to fetch the occurrences for the fish in the regions of interest.
Also, run [3_checklists.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/3_checklists.R) to import the DNA barcode reference library of French Polynesian shore fishes ([Delrieu-Trottin et al., 2019](https://doi.org/10.1038/s41597-019-0123-5)) and the cleaner reef fish fauna checklist of [Quimbayo et al. (2021)](https://doi.org/10.1111/jbi.14214). The input files are found in the folder [input_files](https://github.com/cpavloud/LabEx_CORAIL/tree/main/input_files/).

**Step 4**

Run 4_worms.R to

a) select only the taxa identified to species level


b) extract unique species AphiaIDs (XXX_aphiaID and XXX_aphiaID_list)
c) get unique species attribute data by AphiaID (XXX_attr), select only the parasitic and delete the children_children column (XXX_attr2)
d) select the unique species AphiaIDs for which attributes couldn't be found (XXX_unmatched_aphiaID) (DO NOT DO IT)
e) retrieve hosts for the parasitic species (XXX_host_aphiaID)
f) get classification for the hosts (XXX_host_clas) and separate for fish (XXX_host_clas_fish) and other hosts (XXX_host_clas_notfish)
g) filter the attribute data frames for only the fish/parasite pairs (XXX_attr3) and only the other pairs (XXX_attr4)
h) get attribute data by fish host AphiaID (XXX_fishhost)
i) select the unique fish host species AphiaIDs for which attributes couldn't be found (XXX_fishhost_unmatched_aphiaID)	

**Step 5**


**Step 6**


**Step 7**



**Step 8**


**Step 9**