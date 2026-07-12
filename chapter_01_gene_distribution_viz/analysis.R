# ── File Header ────────────────────────────────────────────────────
# Chapter:      01 — Data Visualization
# Project:      chapter_01_gene_distribution_viz
# R4DS URL:     https://r4ds.hadley.nz/data-visualize.html
# Dataset:      HGNC Complete Gene Set
# Author:       DrTim105
# Date:         2026-06-28
# Description:  Visualise gene distribution across human chromosomes
#               using ggplot2, applied to the HGNC gene dataset.
# ──────────────────────────────────────────────────────────────────

library(tidyverse)

# Task 1 ----
hgnc <- read_tsv("/Users/tim/r4bioinfo/chapter_01_gene_distribution_viz/data/hgnc_complete_set.txt")

problems(hgnc)
glimpse(hgnc)
str(hgnc)
# Summary of hgnc stats
# Rows: 44, 997
# Columns: 54
# The rows represent the total number of genes and the columns represent the features of that gene

# Task 2 ----

hgnc$location

hgnc_pcg <- filter(hgnc, locus_group == "protein-coding gene")

# Extract only the first digits at the beginning of the string or the characters X or Y
chr <- str_extract(hgnc_pcg$location, "^[0-9XY]+")
str(chr)


# Create a new column in the dataframe that includes the values of chr
hgnc_pcg$chromosome <- chr
glimpse(hgnc_pcg)

# Number of entries with no chromosome included
n_na <- sum(is.na(hgnc_pcg$chromosome))
n_na

 
ggplot(hgnc) +
  geom_bar(aes(x = chromosome))



