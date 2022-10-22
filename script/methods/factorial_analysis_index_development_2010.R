
# load data  --------------------------------------------------------------

library(readr)
fa_SC <- read_delim("data/data.csv", 
                      delim = ";", escape_double = FALSE, locale = locale(decimal_mark = ","), 
                      trim_ws = TRUE)%>%
  rename(index =`...1`)%>%
  select(-code_muni, -index)%>%
  janitor::clean_names()

# analysis ----------------------------------------------------------------

fa <- fa(fa_SC[2:19], nfactors = 5, rotate = "varimax", scores = "regression")

#kmo

#burtllet

# gross development index -------------------------------------------------

factor_score <- as.matrix(fa$scores[1:106, 1:5])

characteristic_root <- as.matrix(fa$Vaccounted[1, 1:5])

index = (factor_score %*% characteristic_root) /  sum(characteristic_root)

print(index)

summary(index)



