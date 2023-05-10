import http.client
import json
import pandas as pd
from os import makedirs, path, listdir
import shutil


def run_EPA_API(x_api_key, url):
    """
    Run api with GET method
    return JSON format
    """
    conn = http.client.HTTPSConnection("api-ccte.epa.gov")
    headers = {
        'Accept': "*/*",
        'x-api-key': x_api_key
    }


    # extract the all list of chemicals
    conn.request("GET", url, headers=headers)
    res = conn.getresponse()
    data = res.read()
    data = data.decode('utf-8')
    data_js = json.loads(data)

    return data_js


# MAIN #
########
p_dir_bricks = "./brick/"

# 1. retrieve all list of chemicals
x_api_key = "b6808991-0f5e-4019-9512-ea85d80d54fa"
url_list = "/chemical/list/"

l_d_listChem = run_EPA_API(x_api_key, url_list)

df_list = pd.DataFrame()
for d_listChem in l_d_listChem:
    new_row = pd.DataFrame.from_dict(d_listChem, orient='index', columns=['Value']).T
    df_list = pd.concat([df_list, new_row], ignore_index=True)
df_list.to_parquet(p_dir_bricks + "/chemical_lists.parquet")

# 2. extract chemicals by list and make a dataframe
p_dir_staging = "./staging/"
try:makedirs(p_dir_staging)
except:pass
l_list_chem = df_list["name"]

for list_chem in l_list_chem:
    df_chemical = pd.DataFrame()

    # check if it is existing
    if not path.exists(p_dir_staging + list_chem.replace(" ", "") + ".csv"):
        l_d_chem_bylist = run_EPA_API(x_api_key, "/chemical/list/chemicals/search/by-listname/%s"%(list_chem.replace(" ", "")))
        for d_chem_bylist in l_d_chem_bylist:
            new_row = pd.DataFrame.from_dict(d_chem_bylist, orient='index', columns=['Value']).T
            df_chemical = pd.concat([df_chemical, new_row], ignore_index=True)
        df_chemical.to_csv(p_dir_staging + list_chem.replace(" ", "") + ".csv")

# merge all of the dataset together
df_all_chem = pd.DataFrame()
for dataset in listdir(p_dir_staging):
    df_dataset = pd.read_csv(p_dir_staging + dataset)
    # add col to map on list
    df_dataset["list chemical"] = dataset[:-4]
    df_all_chem = pd.concat([df_all_chem, df_dataset])

df_all_chem.to_parquet(p_dir_bricks + "/chemicals_by_list.parquet")

# delete staging
shutil.rmtree(p_dir_staging)