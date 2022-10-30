

# load data  --------------------------------------------------------------
fa_SC <- read_delim(
  "data/data-2000.csv",
  delim = ";",
  escape_double = FALSE,
  locale = locale(decimal_mark = ","),
  trim_ws = TRUE
) %>%
  rename(index = `...1`) %>%
  select(-code_muni,-index,-x5,-x6,-x9,-x18) %>%
  janitor::clean_names()

# analysis ----------------------------------------------------------------

fa <-
  fa(fa_SC[2:13],
     nfactors = 3,
     rotate = "varimax",
     scores = "regression")

fa <- na.omit(fa)

#kmo

#burtllet

# gross development index -------------------------------------------------

factor_score <- as.matrix(fa$scores[1:106, 1:3])

characteristic_root <- as.matrix(fa$Vaccounted[1, 1:3])

index <-
  (factor_score %*% characteristic_root) /  sum(characteristic_root)

print(index)

summary(index)

boxplot(index)
