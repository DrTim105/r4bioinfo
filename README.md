# r4bioinfo
Chapter-by-chapter R for Data Science applied to genomics — challenges and solutions for beginner bioinformaticians

````markdown
<div align="center">

# 🧬 R for Bioinformatics

### Learning R through genomics, one chapter at a time.

A supplementary challenge resource to [R for Data Science (2nd ed.)](https://r4ds.hadley.nz)  
by Hadley Wickham, Mine Çetinkaya-Rundel & Garrett Grolemund

---

![R Version](https://img.shields.io/badge/R-%3E%3D4.3-276DC3?style=flat-square&logo=r)
![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)
![Chapters](https://img.shields.io/badge/Chapters-29-1B4F72?style=flat-square)
![Status](https://img.shields.io/badge/Status-Active-2E86C1?style=flat-square)
![PRs Welcome](https://img.shields.io/badge/PRs-Welcome-brightgreen?style=flat-square)

</div>

---

## 📖 What Is This?

This repository is a **hands-on, portfolio-building challenge resource** for anyone
learning R with a focus on genomics and bioinformatics. For each of the 29 chapters
in *R for Data Science (2nd edition)*, there is a paired bioinformatics project that
applies that chapter's R concepts to **real, publicly available genomic data**.

Every challenge uses data from authoritative sources — NCBI, Ensembl, gnomAD,
GTEx, ClinVar, UniProt, COSMIC — the same databases used in research labs and
clinical settings every day.

**There is no solution code in the challenge descriptions.** You read the chapter,
you attempt the challenge, and you commit your own solution. The solutions visible
in this repo are mine. They are here to show you one way to approach each problem —
not the only way, and not necessarily the best way.

---

## 🎯 Who Is This For?

| You are... | This will help you... |
|---|---|
| New to R, have some biology background | Build real R skills on data you recognise |
| A biologist learning to code | See how R applies directly to your field |
| A data scientist moving into genomics | Learn the biological context behind the data |
| A medical professional entering bioinformatics | Bridge clinical knowledge with computational tools |
| A student wanting a portfolio | Produce 29 documented, GitHub-hosted projects |
| A self-taught bioinformatician | Follow a structured, calibrated learning path |

No prior R experience is required. Every challenge includes a plain-language
**Biological Context** section — you do not need a biology degree to follow along.

---

## 🗺️ How to Use This Repository

There are two ways to use this repo depending on your goal:

### If you are here to learn alongside me

1. **Read the chapter** in [r4ds.hadley.nz](https://r4ds.hadley.nz) first.
   Work through its examples and exercises.
2. **Open the challenge README** inside the corresponding chapter folder.
   Download the dataset following the exact instructions provided.
3. **Solve the challenge yourself** — in your own R session, in your own fork.
   Do not look at `analysis.R` until you have made a genuine attempt.
4. **Compare your approach** to mine. Look at how I structured the code,
   what I commented, what I interpreted. There is no single right answer.
5. **Commit your solution** to your own fork and keep building your portfolio.

### If you are here to use this as a teaching resource

Each chapter folder contains a standalone `README.md` written for students —
challenge descriptions, dataset instructions, and learning objectives —
with no solutions. You can assign these as exercises with or without the solutions
visible. The challenges are calibrated to the skill level appropriate for each
chapter: a Chapter 3 challenge requires only `filter()` and `group_by()`;
a Chapter 25 challenge requires writing documented, tested functions.

---

## ✅ Prerequisites

### Software

| Tool | Download |
|---|---|
| R ≥ 4.3 | [cran.r-project.org](https://cran.r-project.org) |
| RStudio Desktop (recommended) | [posit.co/download/rstudio-desktop](https://posit.co/download/rstudio-desktop) |
| Git | [git-scm.com](https://git-scm.com) |
| GitHub account | [github.com](https://github.com) |

### R Packages

Install the core packages before you begin. Additional packages are introduced
as they are needed — see each chapter's README for specifics.

```r
# Core tidyverse (covers Chapters 1–19)
install.packages(c(
  "tidyverse",   # ggplot2, dplyr, tidyr, readr, stringr, forcats, lubridate, purrr
  "ggrepel",     # non-overlapping labels (Chapter 11)
  "patchwork"    # multi-panel figures (Chapter 11)
))

# Data import tools (Chapter 20)
install.packages(c("readxl", "writexl"))

# Large data and APIs (Chapters 21–24)
install.packages(c("arrow", "DBI", "RMySQL", "httr2", "jsonlite", "rvest"))

# Bioconductor (Chapters 5, 8, 19, 27)
if (!require("BiocManager")) install.packages("BiocManager")
BiocManager::install(c(
  "airway",             # RNA-seq example dataset
  "GenomicRanges",      # Genomic interval arithmetic
  "biomaRt",            # Ensembl annotation queries
  "SummarizedExperiment", # Standard genomics data container
  "AnnotationHub"       # Local database downloads
))
```

### Knowledge

- No prior R experience required — R4DS teaches you everything from scratch
- High-school-level biology is helpful but all biological concepts are explained
- Python experience is a bonus but is not needed

---

## 📚 Chapter Index

All 29 challenges, mapped to the R4DS chapter they accompany.

| # | R4DS Chapter | Project | Core R Skill | Genomics Topic | Data Source |
|---|---|---|---|---|---|
| 01 | Data Visualization | [Mapping the Human Gene Landscape](./chapter_01_gene_distribution_viz/) | ggplot2 basics | Gene distribution across chromosomes | HGNC |
| 02 | Workflow: Basics | [The Genomic Calculator](./chapter_02_genomic_calculator/) | Variables & vectors | GC content, melting temperature | None (sequences) |
| 03 | Data Transformation | [Exploring the ClinVar Variant Database](./chapter_03_clinvar_exploration/) | dplyr verbs | Clinical variant classification | NCBI ClinVar |
| 04 | Workflow: Code Style | [The Bioinformatics Code Style Clinic](./chapter_04_code_style_clinic/) | Tidyverse style guide | Reproducible code practices | None (style exercise) |
| 05 | Data Tidying | [Tidying an RNA-seq Expression Matrix](./chapter_05_expression_matrix_tidy/) | pivot_longer/wider | RNA-seq count matrices | Bioconductor airway |
| 06 | Workflow: Scripts & Projects | [Setting Up a Reproducible Project](./chapter_06_project_setup/) | RProjects & paths | Reproducible bioinformatics setup | None (structure) |
| 07 | Data Import | [Importing the Formats of Genomics](./chapter_07_multiformat_import/) | read_tsv, read_csv | BED, TSV, and annotation files | ENCODE, UCSC, Ensembl |
| 08 | Workflow: Getting Help | [Navigating the Bioconductor Ecosystem](./chapter_08_bioc_package_tour/) | Documentation & help | Bioconductor package navigation | Bioconductor |
| 09 | Layers | [Building Layered Expression Profiles](./chapter_09_layered_expression_viz/) | ggplot2 layers | Tissue-specific gene expression | GTEx Portal |
| 10 | Exploratory Data Analysis | [Exploring Gene Constraint](./chapter_10_genomic_eda/) | EDA workflow | gnomAD pLI & LOEUF scores | gnomAD |
| 11 | Communication | [Publication-Ready Genomics Figures](./chapter_11_publication_figures/) | Themes, annotations, patchwork | Figure design for publication | gnomAD (reuse) |
| 12 | Logical Vectors | [Variant Quality Control](./chapter_12_variant_quality_control/) | Logical operators, case_when | Clinical variant QC filtering | ClinVar (reuse) |
| 13 | Numbers | [Allele Frequency Arithmetic](./chapter_13_allele_frequency_stats/) | Numeric operations | Allele frequencies, constraint stats | gnomAD (reuse) |
| 14 | Strings | [Parsing Sequence Identifiers](./chapter_14_sequence_id_parsing/) | stringr functions | UniProt protein IDs and names | UniProt |
| 15 | Regular Expressions | [Parsing Gene Annotations with Regex](./chapter_15_annotation_regex/) | Regular expressions | GTF attribute field parsing | GENCODE v46 |
| 16 | Factors | [Ordering Mutation Types](./chapter_16_mutation_type_factors/) | forcats, factor levels | Mutational signatures (SBS) | COSMIC |
| 17 | Dates and Times | [Mapping Clinical Trial Timelines](./chapter_17_clinical_trial_timelines/) | lubridate | Clinical trial duration analysis | ClinicalTrials.gov |
| 18 | Missing Values | [GWAS Missing Data](./chapter_18_gwas_missing_data/) | NA handling, imputation | GWAS summary statistics | IEU Open GWAS |
| 19 | Joins | [Annotating Variants by Joining Databases](./chapter_19_variant_annotation_joins/) | All join types | Variant → gene → function annotation | ClinVar + Ensembl + GO |
| 20 | Spreadsheets | [Wrangling Lab Metadata from Excel](./chapter_20_lab_metadata_excel/) | readxl, writexl | Sequencing run metadata | NCBI SRA |
| 21 | Databases | [Querying Gene Databases with R](./chapter_21_gene_database_queries/) | DBI, dplyr + SQL | Ensembl database queries | Ensembl MySQL |
| 22 | Arrow | [Handling Genome-Scale Data](./chapter_22_large_scale_genomics/) | Arrow, parquet | eQTL summary statistics | GTEx |
| 23 | Hierarchical Data | [Rectangling Genomics API Responses](./chapter_23_api_json_parsing/) | JSON, unnesting | Ensembl REST API | Ensembl REST |
| 24 | Web Scraping | [Ethical Web Scraping for Genomic Data](./chapter_24_genomics_web_scraping/) | rvest | NCBI Gene page parsing | NCBI |
| 25 | Functions | [Building a Bioinformatics Toolkit](./chapter_25_bioinformatics_toolkit/) | Function writing | GC content, reverse complement, translation | Rosalind |
| 26 | Iteration | [Batch Processing RNA-seq Samples](./chapter_26_batch_sample_processing/) | purrr: map, walk, reduce | Multi-sample RNA-seq processing | Bioconductor airway |
| 27 | A Field Guide to Base R | [Base R Meets Bioconductor](./chapter_27_base_r_bioconductor/) | S4, apply, base R | SummarizedExperiment objects | Bioconductor airway |
| 28 | Quarto | [Writing a Reproducible Genomics Report](./chapter_28_reproducible_report/) | Quarto documents | Integrated genomics analysis report | Chapters 10, 12, 19 |
| 29 | Quarto Formats | [Publishing Your Work as a Website](./chapter_29_multiformat_output/) | Quarto websites | GitHub Pages portfolio deployment | All chapters |

---

## 🗂️ Repository Structure

Every chapter follows the same folder structure so you always know where to look.

````
r4bioinfo/
│
├── README.md                          ← You are here
├── HINTS.md                           ← Hints for all 29 challenges (try first!)
├── CONTRIBUTING.md                    ← How to contribute your own solutions
├── .gitignore                         ← Excludes large genomic files and R session data
│
├── chapter_01_gene_distribution_viz/
│   ├── README.md                      ← Challenge description (no solutions)
│   ├── analysis.R                     ← My solution with comments
│   ├── data/
│   │   └── README.md                  ← Data source, download URL, import command
│   └── figures/
│       └── *.png                      ← Exported plots
│
├── chapter_02_genomic_calculator/
│   ├── README.md
│   └── analysis.R
│
├── chapter_03_clinvar_exploration/
│   ├── README.md
│   ├── analysis.R
│   ├── data/
│   │   └── README.md
│   └── chr_pathogenic_counts.csv
│
│   ... (same structure for all 29 chapters)
│
└── chapter_29_multiformat_output/
    ├── README.md
    ├── analysis.R
    ├── CONTRIBUTING.md
    └── REFLECTION.md
````

---

## 📈 Skills Progression

This table shows how R proficiency builds across the six parts of the book.
Each part unlocks new capabilities.

| Part | Chapters | What You Can Do by the End |
|---|---|---|
| **I — Whole Game** | 1–8 | Import data, transform it with dplyr, visualise it with ggplot2, write reproducible scripts |
| **II — Visualize** | 9–11 | Build multi-layer, publication-ready genomics figures from scratch |
| **III — Transform** | 12–19 | Manipulate any genomic data type: variants, sequences, clinical dates, missing data, multi-table joins |
| **IV — Import** | 20–24 | Read from Excel, SQL databases, parquet files, REST APIs, and web pages |
| **V — Program** | 25–27 | Write reusable, documented functions; process batches of files; navigate Bioconductor S4 objects |
| **VI — Communicate** | 28–29 | Produce reproducible Quarto reports, presentations, and a deployed GitHub Pages website |

By Chapter 29, you will be able to design an end-to-end bioinformatics analysis,
execute it in clean R code, and publish it as a live website — using the same
tools and data types encountered in professional genomics roles.

---

## 🧪 Datasets Used

All datasets are **freely and publicly available** — no institutional access,
no paywalls, no registration required (with one minor exception noted below).

| Dataset | Source | Used In |
|---|---|---|
| HGNC Complete Gene Set | [genenames.org](https://www.genenames.org/download/statistics-and-files/) | Ch 1 |
| ClinVar Variant Summary | [NCBI FTP](https://ftp.ncbi.nlm.nih.gov/pub/clinvar/tab_delimited/) | Ch 3, 12, 19 |
| airway RNA-seq counts | [Bioconductor](https://bioconductor.org/packages/airway) | Ch 5, 26, 27 |
| ENCODE hg38 Blacklist | [ENCODE](https://www.encodeproject.org/files/ENCFF356LFX/) | Ch 7 |
| UCSC Chromosome Sizes | [UCSC](https://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/) | Ch 7 |
| Ensembl Gene Annotations | [Ensembl FTP](https://ftp.ensembl.org/pub/release-112/tsv/homo_sapiens/) | Ch 7, 19, 21 |
| GTEx Median TPM | [GTEx Portal](https://gtexportal.org/home/downloads/adult-gtex/) | Ch 9 |
| gnomAD v2.1.1 Constraint | [gnomAD](https://gnomad.broadinstitute.org/downloads) | Ch 10, 11, 13 |
| UniProt Reviewed Human Proteome | [UniProt REST API](https://rest.uniprot.org) | Ch 14 |
| GENCODE v46 Annotation (GTF) | [GENCODE](https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_46/) | Ch 15 |
| COSMIC SBS Signatures v3.4 | [COSMIC](https://cancer.sanger.ac.uk/signatures/downloads/) | Ch 16 |
| ClinicalTrials.gov COVID-19 trials | [ClinicalTrials.gov API](https://clinicaltrials.gov/data-api) | Ch 17 |
| Open GWAS BMI Summary Stats | [IEU Open GWAS](https://gwas.mrcieu.ac.uk) | Ch 18 |
| Gene Ontology Annotations | [Gene Ontology](https://current.geneontology.org/annotations/) | Ch 19 |
| NCBI SRA Run Metadata | [NCBI SRA](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=SRP033351) | Ch 20 |
| GTEx v8 eQTL Summary Stats | [GTEx Portal](https://gtexportal.org/home/downloads/adult-gtex/) | Ch 22 |
| Ensembl REST API | [rest.ensembl.org](https://rest.ensembl.org) | Ch 23 |
| NCBI Gene HTML pages | [ncbi.nlm.nih.gov/gene](https://www.ncbi.nlm.nih.gov/gene/) | Ch 24 |

> **Note on COSMIC:** The COSMIC mutational signatures file (Chapter 16) requires
> free registration at cancer.sanger.ac.uk. Registration takes under two minutes
> and is open to all.

---

## 🧬 A Note on Biological Concepts

Each chapter README opens with a **Biological Context** section. These are written
for a reader with no prior genomics knowledge — plain language, no assumed
terminology. If you are a biologist who already knows what ClinVar or gnomAD is,
you can skip these sections. If you are a data scientist who has never heard of
an eQTL or a mutational signature, these sections give you exactly enough context
to understand why you are doing the analysis.

The **Think About It** boxes inside each chapter go deeper — they connect the R
concept you just practised to a real-world bioinformatics challenge. These are
worth reading even if you already know the biology, because they often explain
*why* the data looks the way it does.

---

## 💡 Hints

If you get stuck on a challenge, check [`HINTS.md`](./HINTS.md).

Each chapter has three hints:
- **Key functions** — the R functions most relevant to the challenge
- **Data structure** — a clue about how the dataset is organised
- **Approach** — a nudge about how to decompose the problem

Hints are intentionally vague. They point you in the right direction without
giving away the solution. Try to spend at least 15 minutes on a problem
before reading a hint.

---

## 🤝 Contributing

This repository is designed to grow. If you have worked through a challenge
and want to share your solution, you are very welcome to contribute.

### How to add your solution

1. Fork this repository
2. Create a new branch: `git checkout -b solution/ch01-your-github-username`
3. Create a folder: `chapter_01_gene_distribution_viz/solutions/your-github-username/`
4. Add your `analysis.R` (and any figures) inside that folder
5. Open a pull request with the title: `[ch01] solution: your-github-username`

### Guidelines for contributions

- Solutions must be in R (base R or tidyverse)
- Code must follow the [Tidyverse style guide](https://style.tidyverse.org)
- Include a file header comment (see [CONTRIBUTING.md](./CONTRIBUTING.md))
- Add brief inline comments explaining non-obvious decisions
- Do not include large data files — reference the download instructions in the
  chapter README instead

All contributors will be added to the Acknowledgements section of this README.

See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for full details.

---

## 🔧 Coding Standards

All `analysis.R` files in this repository follow these conventions:

```r
# ── File Header ─────────────────────────────────────────────────────────────
# Chapter:      01 — Data Visualization
# Project:      chapter_01_gene_distribution_viz
# R4DS URL:     https://r4ds.hadley.nz/data-visualize.html
# Dataset:      HGNC Complete Gene Set
# Author:       [your name]
# Date:         [date]
# Description:  Visualise gene distribution across human chromosomes using
#               ggplot2, applied to the HGNC gene nomenclature dataset.
# ────────────────────────────────────────────────────────────────────────────

# ── LOAD PACKAGES ────────────────────────────────────────────────────────────
library(tidyverse)

# ── IMPORT DATA ──────────────────────────────────────────────────────────────

# ── ANALYSIS ─────────────────────────────────────────────────────────────────

# ── VISUALISATION ────────────────────────────────────────────────────────────

# ── EXPORT ───────────────────────────────────────────────────────────────────
```

**Key conventions:**
- Pipe operator: `|>` (native pipe, R ≥ 4.1)
- Naming: `snake_case` throughout
- Indentation: 2 spaces
- Max line length: 80 characters
- No hardcoded file paths — use `here::here()` or `file.path()`

---

## 📂 Commit Message Convention

````
[chXX] verb: brief description
````

| Example | When to use |
|---|---|
| `[ch01] add: challenge README and dataset instructions` | First commit for a chapter |
| `[ch01] solve: initial ggplot2 analysis` | First solution commit |
| `[ch01] refactor: improve variable names and add comments` | Cleaning up a solution |
| `[ch03] fix: correct filter logic for GRCh38 assembly` | Bug fix |
| `[repo] docs: update chapter index with chapters 1–5` | README updates |
| `[repo] init: initial project structure and .gitignore` | Repository setup |

---

## 🚀 Recommended Learning Path

Work through the chapters in order. This is not a suggestion — it is
important. Each chapter's challenge is designed around the exact skills
available at that point in the book. Skipping ahead means encountering
concepts before they have been introduced.

If you are already familiar with basic R (ggplot2, dplyr), you can start
at **Chapter 9** for the visualisation section, or **Chapter 12** for
the data transformation deep-dives. But read the earlier chapter READMEs
anyway — the biological context and datasets introduced there are reused
in later chapters.

---

## 🌱 About This Project

This repository was built by a medical doctor transitioning into
bioinformatics and genomics engineering.

I created it for two reasons:

**First**, I wanted to learn R properly — not just copy-paste code from
tutorials, but genuinely understand the language well enough to use it
for real genomic analyses. Working through R for Data Science chapter by
chapter, with bioinformatics problems as exercises, gave me that.

**Second**, I wanted the learning to be useful to others. Generic R
exercises feel disconnected from biology. Exercises on toy datasets do not
prepare you for the formats, quirks, and scale of real genomic data.
Every challenge here uses real data from databases that bioinformaticians
actually use — so that completing the exercises builds genuine domain
familiarity, not just R syntax familiarity.

If you are on a similar path — a clinician, biologist, or data scientist
moving toward computational genomics — I hope this helps. The challenges
are hard enough to be worth doing and approachable enough that you can
actually finish them.

---

## 📖 Acknowledgements

- **Hadley Wickham, Mine Çetinkaya-Rundel, and Garrett Grolemund** for
  *R for Data Science*, which this entire guide is structured around.
  The book is freely available at [r4ds.hadley.nz](https://r4ds.hadley.nz)
  and is one of the best programming textbooks ever written.

- **The Bioconductor community** for building and maintaining the world's
  most comprehensive open-source genomics software ecosystem. Every
  genomics R package you will use here was built by researchers who made
  it free.

- **The gnomAD team** at the Broad Institute, **the GTEx Consortium**,
  **the NCBI ClinVar team**, **the GENCODE project**, **the COSMIC team**
  at the Sanger Institute, **UniProt**, and **the Gene Ontology Consortium**
  for making their data openly available to researchers and learners
  worldwide. Open data makes open science possible.

- **Everyone who has contributed a solution** to this repository. You are
  listed below.

---

## 📜 License

This repository is licensed under the **MIT License**.

You are free to use, fork, share, and modify the code and challenge
descriptions for any purpose, including educational and commercial use.
If you use this resource in a course or tutorial, a credit or link back
is appreciated but not required.

See [`LICENSE`](./LICENSE) for the full text.

---

## ⭐ If this helped you

If this repository helped you learn R or bioinformatics, consider:

- **Starring the repository** so others can find it
- **Sharing it** with someone who is starting their bioinformatics journey
- **Opening an issue** if you find an error, a broken dataset link,
  or a challenge that is unclear
- **Submitting a pull request** with your solution so other learners can
  see different approaches to the same problem

---

<div align="center">

*Built by a doctor learning to read genomes.*

**[⭐ Star this repo](https://github.com/[username]/r4bioinfo)**  ·  
**[🍴 Fork it](https://github.com/[username]/r4bioinfo/fork)**  ·  
**[🐛 Report an issue](https://github.com/[username]/r4bioinfo/issues)**  ·  
**[💬 Start a discussion](https://github.com/[username]/r4bioinfo/discussions)**

</div>
````
