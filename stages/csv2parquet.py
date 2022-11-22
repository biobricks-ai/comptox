
import pandas as pd
import sys
import pyarrow as pyarrow
import fastparquet as fastparquet
from os import path, listdir, mkdir
import shutil
from re import search

InDirName = sys.argv[1]
OutDirName = sys.argv[2]

#create folder -> parquet split in 1 Gb
try:
    mkdir(OutDirName)
except:
    shutil.rmtree(OutDirName)
    mkdir(OutDirName)

# navigate in folder and retieve only table of interest
l_files_download = listdir(InDirName)
for file_download in l_files_download:
    if path.isdir("%s/%s/"%(InDirName, file_download)):
        l_files_sub = listdir("%s/%s"%(InDirName, file_download))
        for file_sub in l_files_sub:
            df = pd.read_csv("%s/%s/%s"%(InDirName, file_download, file_sub), low_memory=False, error_bad_lines=False)
            df['DTXSID'] = df['DTXSID'].str.replace('https://comptox.epa.gov/dashboard/chemical/details/','')
            df.to_parquet("%s/%s.parquet"%(OutDirName, file_sub.split(" ")[-1].split("-")[0]))
    else:
        if file_download == "DSSTox_Identifiers.csv":
            df = pd.read_csv("%s/%s"%(InDirName, file_download), low_memory=False, error_bad_lines=False)
            df.to_parquet("%s/DSSTOX.parquet"%(OutDirName))
        elif search("chemical-lists", file_download):
            df = pd.read_csv("%s/%s"%(InDirName, file_download), low_memory=False, error_bad_lines=False)
            df.to_parquet("%s/list_chem.parquet"%(OutDirName))
