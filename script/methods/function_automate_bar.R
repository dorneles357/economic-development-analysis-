# map function plot  ------------------------------------------------------
plot.bar.function <- function(data, variable, name){

  ggplot(data) +
    geom_bar(aes(x = variable, y = territorialidades), stat = 'identity') +
    labs(x = name, y = "County")
  
}


# exemple  ----------------------------------------------------------------

plot.bar.function(data = #x1,
                     variable = #x1$densidade_demografica0,
                     name = #"densidade demográfica (2010)"
                     )
# description -------------------------------------------------------------
#
#
#
#
#
#
#
#
#