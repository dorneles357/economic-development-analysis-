#código municípios SC
code_muni_sc <- read_excel("data/code/code_muni_sc.xlsx", 
                           col_types = c("numeric", "text", "text"))%>%
  select(code_muni, territorialidades)
#código municípios OESTE SC
code_muni_oeste <- read_excel("data/code/code_muni_oeste.xlsx", 
                              col_types = c("numeric", "text", "text"))
code_muni_oeste <- array(code_muni_oeste$code_muni)

# Tabelas de observação  --------------------------------------------------

x3_x4_x7 <- read_excel("data/variables/2000/x3-x4-x7.xlsx", 
                   col_types = c("text", "text", "numeric", 
                                 "numeric", "numeric"))%>%
  rename(territorialidades = territorialidades...2, 
         x4 = `% da população em domicílios com água encanada 2000`,
         x3 = `% de pessoas em domicílios com energia elétrica 2000`,
         x7 = `Taxa de analfabetismo - 15 anos ou mais de idade 2000`,)

x12_x13_x14 <- read_excel("data/variables/2000/x12-x13-x14.xlsx", 
                          col_names = FALSE, col_types = c("text", 
                                                           "text", "text", "numeric", "numeric", 
                                                           "numeric"))%>%
  rename(code_muni = ...1,
         territorialidades = ...2, 
         x14 = ...4,
         x13 = ...5,
         x12 = ...6,)

x15_x8_x9 <- read_excel("data/variables/2000/x15-x8-x9.xlsx",
                        col_names = FALSE,
                        col_types = c("text", "text", "numeric", 
                                      "numeric", "numeric"))%>%
  rename(territorialidades = ...2, 
         x9 = ...3,
         x15 = ...4,
         x8 = ...5,
         )


# tabelas para analise ----------------------------------------------------

tab1 <- NULL

tab2 <- read_excel("data/variables/2000/x2.xlsx", 
                   sheet = "Tabela", col_types = c("text", 
                                                   "text", "numeric"))%>%
  rename(territorialidades = ...2,
         x2 = ...3)%>%
  select(territorialidades, x2)

tab3 <- select(x3_x4_x7, territorialidades, x3)
  
tab4 <- select(x3_x4_x7, territorialidades, x4)
  
tab5 <- read_excel("data/variables/2000/x5.xlsx", 
                   sheet = "TAB05MUN", range = "f4343:g4636", 
                   col_names = FALSE, col_types = c("text", 
                                                    "numeric"))%>%
  rename(territorialidades = ...1,
         x5 = ...2,
         )%>%
  select(territorialidades, x5)

tab6 <- read_excel("data/variables/2000/x6.xlsx", 
                   range = "f4343:g4636", col_names = FALSE, 
                   col_types = c("text", "numeric"))%>%
  rename(territorialidades = ...1,
         x6 = ...2,
  )%>%
  select(territorialidades, x6)

tab7 <- select(x3_x4_x7, territorialidades, x7)

tab8 <- select(x15_x8_x9, territorialidades, x8)

tab9 <- select(x15_x8_x9, territorialidades, x9) 

tab10 <- NULL

tab11 <- read_excel("data/variables/2000/x11.xlsx", 
                    range = "a4310:c4602", col_types = c("text", 
                                                         "text", "numeric"))%>%
  rename(territorialidades = `abdon batista...1`,
         x11 = `8168672.37258812`,
         )%>%
  select(territorialidades, x11)

tab12 <- select(x12_x13_x14, territorialidades, x12)

tab13 <- select(x12_x13_x14, territorialidades, x13)

tab14 <- select(x12_x13_x14, territorialidades, x14)

tab15 <- select(x15_x8_x9, territorialidades, x15)

tab16 <- read_excel("data/variables/2000/x16.xlsx", 
                    col_types = c("text", "text", "numeric"))%>%
  rename(territorialidades = territorialidades...2,
         x16 = `IDHM 2000`,
         )%>%
  select(territorialidades, x16)

tab17 <- read_excel("data/variables/2000/x17.xlsx", 
                    col_types = c("text", "text", "numeric"))%>%
  rename(territorialidades = territorialidades...2, 
         x17 = `Índice de Gini 2000`,
         )%>%
  select(territorialidades, x17)

tab18 <- read_excel("data/variables/2000/x18.xlsx", 
                    col_types = c("text", "text", "numeric"))%>%
  rename(territorialidades = territorialidades...2, 
         x18 = `% de pessoas em domicílios urbanos com coleta de lixo 2000`,
  )%>%
  select(territorialidades, x18)

# filtrar variáveis  ------------------------------------------------------

x1 <- NULL

x2 <- inner_join(code_muni_sc, tab2, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x3 <- inner_join(code_muni_sc, tab3, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x4 <- inner_join(code_muni_sc, tab4, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x5 <- inner_join(code_muni_sc, tab5, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x6 <- inner_join(code_muni_sc, tab6, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x7 <- inner_join(code_muni_sc, tab7, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x8 <- inner_join(code_muni_sc, tab8, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x9<- inner_join(code_muni_sc, tab9, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x10 <- NULL

x11 <- inner_join(code_muni_sc, tab11, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x12 <- inner_join(code_muni_sc, tab12, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x13 <- inner_join(code_muni_sc, tab13, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x14 <- inner_join(code_muni_sc, tab14, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x15 <- inner_join(code_muni_sc, tab15, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x16 <- inner_join(code_muni_sc, tab16, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x17 <- inner_join(code_muni_sc, tab17, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

x18 <- inner_join(code_muni_sc, tab18, by = 'territorialidades')%>%
  filter(code_muni %in% code_muni_oeste)

# join variables in data --------------------------------------------------------------------
#@to-do: add variables x1 and x10 

data <- inner_join(x2, x3, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x4, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x5, suffix = c("code_muni", "territorialidades"))%>% 
  inner_join(x6, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x7, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x8, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x9, suffix = c("code_muni", "territorialidades"))%>%
  #inner_join(x10, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x11, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x12, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x13, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x14, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x15, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x16, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x17, suffix = c("code_muni", "territorialidades"))%>%
  inner_join(x18, suffix = c("code_muni", "territorialidades"))

#data -----------------------------------------------------------

write.csv2(data, file = "/home/rstudio/workspace/data/data-2000.csv")
