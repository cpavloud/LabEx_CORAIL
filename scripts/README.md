The analysis is done in several steps. 

**Step 1**

Since we are interested in specific Marine Ecoregions of the World (MEOW) provinces, the first step is to run [1_mregions.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/1_mregions.R) to create the .wkt geometries of the MEOW regions and provinces of interest.

**Step 2**

Since the .wkt geometries are too big to allow for occurrence searches, we need to run the [2_script_big_wkt.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/2_script_big_wkt.R) to convert the .wkt to smaller boxes. 

**Step 3**

Run [3_obis.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/3_obis.R) and [3_fishbase.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/3_fishbase.R) to fetch the occurrences for the fish in the regions of interest.
Also, run [3_checklists.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/3_checklists.R) to import the DNA barcode reference library of French Polynesian shore fishes ([Delrieu-Trottin et al., 2019](https://doi.org/10.1038/s41597-019-0123-5)) and the cleaner reef fish fauna checklist of [Quimbayo et al. (2021)](https://doi.org/10.1111/jbi.14214). The input files are found in the folder [input_files](https://github.com/cpavloud/LabEx_CORAIL/tree/main/input_files/).

**Step 4**

Run [4_worms.R](https://github.com/cpavloud/LabEx_CORAIL/blob/main/scripts/4_worms.R) to:

a) merge all the above fish lists,

b) select only the fish taxa identified to species level, 

c) extract unique species AphiaIDs, 

d) retrieve classification,

e) check if they are characterized in FishBase as "Reef-associated", "Demersal" or "Pelagic".

*Note*: There are fish species which are indeed reef-associated but are not characterized as such in FishBase. Therefore, by exluding them from the lists, we may end up losing important information.
	

**Step 5**


**Step 6**


**Step 7**



**Step 8**


**Step 9**