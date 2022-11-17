import subprocess
from os import listdir
import pandas as pd
import datetime
import sys

## MAIN ##
##########
p_list_chem = sys.argv[1]
p_dir_list_chem = sys.argv[2]


df_list_chem = pd.read_csv(p_list_chem)

l_list_chem_file = listdir(p_dir_list_chem)
l_list_chem = [list_chem.split("-")[0].split(" ")[-1] for list_chem in l_list_chem_file]


for i_row, row in df_list_chem.iterrows():
    name_list = row["List Acronym"]
    l_date_update = row["Updated"].split("-")
    update = datetime.datetime(int(l_date_update[0]), int(l_date_update[1]), int(l_date_update[2])) 

    # look if new list
    if not name_list in l_list_chem:
        print("List missing - download at https://comptox.epa.gov/dashboard/chemical-lists/%s"%(name_list))
        # open page automatically - uncomment
        #subprocess.Popen('start chrome /new-tab https://comptox.epa.gov/dashboard/chemical-lists/' + name_list, shell=True)
    
    # check the update
    else:
        file_chem_list = l_list_chem_file[l_list_chem.index(name_list)]
        curent_version = file_chem_list[:-4].split("-")[-3:]
        curent_version = datetime.datetime(int(curent_version[0]), int(curent_version[1]), int(curent_version[2])) 
        # check time
        if curent_version < update:
            print("List missing in latest version - download at https://comptox.epa.gov/dashboard/chemical-lists/%s"%(name_list))
            # open page automatically - uncomment
            #subprocess.Popen('start chrome /new-tab https://comptox.epa.gov/dashboard/chemical-lists/' + name_list, shell=True)