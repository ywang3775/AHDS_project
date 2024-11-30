
library(tidyverse)
library(tidytext)

data <- read_tsv("clean/processed_tidy_titles.tsv")

word_data <- data %>%
  unnest_tokens(word, Processed_Title)

word_trends <- word_data %>%
  count(Year, word, sort = TRUE)

top_words <- word_trends %>%
  group_by(word) %>%
  summarise(total_frequency = sum(n)) %>%
  arrange(desc(total_frequency)) %>%
  slice_head(n = 10) %>%
  pull(word)

keyword_trends <- word_trends %>%
  filter(word %in% top_words)

keyword_plot <- keyword_trends %>%
  ggplot(aes(x = Year, y = n, color = word)) +
  geom_line(size = 1) +
  labs(
    title = "Keyword Trends Over Time",
    x = "Year",
    y = "Frequency",
    color = "Keyword"
  )

ggsave("clean/keyword_trends_plot.png", plot = keyword_plot)
