install.packages("gapminder")
library(gapminder)
str(gapminder)


# https://cran.r-project.org/web/packages/gapminder/README.html

gapminder_df <- gapminder

write.csv(gapminder_df, "gapminder_data_2010.csv")
