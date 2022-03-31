
library(readr)
lakes <- read_csv("data/NZ_lake_chla_data.csv")

aggregate(lakes$ChlA, by = list(Lake = lakes$LakeName), FUN=summary)

lakes %>% 
  group_by(LakeName) %>%
  summarise(Summary = summary(ChlA))


temp <- lakes[lakes$LakeName != "Lake Taupo",]


temp %>% 
  group_by(LakeName) %>%
  summarise(Summary = summary(ChlA))
