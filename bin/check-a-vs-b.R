library(readr)
library(tidyverse)
library(magrittr)
library(reshape2)

stripped <- read_csv("~/oeis/afiles/stripped", 
                     col_names = FALSE, comment = "#")
stripped %<>% 
  melt %>%
  arrange(X1,variable)

glimpse(stripped)

