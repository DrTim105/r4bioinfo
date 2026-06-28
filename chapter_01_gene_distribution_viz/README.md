# Chapter 01 — Mapping the Human Gene Landscape

**R4DS Chapter:** [1 — Data Visualization](https://r4ds.hadley.nz/data-visualize.html)  
**Core R Skill:** ggplot2 basics  
**Genomics Topic:** Gene distribution across chromosomes  
**Data Source:** HGNC  

---

## Prerequisites

Complete Chapter 1 of R for Data Science before attempting this
challenge. Work through all examples and exercises in that chapter first.

Install required packages if you have not already:

```r
install.packages(c("tidyverse", "ggrepel", "patchwork"))
```

---

## Biological Context

The human genome contains approximately 20,000 protein-coding genes
distributed across 23 pairs of chromosomes. This distribution is not
random — chromosome 1 is the longest and the most gene-dense;
the Y chromosome is the smallest and carries the fewest genes.

This uneven distribution matters clinically. A chromosome that carries
many genes is statistically more likely to be involved when something
goes wrong — deletions, duplications, and rearrangements on gene-dense
chromosomes tend to have more severe consequences than the same events
on gene-sparse ones.

Visualising gene distribution is often the very first step in a
genomic analysis. Before any statistics, before any modelling, you
look at the shape of the data. A simple plot of gene counts per
chromosome tells you immediately whether your dataset is complete,
whether any chromosome is over- or under-represented, and whether
what you see matches known biology.

---

## Data

See `data/README.md` for the download source and import command.

---

## The Challenge

### Task 1 — Load and explore the dataset

Load the HGNC dataset using `read_tsv()`. How many genes are in the
dataset? How many columns? Use `glimpse()` to explore the structure
and write a comment in your script summarising what each row represents.

### Task 2 — Protein-coding genes per chromosome

Create a bar chart showing the number of protein-coding genes per
chromosome.

- Filter the `locus_group` column to keep only `"protein-coding gene"`
  entries
- Chromosomes must be ordered biologically (1, 2, 3 … 22, X, Y, MT),
  not alphabetically — a chromosome ordered alphabetically puts 10
  before 2, which is meaningless biologically
- Which chromosome has the most protein-coding genes?
- Which has the fewest (excluding MT)?

### Task 3 — All gene biotypes

Create a second bar chart showing the distribution of all gene biotypes
using the `locus_group` column.

- Which biotype is most common? Which is least common?
- Use `coord_flip()` if the category labels overlap on the x-axis

### Task 4 — Faceted biotype breakdown

Create a faceted plot using `facet_wrap()` that shows the biotype
distribution separately for chromosomes 1, 7, 17, X, and Y.

- Filter to just those five chromosomes before plotting
- What differences do you notice between the autosomes (1, 7, 17)
  and the sex chromosomes (X, Y)?
- Does chromosome Y look like you would expect? Why or why not?

### Task 5 — Polish and export

Polish all three plots:

- Add clear, descriptive titles and axis labels using `labs()`
- Apply `theme_minimal()` or `theme_classic()`
- Export each plot using `ggsave()` at 300 DPI into the `figures/`
  folder

```r
ggsave("figures/01_protein_coding_per_chromosome.png",
       width = 12, height = 6, dpi = 300)
```

### Task 6 — Interpret your results

Write a 3–5 sentence interpretation as a comment block at the end of
your script. Address these questions:

- What biological patterns did you observe?
- Why might some chromosomes carry more genes than others?
- Why might the X chromosome look different from the autosomes?

---

## Think About It

> Bar charts work well for comparing counts across categories — but
> they show nothing about chromosome *length*. Chromosome 1 has the
> most genes, but is that simply because it is the longest? How would
> you test that? What additional data would you need, and what kind of
> plot would reveal the relationship between chromosome length and gene
> count?

> The `locus_group` column groups genes into broad categories. What
> would happen if you used `locus_type` instead — a finer-grained
> classification? Try it. Does the picture change? What does this tell
> you about the difference between exploring data at different levels
> of resolution?

---

## Learning Objectives

By completing this challenge you will be able to:

- Load a real-world TSV file with `read_tsv()`
- Explore a new dataset with `glimpse()` and `count()`
- Filter rows with `filter()`
- Reorder a categorical axis for biological (not alphabetical) ordering
- Build a complete, labelled ggplot2 bar chart
- Use `coord_flip()` for readability
- Create faceted plots with `facet_wrap()`
- Export publication-quality figures with `ggsave()`

---

## Hints

Stuck? Check [`HINTS.md`](../HINTS.md) at the root of the repository.
Try to spend at least 15 minutes on a problem before reading a hint.

---

## Commit your work

When your analysis is complete:

```
[ch01] solve: initial ggplot2 analysis
```