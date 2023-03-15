pacman::p_load(tidyverse)
stg <- fs::dir_ls("staging")
cat <- map(stg, ~ arrow::read_parquet(.) |> collect())
names(cat) <- str_extract(stg,"(?<=staging/).*(?=.parquet)")

for (i in 1:length(cat)) { colnames(cat[[i]]) <- toupper(colnames(cat[[i]])) }
ctoxnames <- map(cat,colnames) |> flatten_chr()
colcount <- tibble(colnam=ctoxnames) |>count(colnam,sort=T)

# mutate all columns to character columns and bind tables
hcat <- cat |> map(~ mutate_at(. , .vars = names(.), .funs = as.character))
hcat <- names(hcat) |> map( ~ hcat[[.]] |> mutate(listname = .))
hcat <- dplyr::bind_rows(hcat) 

# write harmonized data to parquet
out <- fs::dir_create("brick") |> fs::path("comptox.parquet")
arrow::write_parquet(hcat, out)