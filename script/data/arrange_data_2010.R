#código municípios SC
code_muni_sc <- read_excel("data/code/code_muni_sc.xlsx", 
                                   col_types = c("numeric", "text", "text"))%>%
  select(code_muni, territorialidades)
#código municípios AMAUC
code.muni.amauc <- read_csv("data/code/code_muni_amauc.csv")
code_muni_amauc <- array(code.muni.amauc$code_muni)

# Tabelas de observação  --------------------------------------------------

#
tab1 <- read_excel("data/variables/2010/tab1.xlsx", 
                   col_names = FALSE, col_types = c("numeric", 
                                                    "text", "text", "numeric"))%>%
  rename(code_muni = ...1,
         territorialidades = ...2,
         x1 = ...4)%>%
  select(code_muni, territorialidades, x1)
#
tab2 <- read_excel("data/variables/2010/tab2.xlsx", 
                   col_names = FALSE, col_types = c("numeric", 
                                                    "text", "text", "text", "numeric", "text", 
                                                    "text", "text", "text"))%>%
  rename(code_muni = ...1,
         territorialidades = ...2,
         x2 = ...5)%>%
  select(code_muni, territorialidades, x2)
#
tab3 <- read_excel("data/variables/2010/tab3.xlsx")%>%
  rename(x3 = `% de pessoas em domicílios com energia elétrica 2010`)%>%
  select(territorialidades, x3)
#
tab4 <- read_excel("data/variables/2010/tab4.xlsx")%>%
  rename(x4 = `% da população em domicílios com água encanada 2010`)%>%
  select(territorialidades, x4)
#
tab5 <- read_excel("data/variables/2010/tab5.xlsx", 
                   col_names = FALSE,
                   range = "a2050:K10485")%>%
  rename(territorialidades = ...1,
         x5 = ...3)%>%
  select(territorialidades, x5)
#
tab6 <- read_excel("data/variables/2010/tab6.xlsx", 
                   col_names = FALSE,
                   range = "a2050:K10485")%>%
  rename(territorialidades = ...1,
         x6 = ...3)%>%
  select(territorialidades, x6)
#
tab7 <- read_excel("data/variables/2010/tab7.xlsx")%>%
  rename(x7 = `Taxa de analfabetismo - 15 anos ou mais de idade 2010`)%>%
  select(territorialidades, x7)
#
tab8 <- read_excel("data/variables/2010/tab8.xlsx")%>%
  rename(x8 = `População economicamente ativa de 18 anos ou mais de idade 2010`)%>%
  select(territorialidades, x8)
#
tab9 <- read_excel("data/variables/2010/tab9.xlsx")%>%
  rename(x9 = `Taxa de desocupação - 18 anos ou mais de idade 2010`)%>%
  select(territorialidades, x9)
#
tab10 <- read_excel("data/variables/2010/tab10.xlsx", 
                    col_names = FALSE,
                    range = "a2050:K10485")%>%
  rename(territorialidades = ...1,
         x10 = ...4)%>%
  select(territorialidades, x10)
#
tab11 <- read_excel("data/variables/2010/tab11.xlsx", 
                    range = "A4249:C4542", col_types = c("text", "text", 
                                                         "numeric"), col_names = FALSE)%>%
  rename(territorialidades = ...2,
         x11 = ...3)%>%
  select(territorialidades, x11)

#
tab12 <- tab12 <- read_excel("data/variables/2010/tab12.xlsx", 
                             col_names = FALSE, col_types = c("numeric", 
                                                              "text", "text", "numeric"))%>%
  rename(code_muni = ...1,
    territorialidades = ...2,
    x12 = ...4)%>%
  select(code_muni, territorialidades, x12)
#
tab13 <- read_excel("data/variables/2010/tab13.xlsx", 
                    col_names = FALSE, col_types = c("numeric", 
                                                     "text", "text", "numeric"))%>%
  rename(code_muni = ...1,
         territorialidades = ...2,
         x13 = ...4)%>%
  select(code_muni, territorialidades, x13)
#
tab14 <- read_excel("data/variables/2010/tab14.xlsx", 
                    col_names = FALSE, col_types = c("numeric", 
                                                     "text", "text", "numeric"))%>%
  rename(code_muni = ...1,
         territorialidades = ...2,
         x14 = ...4)%>%
  select(code_muni, territorialidades, x14)
#
tab15 <- read_excel("data/variables/2010/tab15.xlsx")%>%
  rename(x15 = `Mortalidade infantil 2010`)%>%
  select(territorialidades, x15)
#
tab16 <- read_excel("data/variables/2010/tab16.xlsx")%>%
  rename(x16 = `IDHM 2010`)%>%
  select(territorialidades, x16)
#
tab17 <- read_excel("data/variables/2010/tab17.xlsx")%>%
  rename(x17 = `Índice de Gini 2010`)%>%
  select(territorialidades, x17)
#
tab18 <- read_excel("data/variables/2010/tab18.xlsx")%>%
  rename(x18 = `% de pessoas em domicílios urbanos com coleta de lixo 2010`)%>%
  select(territorialidades, x18 )

tab19.32 <- read_excel("data/variables/2010/tab19-32.xlsx")%>%
  select(territorialidades,
         x19, x20, x21, x22,
         x23, x24, x25, x26,
         x27, x28, x29, x30,
         x31, x32)

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

x19.32 <- inner_join(code_muni_sc, tab19.32, by = 'territorialidades')%>%
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
  inner_join(x18, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x19.32, suffix = c("code_muni", "territorialidades"))


# data coutry  ------------------------------------------------------------

country <- read_municipality(code_muni = "SC", year = 2010)

#select contry's of AMAUC
country2 <- filter(country, code_muni %in% code_muni_amauc)


