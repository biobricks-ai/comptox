library(arrow)

# see https://clowder.edap-cluster.com/datasets/61147fefe4b0856fdc65639b#folderId=61148181e4b0856fdc65643f&page=0

# Define the FTP base address --> access 11-17-2022
stage = fs::dir_create("staging") |> fs::path("dsstox_identifiers.csv")
urllink="https://clowder.edap-cluster.com/files/616dd943e4b0a5ca8aeea69d/blob"
download.file(urllink, destfile = stage, mode = "wb")

out = fs::dir_create("brick") |> fs::path("dsstox_identifiers.parquet")
df = arrow::read_csv_arrow("staging/dsstox_identifiers.csv")
arrow::write_parquet(df, out)

# clean up
fs::dir_delete("staging")