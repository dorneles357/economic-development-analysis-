#código municípios SC
code_muni_sc <- read_excel("data/code/code_muni_sc.xlsx", 
                                   col_types = c("numeric", "text", "text"))%>%
  select(code_muni, territorialidades)
#código municípios AMAUC
code.muni.amauc <- read_csv("data/code/code_muni_amauc.csv")
code_muni_amauc <- array(code.muni.amauc$code_muni)

# Tabelas de observação  --------------------------------------------------

#
tab1 <- read_excel("data/variables/tab1.xlsx", 
                   col_names = FALSE, col_types = c("numeric", 
                                                    "text", "text", "numeric"))%>%
  rename(code_muni = ...1,
         territorialidades = ...2,
         densidade_demografica = ...4)%>%
  select(code_muni, territorialidades, densidade_demografica)
#
tab2 <- read_excel("data/variables/tab2.xlsx", 
                   col_names = FALSE, col_types = c("numeric", 
                                                    "text", "text", "text", "numeric", "text", 
                                                    "text", "text", "text"))%>%
  rename(code_muni = ...1,
         territorialidades = ...2,
         percent_pop_urbana = ...5)%>%
  select(code_muni, territorialidades, percent_pop_urbana)
#
tab3 <- read_excel("data/variables/tab3.xlsx")%>%
  rename(percent_domc_energia_eletrica = `% de pessoas em domicílios com energia elétrica 2010`)%>%
  select(territorialidades, percent_domc_energia_eletrica)
#
tab4 <- read_excel("data/variables/tab4.xlsx")%>%
  rename(perc_domc_abstecimento_agua = `% da população em domicílios com água encanada 2010`)%>%
  select(territorialidades, perc_domc_abstecimento_agua)
#
tab5 <- read_excel("data/variables/tab5.xlsx", 
                   col_names = FALSE,
                   range = "a2050:K10485")%>%
  rename(territorialidades = ...1,
         num_estab_saude = ...3)%>%
  select(territorialidades, num_estab_saude)
#
tab6 <- read_excel("data/variables/tab6.xlsx", 
                   col_names = FALSE,
                   range = "a2050:K10485")%>%
  rename(territorialidades = ...1,
         num_leitos_estab_saude = ...3)%>%
  select(territorialidades, num_leitos_estab_saude)
#
tab7 <- read_excel("data/variables/tab7.xlsx")%>%
  rename(taxa_analfabetismo = `Taxa de analfabetismo - 15 anos ou mais de idade 2010`)%>%
  select(territorialidades, taxa_analfabetismo)
#
tab8 <- read_excel("data/variables/tab8.xlsx")%>%
  rename(pop_economicamente_ativa = `População economicamente ativa de 18 anos ou mais de idade 2010`)%>%
  select(territorialidades, pop_economicamente_ativa)
#
tab9 <- read_excel("data/variables/tab9.xlsx")%>%
  rename(taxa_desocupacao = `Taxa de desocupação - 18 anos ou mais de idade 2010`)%>%
  select(territorialidades, taxa_desocupacao)
#
tab10 <- read_excel("data/variables/tab10.xlsx", 
                    col_names = FALSE,
                    range = "a2050:K10485")%>%
  rename(territorialidades = ...1,
         pib_percapta = ...4)%>%
  select(territorialidades, pib_percapta)
#
tab11 <- read_excel("data/variables/tab11.xlsx", 
                    range = "A4249:C4542", col_types = c("text", "text", 
                                                         "numeric"), col_names = FALSE)%>%
  rename(territorialidades = ...2,
         receitas = ...3)%>%
  select(territorialidades, receitas)

#
tab12 <- tab12 <- read_excel("data/variables/tab12.xlsx", 
                             col_names = FALSE, col_types = c("numeric", 
                                                              "text", "text", "numeric"))%>%
  rename(code_muni = ...1,
    territorialidades = ...2,
    vab_servicos = ...4)%>%
  select(code_muni, territorialidades, vab_servicos)
#
tab13 <- read_excel("data/variables/tab13.xlsx", 
                    col_names = FALSE, col_types = c("numeric", 
                                                     "text", "text", "numeric"))%>%
  rename(code_muni = ...1,
         territorialidades = ...2,
         vab_industria = ...4)%>%
  select(code_muni, territorialidades, vab_industria)
#
tab14 <- read_excel("data/variables/tab14.xlsx", 
                    col_names = FALSE, col_types = c("numeric", 
                                                     "text", "text", "numeric"))%>%
  rename(code_muni = ...1,
         territorialidades = ...2,
         vab_agropecuaria = ...4)%>%
  select(code_muni, territorialidades, vab_agropecuaria)
#
tab15 <- read_excel("data/variables/tab15.xlsx")%>%
  rename(taxa_mortalidade_infantil = `Mortalidade infantil 2010`)%>%
  select(territorialidades, taxa_mortalidade_infantil)
#
tab16 <- read_excel("data/variables/tab16.xlsx")%>%
  rename(idhm = `IDHM 2010`)%>%
  select(territorialidades, idhm)
#
tab17 <- read_excel("data/variables/tab17.xlsx")%>%
  rename(ig = `Índice de Gini 2010`)%>%
  select(territorialidades, ig)
#
tab18 <- read_excel("data/variables/tab18.xlsx")%>%
  rename(perc_coleta_lixo = `% de pessoas em domicílios urbanos com coleta de lixo 2010`)%>%
  select(territorialidades, perc_coleta_lixo )

# filtrar variáveis  ------------------------------------------------------

x1 <- filter(tab1, code_muni %in% code_muni_amauc)

x2 <- filter(tab2, code_muni %in% code_muni_amauc)

x3 <- inner_join(code_muni_sc, tab3, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

x4 <- inner_join(code_muni_sc, tab4, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

x5 <- inner_join(code_muni_sc, tab5, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

x6 <- inner_join(code_muni_sc, tab6, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

x7 <- inner_join(code_muni_sc, tab7, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

x8 <- inner_join(code_muni_sc, tab8, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

x9 <- inner_join(code_muni_sc, tab9, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

x10 <- inner_join(code_muni_sc, tab10, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

x11 <- inner_join(code_muni_sc, tab11, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

x12 <- filter(tab12, code_muni %in% code_muni_amauc)

x13 <- filter(tab13, code_muni %in% code_muni_amauc)

x14 <- filter(tab14, code_muni %in% code_muni_amauc)

x15 <- inner_join(code_muni_sc, tab15, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

x16 <- inner_join(code_muni_sc, tab16, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

x17 <- inner_join(code_muni_sc, tab17, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

x18 <- inner_join(code_muni_sc, tab18, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_amauc)

# join variables in data --------------------------------------------------------------------

data <- inner_join(x1, x2, suffix = c("code_muni", "territorialidades"))%>% 
  inner_join(x3, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x4, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x5, suffix = c("code_muni", "territorialidades"))%>% 
  inner_join(x6, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x7, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x8, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x9, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x10, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x11, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x12, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x13, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x14, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x15, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x16, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x17, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x18, suffix = c("code_muni", "territorialidades"))


# data coutry  ------------------------------------------------------------

country <- read_municipality(code_muni = "SC", year = 2010)

#select contry's of AMAUC
country2 <- filter(country, code_muni %in% code_muni_amauc)


