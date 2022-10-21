# CompTox Chemicals Dashboard 

<a href="https://github.com/biobricks-ai/comptox/actions"><img src="https://github.com/biobricks-ai/comptox/actions/workflows/bricktools-check.yaml/badge.svg?branch=main"/></a>

## Description
> The CompTox Chemicals Dashboard is a part of a suite of databases and web applications developed by the US Environmental Protection Agency's Chemical Safety for Sustainability Research Program. These databases and apps support EPA's computational toxicology research efforts to develop innovative methods to change how chemicals are currently evaluated for potential health risks. EPA researchers integrate advances in biology, biotechnology, chemistry, and computer science to identify important biological processes that may be disrupted by the chemicals. The combined information helps prioritize chemicals based on potential health risks. Using computational toxicology research methods, thousands of chemicals can be evaluated for potential risk at small cost in a very short amount of time.


## Dataset availale at https://comptox.epa.gov/dashboard/downloads
> DSSTox identifiers mapped to CAS Numbers and Names File
https://clowder.edap-cluster.com/api/files/616dd943e4b0a5ca8aeea69d/blob

> PHYSPROP Analysis File
https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/PHYSPROP_Analysis/PHYSPROP_Analysis.zip

> DSSTox Mapping File
https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/DSSTox_Mapping_20160701.zip

> Tandem Mass Spectrometry Fragment Summary File
https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/MassBank_FRAGMENT%20FILE.zip

> DSSTox Synonyms File
https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/2018/April/DSSTox_synonyms_SDF_File_20180327.zip

> INVITRODB_Mapping
https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/Invitrodb_v2_to_v3_aenm_mapping_4Mar2019.xlsx

> DSSTox MS Ready Mapping File
https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/2019/April/DSSToxMS-Ready.xlsx

> DSSTox Identifier to PubChem Identifier Mapping File
https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/PubChem_DTXSID_mapping_file.txt

> DSSTox SDF File
https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/DSSTox_v2000_full.zip

> CPCATARCHIVE
https://gaftp.epa.gov/comptox/Sustainable_Chemistry_Data/Chemistry_Dashboard/CPCat.zip

> CPDATdownload
https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/CPDat/CPDat2020-12-16

> MetFrag
https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/MetFrag_metadata_files/CompTox_17March2019_SelectMetaData.csv

> Supplemental data files and software for the Androgen receptor model from Kleinstreuer et al.


> CCSData
https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/2018/September/dsstox_liteccs.zip



> ToxCast Data: Downloadable Data

> in vitro DB
Need to integrade invitrodb 3.3 ===> level 5 only?




## Usage
```{R}
biobricks::brick_install("comptox")
biobricks::brick_pull("comptox")
biobricks::brick_load("comptox")
```
