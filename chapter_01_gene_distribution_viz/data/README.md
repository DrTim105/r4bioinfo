# Data — HGNC Gene Set (Processed)

## For students — this is all you need

This folder contains **`hgnc_processed.rds`**, a ready-to-use file
derived from the HGNC (Human Gene Nomenclature Committee) complete gene
registry. Load it directly:

```r
hgnc <- read_rds("data/hgnc_processed.rds")
```

That's it. The chromosome column is already cleaned and correctly
ordered (1, 2, 3 … 22, X, Y) — you don't need to do anything to it
before plotting.

| Field | Detail |
|---|---|
| **Original source** | HGNC — https://www.genenames.org/download/statistics-and-files/ |
| **Rows** | 44,906 (one per approved human gene entry) |
| **Key columns** | `symbol`, `name`, `locus_group`, `locus_type`, `location`, `chromosome` |

---

## How this file was made (for the curious)

If you want to see exactly how the raw HGNC download was turned into
this clean file, look at `preprocess.R` in this folder. It removes 91
genes with no standard chromosome assignment, and extracts a clean
`chromosome` column from the raw cytogenetic location data.

You do **not** need to run this script or understand it to complete
the Chapter 1 challenge — it uses tools from later chapters. It's here
purely so the data preparation is transparent and reproducible.