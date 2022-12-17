#código municípios OESTE SC
code_muni_oeste <- read_excel("data/code/code_muni_oeste.xlsx",
                              col_types = c("numeric", "text", "text"))
code_muni_oeste <- array(code_muni_oeste$code_muni)

#load dataset
data_2000 <- read_delim(
  "data/dataset/data-2000.csv",
  delim = ";",
  col_types = cols(x10 = col_number(),
                   x11 = col_number()),
  locale = locale(decimal_mark = ",",
                  grouping_mark = "."),
  trim_ws = TRUE
) %>%
  select(-`...1`)

data_2010 <- read_delim(
  "data/dataset/data-2010.csv",
  delim = ";",
  col_types = cols(x10 = col_number(),
                   x11 = col_number()),
  locale = locale(decimal_mark = ",",
                  grouping_mark = "."),
  trim_ws = TRUE
  )%>%
  select(-`...1`)

#filtar pop
pop_sc_2000 <- read_csv("data/population/pop-sc.csv",
  col_types = cols(code_muni = col_number())) %>%
  filter(code_muni %in% code_muni_oeste)%>%
  inner_join(data_2000, by = 'code_muni')%>%
  select(code_muni, `2000`, x11, x12, x13, x14) 

pop_sc_2010 <- read_csv("data/population/pop-sc.csv",
  col_types = cols(code_muni = col_number())) %>%
  filter(code_muni %in% code_muni_oeste)%>%
  inner_join(data_2010, by = 'code_muni')%>%
  select(code_muni, `2010`, x11, x12, x13, x14) 

norm_2000 <- tibble(
  pop_sc_2000$code_muni,
  pop_sc_2000$x11 / pop_sc_2000$`2000`, 
  pop_sc_2000$x12 / pop_sc_2000$`2000`, 
  pop_sc_2000$x13 / pop_sc_2000$`2000`, 
  pop_sc_2000$x14 / pop_sc_2000$`2000`,
  .name_repair = ~ c('code_muni', 'x11/pop', 'x12/pop', 'x13/pop', 'x14/pop')
)

norm_2010 <- tibble(
  pop_sc_2010$code_muni,
  pop_sc_2010$x11 / pop_sc_2010$`2010`, 
  pop_sc_2010$x12 / pop_sc_2010$`2010`, 
  pop_sc_2010$x13 / pop_sc_2010$`2010`, 
  pop_sc_2010$x14 / pop_sc_2010$`2010`,
  .name_repair = ~ c('code_muni', 'x11/pop', 'x12/pop', 'x13/pop', 'x14/pop')
)

dataset_2000 <- select(data_2000, -x11, -x12, -x13, -x14)%>%
  inner_join(norm_2000, by = 'code_muni')

dataset_2010 <- select(data_2010, -x11, -x12, -x13, -x14)%>%
  inner_join(norm_2010, by = 'code_muni')

write.csv2(dataset_2000, file = "/home/rstudio/workspace/data/norm-dataset/data-2000.csv")
write.csv2(dataset_2010, file = "/home/rstudio/workspace/data/norm-dataset/data-2010.csv")
