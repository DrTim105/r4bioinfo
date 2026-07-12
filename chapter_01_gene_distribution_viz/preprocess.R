# ── Maintainer Script — Not Part of the Challenge ──────────────────
# I created this script to produce a clean data file that you then use
# for the challenge: hgnc_processed.rds
#
# So you do NOT need to run this script. It is here purely for transparency
# and maybe in case you want to check how the data file was made
#
# I didn't include the preprocessing in the challenges as it uses skills that
# you would not have learned yet
#
# ────────────────────────────────────────────────────────────────────────────

library(tidyverse)

# ── Load raw file ────────────────────────────────────────────────────────────
# omim_id is read as character because some rows contain multiple IDs
# separated by "|" (e.g. "312095|465000"), which breaks numeric parsing.

hgnc_raw <- read_tsv(
  "/Users/tim/r4bioinfo/chapter_01_gene_distribution_viz/data/hgnc_complete_set.txt",
  col_types = cols(omim_id = col_character()),
  show_col_types = FALSE
)

# ── Extract chromosome from the `location` column ───────────────────────────
# location looks like "17q21.31" or "Xp22.3" — chromosome is everything
# before the first "p" or "q".

hgnc_clean <- hgnc_raw |>
  mutate(chromosome = str_extract(location, "^[0-9XY]+")) |>
  filter(!is.na(chromosome)) |>                 # drop 91 genes with no
  # standard chromosome assigned
  select(-location_sortable)                     # entirely NA, no information

# ── Order chromosomes biologically, not alphabetically ──────────────────────
# Baking this into a factor now means students never have to think about
# chromosome ordering later — ggplot2 will just plot it correctly.

chr_levels <- c("1","2","3","4","5","6","7","8","9","10",
                "11","12","13","14","15","16","17","18","19",
                "20","21","22","X","Y")

hgnc_clean <- hgnc_clean |>
  mutate(chromosome = factor(chromosome, levels = chr_levels))

# ── Save as .rds ──────────────────────────────────────────────────────────────
# .rds preserves the factor order exactly. Students load this file and
# every plot they make will already show chromosomes in the correct order.

write_rds(hgnc_clean, "/Users/tim/r4bioinfo/chapter_01_gene_distribution_viz/data/hgnc_processed.rds")

message("Done. Commit data/hgnc_processed.rds to the repository.")
message("Rows: ", nrow(hgnc_clean), " | Columns: ", ncol(hgnc_clean))