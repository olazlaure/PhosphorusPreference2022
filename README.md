---
output: 
  html_document:
    keep_md: true
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



## GENERAL INFORMATION

####  1. Description
This research compendium describes how to analyze oviposition preference data from an experiment conducted in D. suzukii in 2018, in South of France (CBGP, Montpellier, France). [here](https://github.com/olazlaure/PhosphorusPreference2022/).  

The analyses of this research compendium are published in JOURNAL NAME in DATE.   
:writing_hand: Citation - Link to come.   

####  2. Author information and main investigators
	Corresponding Investigator and first author:
		Name: Laure Olazcuaga
		Institution: CBGP, INRAE, France and Colorado State University, USA
		Email: olaz.laure@gmail.com
		ORCID: 0000-0001-9100-1305

	Co-investigator and last author: 
		Name: Nicolas Rode
		Institution: CBGP, INRAE, France
		Email: nicolas.rode@inrae.fr
		ORCID: 0000-0002-1121-4202

For the complete list of authors of the manuscript, see the manuscript.  

####  3. Date and Geopgraphic location of data collection
:date: 2018.   

:round_pushpin: South of France.   

####  4. Funding sources that supported the collection of the data
We are grateful to Graeme D. Batten and Lindsay C. Campbell for insightful discussions on the chemical composition of fruits. L.O. acknowledges support from the European Union program FEFER FSE IEJ 2014-2020 (project CPADROL) and the INRAE scientific department SPE (AAP-SPE 2016). N.O.R. acknowledges support from the CeMEB LabEx/University of Montpellier (ANR-10-LABX-04-01). 

####  5. Recommended citation for this dataset:
:writing_hand: Olazcuaga et al. (XXX), Data from: XXXXX


## CONTENTS

The [:hammer: dev_history.R](devhistory.R) file allow to rebuild our research compendium from scratch for maximum reproducibility.

The [:open_file_folder: **figures**](figures/) directory contains the figures generated during the analyses.

The [:open_file_folder: **R**](R/) directory contains the functions used in the analyses.

The [:open_file_folder: **man**](man/) directory contains the documentation for the functions.

The [:open_file_folder: **data**](data/) directory contains the data sets used in the analyses. 

#### Data et file overview
 - [:bar_chart: DATA_PHOSPHORUS](data/DATA_PHOSPHORUS_test_arenas.csv) : Dataset containing oviposition preference data..

 - [:bar_chart: DATA_FRUITS](data/DATA_FRUITS_control_arenas.csv) : Dataset containing offsrping performance and oviposition stimulation data.
 
 - [:bar_chart: Data_Compo_Olazcuaga2019](data/Data_compo_fruits_FromOlazcuaga2019.csv) : Dataset of fruit composition from Olazcuaga et al. 2019 
 
 - [:bar_chart: Data_Preference_Olazcuaga2019](data/Data_preference_eggs_FromOlazcuaga2019.csv) : Dataset of oviposition preference from Olazcuaga et al. 2019 used for power analysis
 
 - [:clipboard: Readme_data](data/Readme_data.txt) : A detailed description of all the dataset. 

  
The [:open_file_folder: **reports**](reports/) directory contains the `.Rmd` files used to build each part of the analyses and produce the final figures. They also have rendered versions and `.html` suitable for reading in a web browser.

#### Markdown versions

 - [:clipboard: RMD_maintext](reports/RMD_maintext.Rmd) : All the analyses that can be found in the main text.

 - [:clipboard: RMD_poweranalysis](reports/RMD_poweranalysis.Rmd) : Power analysis to determine the number of replicates for control arenas
 
#### HTML versions

 - [:clipboard: RMD_maintext](reports/RMD_maintext.html) : All the analyses that can be found in the main text.

 - [:clipboard: RMD_poweranalysis](reports/RMD_poweranalysis.html) : Power analysis to determine the number of replicates for control arenas
 


## HOW TO RUN IT?

This research compendium has been developed using the statistical programming language R. To work with the compendium, you will need
installed on your computer the [R software](https://cloud.r-project.org/)
itself and optionally [RStudio Desktop](https://rstudio.com/products/rstudio/download/).

You can download the compendium by cloning this [repository](https://github.com/olazlaure/PhosphorusPreference2022.git):
  
  - open the `.Rproj` file in RStudio

  - open scripts `.Rmd` in reports folder and run it to produce all the analyses and associated reports.
  
  - launch the [`README.html`](README.html) to be able to explore the contents on your web browser


