
# load data  --------------------------------------------------------------

library(readr)
data <- read_delim("data/cpa-amauc.csv", 
                        delim = ";", escape_double = FALSE, locale = locale(decimal_mark = ","), 
                        trim_ws = TRUE)
fa_amauc <- select(data, -code_muni, -territorialidades)
fa_amauc <- fa_amauc %>% janitor::clean_names()


# analysis ----------------------------------------------------------------

fa <- fa(fa_amauc, nfactors = 5, rotate = "varimax", scores = "regression")



