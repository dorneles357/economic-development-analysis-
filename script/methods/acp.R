# ACP ---------------------------------------------------------------------
library(readr)
cpa_amauc <- read_delim("data/cpa-amauc.csv", 
                        delim = ";", escape_double = FALSE, locale = locale(decimal_mark = ","), 
                        trim_ws = TRUE)
data <- rename(cpa_amauc, 
               x1 = densidade_demografica,
               x2 = percent_pop_urbana,
               x3 = percent_domc_energia_eletrica,
               x4 = perc_domc_abstecimento_agua,
               x5 = num_estab_saude,
               x6 = num_leitos_estab_saude,
               x7 = taxa_analfabetismo,
               x8 = pop_economicamente_ativa,
               x9 = taxa_desocupacao,
               x10 = pib_percapta,
               x11 = receitas,
               x12 = vab_servicos,
               x13 = vab_industria,
               x14 = vab_agropecuaria,
               x15 = taxa_mortalidade_infantil,
               x16 = idhm,
               x17 = ig,
               x18 = perc_coleta_lixo) %>%
  select(-code_muni)
data <- data %>% janitor::clean_names()
#data CPA -----------------------------------------------------------
var <- data %>% PCA(scale.unit = T, graph = T, quali.sup = 1, quanti.sup = 17)

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
fviz_cos2(var, choice = "var", axes = 2:3, 
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
#VAriável com maior significância po PC 
var.desc <- dimdesc(var, axes = c(1, 2, 3, 4), proba = 0.05)
print(var.desc)

#Separando grupos 
g1 <- data %>% select(territorialidades, x3, x7, x15)

g2 <- data %>% select(territorialidades, x1, x2, x9, x10, x11, x13)

g3 <- data %>% select(territorialidades, x4, x5, x6, x8, x12, x14, x16, x17, x18)

# exportar dados  ---------------------------------------------------------

write.infile(var, "data/acp/var.csv", sep = ";")

#exportar vaolor dos PC 
write.infile(var$ind$coord, "data/acp/PC.csv", sep = ";")
