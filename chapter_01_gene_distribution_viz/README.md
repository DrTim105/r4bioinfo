# Chapter 01 — Mapping the Human Gene Landscape

**R4DS Chapter:** [1 — Data Visualization](https://r4ds.hadley.nz/data-visualize.html)  
**Core R Skill:** ggplot2 basics  
**Genomics Topic:** Gene distribution across chromosomes  
**Data Source:** HGNC  

---

## Prerequisites

Complete **Chapter 1 of R for Data Science** and work through all its
examples and exercises before attempting this challenge.

Install required packages if you have not already:

```r
install.packages(c("tidyverse", "ggrepel", "patchwork"))
```

---

## Biological Context

The human genome contains roughly 20,000 protein-coding genes — but
that's only one category among the 45,000+ entries in the official
human gene registry. Alongside them sit thousands of non-coding RNAs,
pseudogenes, and other functional elements that don't produce proteins
but still matter enormously in how genes are regulated.

The body responsible for naming all of these is the **HGNC** — the
Human Gene Nomenclature Committee. Every gene symbol you've ever seen
in a paper or a database was approved by them.

Genes aren't spread evenly across our 23 pairs of chromosomes.
Chromosome 1 is the longest and carries the most genes. The Y
chromosome is tiny and carries very few. The X chromosome behaves
strangely — it carries plenty of genes, but because females have two
copies and males have one, one copy is silenced in every female cell.
You're about to see all of this show up directly in a plot you build
yourself.

---

## Data

Load the dataset directly — no download or setup required:

```r
library(tidyverse)
hgnc <- read_rds("data/hgnc_processed.rds")
```

See `data/README.md` if you're curious how this file was prepared.

---

## The Challenge

### Task 1 — Load and look around

Load the data and use `glimpse()` to explore its structure.

- How many rows are there? What does one row represent?
- Use `count()` on the `locus_group` column. How many different gene
  biotypes exist?
- Write a short comment at the top of your script describing what
  you found.

---

### Task 2 — Your first plot: gene biotypes

Build a bar chart showing how many genes fall into each `locus_group`
category. If you're unsure where to start, look up `geom_bar()` in
R's help system (`?geom_bar`) — it counts rows for you automatically,
so you don't need to calculate anything first.

- Which biotype is most common? Which is least common?
- The category labels overlap and are hard to read. Look up
  `coord_flip()` and add it to your plot to fix this.

---

### Task 3 — Play with aesthetics

This is the fun part of Chapter 1 — the same data, mapped differently,
tells a different visual story. Take your Task 2 plot and experiment:

- Map the `locus_group` variable to the `fill` aesthetic as well as
  `x`. What changes?
- Try mapping it to `colour` instead of `fill`. For bars, what's the
  difference between the two?
- Your plot now has a legend that repeats information already on the
  axis. Look up the `show.legend` argument of `geom_bar()` and use it
  to remove the legend.

---

### Task 4 — Protein-coding genes per chromosome

Now focus on just the protein-coding genes. Filter the data using the
line below — you'll learn exactly how `filter()` works in Chapter 3,
but for now, read it as *"keep only rows where locus_group equals
protein-coding gene"*:

```r
protein_coding <- hgnc |> filter(locus_group == "protein-coding gene")
```

Build a bar chart of `chromosome` using `protein_coding`. Because the
chromosome order was already fixed for you when the data was prepared,
your plot will automatically show chromosomes in the correct biological
order — 1, 2, 3 … 22, X, Y — not alphabetical order.

- Which chromosome carries the most protein-coding genes?
- Which carries the fewest?
- Does the X chromosome carry more or fewer than you expected?

---

### Task 5 — Faceting: small multiples

`facet_wrap()` splits one plot into a grid of smaller plots, one per
category — a powerful way to compare groups side by side. Look it up
(`?facet_wrap`) before attempting this task.

Filter to five interesting chromosomes using this line:

```r
selected_chr <- hgnc |> filter(chromosome %in% c("1", "7", "17", "X", "Y"))
```

Using `selected_chr`, build a faceted version of your Task 2 plot —
biotype distribution, split into one panel per chromosome.

- Compare chromosomes 1, 7, and 17 (the autosomes) to X and Y.
  What's different about the sex chromosomes?
- Chromosome Y in particular looks unusual. Describe what you see.

---

### Task 6 — Explore themes and colour

Chapter 1 covers more than just bars and facets — it's about the whole
visual language of a plot. Take your Task 5 plot and try layering on
different built-in themes, one at a time — look up `theme_minimal()`,
`theme_classic()`, `theme_bw()`, and `theme_dark()` and see how each
changes the feel of the plot.

Pick the one you find most readable for your final version.

Then look up `scale_fill_brewer()` and try applying a couple of
different `palette` values to your fill-mapped plot from Task 3 or 5
(for example `"Set2"`, `"Pastel1"`, `"Dark2"`). Which palette makes
the categories easiest to tell apart?

---

### Task 7 — Polish and export

Choose your three best plots — one each from Tasks 2/3, 4, and 5/6 —
and finish each with:

- A clear, descriptive title
- Proper axis labels (not the raw column names)
- A caption crediting the source: HGNC

Look up `labs()` if you're not sure how to add these.

Then export each to the `figures/` folder at 300 DPI using `ggsave()`:

```r
ggsave("figures/01_gene_biotypes.png", width = 10, height = 6, dpi = 300)
ggsave("figures/02_protein_coding_per_chromosome.png", width = 12, height = 6, dpi = 300)
ggsave("figures/03_biotype_by_chromosome_faceted.png", width = 14, height = 8, dpi = 300)
```

---

### Task 8 — Interpret your results

Write a comment block at the end of `analysis.R` (3–5 sentences)
covering:

- What biological patterns did you notice across your plots?
- Why might some chromosomes carry more genes than others?
- Why does chromosome Y look so different from the autosomes?
- Which plot told the clearest story, and why?

---

## Skills Practiced

| R Skill | Function |
|---|---|
| Loading data | `read_rds()` |
| Exploring a dataset | `glimpse()`, `count()` |
| Bar charts | `geom_bar()` |
| Mapping aesthetics | `aes(fill =, colour =)` |
| Flipping axes | `coord_flip()` |
| Faceting | `facet_wrap()` |
| Themes | `theme_minimal()`, `theme_classic()`, `theme_bw()`, `theme_dark()` |
| Colour palettes | `scale_fill_brewer()` |
| Labels and captions | `labs()` |
| Exporting figures | `ggsave()` |

---

## Expected Outputs

By the end of this challenge your `figures/` folder should contain:

```
figures/
├── 01_gene_biotypes.png
├── 02_protein_coding_per_chromosome.png
└── 03_biotype_by_chromosome_faceted.png
```

And your `analysis.R` should end with a short interpretation comment
block.

---

## Think About It

> You used the same dataset to make several very different-looking
> plots, just by changing the geom, the facets, or the aesthetics.
> This is the core idea of ggplot2 — a plot is built by layering
> independent decisions (data, geometry, aesthetics, facets, theme)
> rather than picking one fixed chart type. Which single change made
> the biggest difference to how easy your plot was to read?

> Chromosome 1 has the most protein-coding genes. Is that simply
> because it's the longest chromosome, or is something else going on?
> What additional data would let you check?

---

## Learning Objectives

By completing this challenge you will be able to:

- Load and explore a real genomic dataset
- Build bar charts with `geom_bar()`
- Map variables to colour and fill aesthetics
- Flip coordinates for readability with `coord_flip()`
- Compare groups side-by-side using `facet_wrap()`
- Apply and compare built-in themes
- Use a colour palette with `scale_fill_brewer()`
- Add titles, labels, and captions with `labs()`
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