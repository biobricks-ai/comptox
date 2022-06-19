library(purrr)
library(vroom)
library(arrow)
library(stringr)

outdir <- fs::dir_create("data")

save_parquet <- function(file) {
  path <- fs::path_ext_remove(file) |> fs::path_ext_set("parquet") |> fs::path_file()
  df   <- vroom::vroom(file,delim=",")
  arrow::write_parquet(df,fs::path(outdir,path))
}

# WRITE OUTS ================================================================================
fs::dir_ls(outdir) 
fs::dir_ls("download/",regexp="*.csv") |> walk(save_parquet)
file.copy("download/DB_release_README_LEVEL5.pdf", "data/DB_release_README_LEVEL5.pdf")

