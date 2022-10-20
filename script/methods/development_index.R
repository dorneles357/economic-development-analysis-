# gross development index -------------------------------------------------

factor_score <- as.matrix(fa$scores[1:14, 1:5])

characteristic_root <- as.matrix(fa$Vaccounted[1, 1:5])


index = (factor_score %*% characteristic_root) /  sum(characteristic_root)


summary(index)
