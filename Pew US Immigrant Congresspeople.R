#install.packages("tidyverse")
library(tidyverse)

# no need to change, as data are imported directly from github
dat <- read_csv("https://github.com/mymil/PewUSImmigrantCongresspeople/raw/master/Pew%20US%20Immigrant%20Congresspeople.csv")

g <- ggplot(data = dat,
            aes(x = factor(Country), fill = Status, color = Status))

g + geom_dotplot(method = "histodot",
                 stackgroups = TRUE, # TRUE to prevent data from overlapping rather than stacking 
                 binwidth = 1) +
  facet_grid(~Region,
             scales = "free_x", # frees x-axes to exclude "missing" countries
             space = "free_x",
             switch = "x",
             labeller = labeller(Region = label_wrap_gen(1))) + # text wrapping needed for wide labels
  labs(title = "Birthplace or parentage of immigrants and children of immigrants in 116th Congress,\nby country and world region",
       caption = "Re-visualization of data from https://pewrsr.ch/2xi6fpS\nSource: Pew Research Center") +
  scale_y_continuous(NULL, breaks = NULL) +
  theme_minimal() +
  theme(panel.grid=element_blank(),
        plot.title = element_text(size = 10),
        plot.caption = element_text(hjust = 0),
        axis.text.x=element_text(angle = -45, hjust = 0),
        axis.title=element_blank(),
        legend.title = element_blank(),
        strip.text.x = element_text(size = 7.2, hjust = .5, vjust = 1),
        strip.placement = "outside")
