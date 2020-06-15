
library(dplyr)
library(nycflights13)
library(ggplot2)

source("spark_connect.R")

flights <- copy_to(sc, flights, "flights")
airlines <- copy_to(sc, airlines, "airlines")
src_tbls(sc)

select(flights, year:day, arr_delay, dep_delay)
filter(flights, dep_delay > 1000)
arrange(flights, desc(dep_delay))

iris_tbl <- copy_to(sc, iris, "iris", overwrite = TRUE)
rf_model <- iris_tbl %>%
  ml_random_forest(Species ~ Petal_Length + Petal_Width, type = "classification")
rf_predict <- ml_predict(rf_model, iris_tbl) %>%
  ft_string_indexer("Species", "Species_idx") %>%
  collect

table(rf_predict$Species_idx, rf_predict$prediction)
