# CompTox Chemicals Dashboard 

<a href="https://github.com/biobricks-ai/comptox/actions"><img src="https://github.com/biobricks-ai/comptox/actions/workflows/bricktools-check.yaml/badge.svg?branch=main"/></a>

## Description
> The CompTox Chemicals Dashboard is a part of a suite of databases and web applications developed by the US Environmental Protection Agency's Chemical Safety for Sustainability Research Program. These databases and apps support EPA's computational toxicology research efforts to develop innovative methods to change how chemicals are currently evaluated for potential health risks. EPA researchers integrate advances in biology, biotechnology, chemistry, and computer science to identify important biological processes that may be disrupted by the chemicals. The combined information helps prioritize chemicals based on potential health risks. Using computational toxicology research methods, thousands of chemicals can be evaluated for potential risk at small cost in a very short amount of time.


## Dataset availale at https://comptox.epa.gov/dashboard/downloads
> We included all list of chemicals available at https://comptox.epa.gov/dashboard/chemical-lists 

> We also included the all dsstox avaialbe at  https://epa.figshare.com/articles/dataset/DSSTox_Identifiers_Mapped_to_CAS_Numbers_and_Names_File_11_14_2016/5588566



## Usage
```{R}
biobricks::brick_install("comptox")
biobricks::brick_pull("comptox")
biobricks::brick_load("comptox")
```
