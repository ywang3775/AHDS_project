
library(tidyverse)
library(tidytext)

data <- read_tsv("clean/processed_titles.tsv")

data("stop_words")

processed_data <- data %>%
  unnest_tokens(word, Title) %>%
  anti_join(stop_words, by = "word") %>%
  mutate(word = str_remove_all(word, "[^a-zA-Z]")) %>%
  mutate(word = SnowballC::wordStem(word)) %>%
  group_by(PMID, Year) %>%
  summarise(Processed_Title = paste(word, collapse = " ")) %>%
  ungroup()

write_tsv(processed_data, "clean/processed_tidy_titles.tsv")