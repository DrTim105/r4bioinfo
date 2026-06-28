# Data — HGNC Complete Gene Set

| Field | Detail |
|---|---|
| **Source** | HGNC (Human Gene Nomenclature Committee) |
| **URL** | https://www.genenames.org/download/statistics-and-files/ |
| **File** | hgnc_complete_set.txt (tab-separated) |
| **Download** | Scroll to "Complete HGNC dataset" → click "TXT (tab separated)" |

## Import command

```r
hgnc <- read_tsv("data/hgnc_complete_set.txt")
```

> This file is excluded from version control via `.gitignore`.
> Re-download from the URL above if needed.