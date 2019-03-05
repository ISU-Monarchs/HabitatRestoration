## ---- message=FALSE, echo=FALSE------------------------------------------
suppressWarnings(library("tidyverse"))
library(ISUmonarch)

## ----sites, echo=FALSE---------------------------------------------------
sites = c("byd1", "byd2", "cra1", "uth1", "uth2", "uth3")

## ----bee, results='asis', echo=TRUE--------------------------------------
pander::pandoc.table(bee %>%
  filter(siteID %in% sites) %>%
  group_by(`Nectar Plant Species`, round, siteID) %>%
  summarize(count = sum(count)) %>%
    head(.))

## ----bee_avg_wrong, results='asis', echo=TRUE----------------------------
pander::pandoc.table(bee %>%
  filter(siteID %in% sites) %>%
  group_by(`Nectar Plant Species`, round, siteID) %>%
  summarize(count = sum(count)) %>%
  group_by(`Nectar Plant Species`, siteID) %>%
  summarize(mean_count = mean(count)) %>%
    head(.))

## ----bee_zeros, results='asis', echo=TRUE--------------------------------
pander::pandoc.table(bee %>%
  mutate(round = as.factor(round)) %>%
  filter(siteID %in% sites) %>%
  group_by(`Nectar Plant Species`, round, siteID) %>%
  summarize(count = sum(count)) %>%
  complete(`Nectar Plant Species`, siteID, round, fill = list(count = 0)) %>%
  group_by(`Nectar Plant Species`, siteID) %>%
  summarize(mean_count = mean(count)) %>%
    head(.))

