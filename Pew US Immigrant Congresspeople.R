library(tidyverse)
library(lemon)

dat <- read_csv("/Users/Joe/Documents/Pew US Immigrant Congresspeople/Pew US Immigrant Congresspeople.csv")

g <- ggplot(data = dat,
            aes(x = factor(Country), fill = Status, color = Status))

gg <- g + geom_dotplot(method = "histodot",
                 stackgroups = TRUE,
                 binwidth = 1) +
  facet_grid(~Region,
             scales = "free_x",
             space = "free_x",
             switch = "x",
             labeller = labeller(Region = label_wrap_gen(1))) +
  scale_y_continuous(NULL, breaks = NULL) +
  theme_minimal() +
  theme(panel.grid=element_blank(),
        axis.text.x=element_text(angle = -45, hjust = 0),
        axis.title=element_blank(),
        legend.title = element_blank(),
        strip.placement = "outside")

reposition_legend(gg, "top left", panel = "panel-3-1")
