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

# remember this is just to get you familiar with the language and manipulating graphs
library(tidyverse)

# Task 1 ----

# Load data
hgnc <- read_rds("https://raw.githubusercontent.com/DrTim105/r4bioinfo/main/chapter_01_gene_distribution_viz/data/hgnc_processed.rds")

# Inspect data
glimpse(hgnc)
str(hgnc)

# Summary of hgnc stats
# Rows: 44, 906
# Columns: 54
# The rows represent the total number of genes and the columns represent the features of that gene

hgnc$locus_group
unique(hgnc$locus_group)
# this column basically holds the class of the gene either as a protein-coding gene, non-coding RNA gene, pseudogene, or other



# Task 2 ----

?geom_bar
?coord_flip

ggplot(hgnc) +
  geom_bar(aes(x = locus_group)) +
  coord_flip() # i think i prefer the normal orientation tho - what do you think?
# (include link to site or teach geom_bar)

# "Protein-coding gene" is the most common and the least common is "other"


# Task 3 ----

# apply the fill aesthetic
ggplot(hgnc) +
  geom_bar(aes(x = locus_group, fill = locus_group))

# apply the color aesthetic
ggplot(hgnc) +
  geom_bar(aes(x = locus_group, color = locus_group))

# apply the fill and color aesthetic
ggplot(hgnc) +
  geom_bar(aes(x = locus_group, fill = locus_group, color = locus_group))

# apply alpha aesthetic to add some transparency 
plot1 <- ggplot(hgnc) +
  geom_bar(aes(x = locus_group, fill = locus_group, color = locus_group), 
           alpha = 0.5, show.legend = FALSE)

plot1

# Task 4 ----

# filter hgnc so only entries that fall into "protein-coding gene" locus_group 
# category are retained
protein_coding <- filter(hgnc, locus_group == "protein-coding gene")

ggplot(protein_coding) + 
  geom_bar(aes(x = chromosome))

ggplot(hgnc) + 
  geom_bar(aes(x = chromosome)) # the distribution kinda looks diff 

# Answers: chromosome 1 carries the most protein-coding gene
# chromosome Y carries the least protein-coding gene
# chromosome X carries more genes than expected 
# now i cant help but try to check for all genes in general rather than protein coding gene

# now lets apply some aesthetics to it
plot2 <- ggplot(hgnc) + 
  geom_bar(aes(x = chromosome, fill = chromosome, color = chromosome),
           alpha = 0.5, show.legend = FALSE)

plot2

# Task 5 ----
?facet_wrap

selected_chr <- filter(hgnc, chromosome %in% c("1", "7", "17", "X", "Y"))
  
ggplot(selected_chr) +
  geom_bar(aes(x = locus_group)) +
  facet_wrap(~chromosome)

# Chromosome 1, 7 , and 17 have a larger relative proportion of protein-coding
# genes compared to the sex chromosomes 
# Chromosome Y, in particular, has more pseudogenes than protein-coding genes
# https://www.genome.gov/about-genomics/fact-sheets/Y-Chromosome-facts

# Task 6 ----
?theme_classic

# dont forget to map fill to column
p1 <- ggplot(selected_chr) +
  geom_bar(aes(x = locus_group, fill = locus_group)) +
  facet_wrap(~chromosome)

p1 + theme_gray() # the default
p1 + theme_bw()
p1 + theme_linedraw()
p1 + theme_light()
p1 + theme_dark()
p1 + theme_minimal()
p1 + theme_classic()
p1 + theme_void()

plot3 <- p1 + theme_dark()

plot3

?scale_fill_brewer

p1 + scale_fill_brewer(palette = "Dark2")

# i prefer Dark2 but i like theme_dark even better

# Task 7 ----
# you should be familiar if you did this immediatley after r4ds
plot1

plot1 + 
  labs(
    title = "Genes and Locus Group",
    x = "Locus group", y = "Number of genes",
    caption = "Data credit: HGNC."
  )

# check out ggsave first and these parameters help create a proper figure - play with the numbers for each figure
ggsave("/Users/tim/r4bioinfo/chapter_01_gene_distribution_viz/figures/01_gene_biotypes.png", width = 10, height = 6, dpi = 300)


plot2

plot2 + 
  labs(
    title = "Protein-Coding Genes and Chromosomes",
    x = "Chromosomes", y = "Number of protein-coding genes",
    caption = "Data credit: HGNC"
  )

ggsave("/Users/tim/r4bioinfo/chapter_01_gene_distribution_viz/figures/02_protein_coding_per_chromosome.png", width = 12, height = 6, dpi = 300)


plot3

plot3 +
  labs(
    title = "Comparison of Gene Biotypes Among Chromosomes",
    subtitle= "Comparing the distribution of gene biotypes among chromosomes 1, 7, 17, X and Y",
    x = "Gene biotype", y = "Number of genes",
    caption = "Data credit: HGNC"
  )

ggsave("/Users/tim/r4bioinfo/chapter_01_gene_distribution_viz/figures/03_biotype_by_chromosome_faceted.png", width = 14, height = 8, dpi = 300)


# Y chromosomes have long been dismissed as the "graveyeard of genes"

# What biological patterns did you notice across your plots?
# Observation: well the distribution of genes across the chromosomes was pretty
# interesting i'd say - altho i thought the curve would be straight from chromosome 
# 1 to chromosome Y but ofc nature is more messy (spain just won the world cup 2026
# in this very moment!) than that (hopefully it wasnt even a data issue)

# Why might some chromosomes carry more genes than others?
# Observation: why? isnt that a weird question to ask - maybe evolution - more research needed


# Why does chromosome Y look so different from the autosomes
# Observation: cos it has more pseudogenes than protein-coding genes which is
# actually very little relatively

# Which plot told the clearest story, and why?
# Observation: i think for its the last plot - it clearly showed the distribution
# and pointed out to me for the first time just the role of the Y chromosome
# and just how influential it is (while having nothing)


