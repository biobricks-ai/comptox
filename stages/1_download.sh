#!/usr/bin/env bash

# Create folder
localpath=$(pwd)
echo "Local path: $localpath"

downloadpath="$localpath/download"
echo "Download path: $downloadpath"
mkdir -p "$downloadpath"
cd $downloadpath;

# Download file in comptox

## DSSTox identifiers mapped to CAS Numbers and Names File
wget https://clowder.edap-cluster.com/api/files/616dd943e4b0a5ca8aeea69d/blob
mv blob DSSTox_Identifiers_and_CASRN_2021r1.csv

## PHYSPROP Analysis File
wget https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/PHYSPROP_Analysis/PHYSPROP_Analysis.zip

## DSSTox Mapping File
wget https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/DSSTox_Mapping_20160701.zip --no-check-certificate

## Tandem Mass Spectrometry Fragment Summary File
wget https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/MassBank_FRAGMENT%20FILE.zip --no-check-certificate

## DSSTox Synonyms File
wget https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/2018/April/DSSTox_synonyms_SDF_File_20180327.zip --no-check-certificate

## INVITRODB_Mapping
wget https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/Invitrodb_v2_to_v3_aenm_mapping_4Mar2019.xlsx --no-check-certificate

## DSSTox MS Ready Mapping File
wget https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/2019/April/DSSToxMS-Ready.xlsx --no-check-certificate

## DSSTox Identifier to PubChem Identifier Mapping File
wget https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/PubChem_DTXSID_mapping_file.txt --no-check-certificate

## DSSTox SDF File
wget https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/DSSTox_v2000_full.zip --no-check-certificate

## CPCATARCHIVE
wget https://gaftp.epa.gov/comptox/Sustainable_Chemistry_Data/Chemistry_Dashboard/CPCat.zip --no-check-certificate

wget  CPDATdownload
https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/CPDat/CPDat2020-12-16 --no-check-certificate

## MetFrag
wget https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/MetFrag_metadata_files/CompTox_17March2019_SelectMetaData.csv --no-check-certificate

## Supplemental data files and software for the Androgen receptor model from Kleinstreuer et al.


## CCSData
wget https://gaftp.epa.gov/COMPTOX/Sustainable_Chemistry_Data/Chemistry_Dashboard/2018/September/dsstox_liteccs.zip --no-check-certificate


echo "Download done."
