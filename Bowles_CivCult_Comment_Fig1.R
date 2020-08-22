#' CIVIC CULTURE, STATE CAPACITIES AND WAR: A COMMENT
#' Samuel Bowles
#' Figure by Scott Cohn
#' Original Paper: https://science.sciencemag.org/content/319/5868/1362
#' Data:  https://datadryad.org/stash/dataset/doi:10.5061/dryad.87301

library("tidyverse")

# filepath <- "Desktop"
HTG_df <- read_csv(paste0(filepath, "/HerrmannThoeniGaechterDATA.csv"), skip = 3)

p0 <- HTG_df %>%
  filter(period == 1) %>%
  ggplot(aes(x = senderscontribution)) +
  geom_histogram(aes(y = ..density..), bins = 25, color = "#7293cb", fill = "#7293cb") 

p1 <- p0 + labs(x = "", y = "Density")

p2 <- p1 + theme_bw() +
  theme(panel.grid.minor.x = element_blank(),
        axis.text = element_text(size = 13),
        axis.title = element_text(size = 18),
        strip.text.x = element_text(size = 10),
        strip.background = element_rect(color = "black", fill = "#cbcbcb"))

p2 + facet_wrap(~city) 

ggsave("Bowles_CivCult_Comment_Fig1.pdf", width = 9, height = 7, units = "in")