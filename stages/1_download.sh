#!/usr/bin/env bash

# Create folder
localpath=$(pwd)
echo "Local path: $localpath"

downloadpath="$localpath/download"
echo "Download path: $downloadpath"
mkdir -p "$downloadpath"
cd $downloadpath


# list of chemicals
## downloaded from 
### https://comptox.epa.gov/dashboard/chemical-lists
#### save the file at $downloadpath

# check if file exist
echo "Lists of chemicals need to be downloaded at: https://comptox.epa.gov/dashboard/chemical-lists"

#1. check if all of the chemical files are downloaded
if ls $downloadpath/chemical-lists* 1> /dev/null 2>&1; then
    echo "Lists of chemicals files does exist"
else
    echo "Lists of chemicals files does not exist"
    echo "Lists of chemicals need to be downloaded at: https://comptox.epa.gov/dashboard/chemical-lists and put in the download folder"
fi

#2.chek update
p_list_chem=$(ls $downloadpath/chemical-lists*)
echo "File with the list of chemicals on the EPA dashboad: $p_list_chem"

#3. check if folder exist
if [ -d "$downloadpath/list_chemicals" ] 
then
    echo "Directory $downloadpath/list_chemicals exists." 
else
    echo "Error: Directory $downloadpath/list_chemicals does not exists. => create folder"
    mkdir $downloadpath/list_chemicals
fi


cd $localpath
python ./stages/check_listofchemicals.py $p_list_chem $downloadpath/list_chemicals/


#3. check if the all dsstox file exist
if ls $downloadpath/DSSTox_Identifiers* 1> /dev/null 2>&1; then
    echo "Dsstox file with all chemicals does exist"
else
    echo "Dsstox file with all chemicals does not exist"
    
    # Define the FTP base address --> access 11-17-2022
    urllink="https://clowder.edap-cluster.com/files/616dd943e4b0a5ca8aeea69d/blob"

    # Download file
    wget -P $downloadpath $urllink
    mv $downloadpath/blob $downloadpath/DSSTox_Identifiers.csv

fi

echo "Download done."
