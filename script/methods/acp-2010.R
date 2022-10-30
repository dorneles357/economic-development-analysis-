# ACP ---------------------------------------------------------------------
library(readr)
municip <- read_delim("data/data-2010.csv", 
                        delim = ";", escape_double = FALSE, locale = locale(decimal_mark = ","), 
                        trim_ws = TRUE)%>%
  rename(index =`...1`)

data <- select(municip, -code_muni, -index, -x1, -x5, -x6, -x9, -x10, -x18)

data <- data %>% janitor::clean_names()

#data CPA -----------------------------------------------------------
var <- data %>% PCA(scale.unit = T, graph = T, quali.sup = 1, quanti.sup = 12:13)

data_var <- data[2:13] %>% PCA(scale.unit = T, graph = F)

eig.var <- get_eigenvalue(var)

##Scree Plot 
fviz_eig(var)
fviz_eig(var, addlabels = T, xlab = "dimensões", 
         ylab = "Percetual da Variância Explicada", ylim = c(0,70))
#Circulo de correlação 
fviz_pca_var(var,
             col.var = "black",
             repel = T,
             title = "Circulo de Correlação")

#qualidade da representação
corrplot::corrplot(var$var$cos2, is.corr = F)
fviz_cos2(var, choice = "var", axes = 2:5, 
          title = "Gráfico de barras para cos2")
fviz_pca_var(var, 
             col.var = "cos2", 
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
             repel = T)
#contribuição das variáveis para variância  dos PC 
head(var$var$contrib)
corrplot::corrplot(var$var$contrib, is.corr = F)

#Contribuiçãp para PC1
fviz_contrib(var, choice = "var", axes = 1, top = 18,
             title = "Contribuição das variáveis para a Dim 1")

#Contribuiçãp para PC2
fviz_contrib(var, choice = "var", axes = 2, top = 18,
             title = "Contribuição das variáveis para a Dim 2")

#Contribuiçãp para PC2
fviz_contrib(var, choice = "var", axes = 3, top = 18,
             title = "Contribuição das variáveis para a Dim 3")

#Contribuiçãp para PC2
fviz_contrib(var, choice = "var", axes = 4, top = 18,
             title = "Contribuição das variáveis para a Dim 4")

#Contribuiçãp para PC2
fviz_contrib(var, choice = "var", axes = 5, top = 18,
             title = "Contribuição das variáveis para a Dim 5")

#VAriável com maior significância po PC 
var.desc <- dimdesc(data_var, axes = c(1, 2, 3, 4, 5), proba = 0.05)
print(var.desc)


# exportar dados  ---------------------------------------------------------


write.infile(var, "data/acp/var.csv", sep = ";")

#exportar vaolor dos PC 
write.infile(var$ind$coord, "data/acp/PC.csv", sep = ";")

