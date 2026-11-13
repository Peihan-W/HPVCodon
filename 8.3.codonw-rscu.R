library(ggplot2)
library(aplot)
library(tidyverse)
library(pheatmap)
library(RColorBrewer)

# =========================================================
# 1. Read data
# =========================================================

rscu <- read.delim(
  "./8.out/3.rscu.codonw.tsv",
  header = TRUE,
  sep = "\t",
  stringsAsFactors = FALSE
)

rscu$RSCU <- as.numeric(rscu$RSCU)

# =========================================================
# 2. Remove stop codons, Met and Trp
# =========================================================

exclude_codons <- c(
  "TAA", "TAG", "TGA",
  "ATG", "TGG"
)

rscu <- rscu %>%
  mutate(
    Codon_DNA = gsub("U", "T", Codon)
  )

rscu2 <- rscu %>%
  filter(!Codon_DNA %in% exclude_codons) %>%
  mutate(
    TypeGene = paste(Subtype, Gene, sep = "_")
  )
length(unique(rscu2$Codon_DNA))
head(rscu2)
length(unique(rscu2$TypeGene))

# =========================================================
# 3. Create raw RSCU matrix
# =========================================================

rscu_wide <- rscu2 %>%
  select(TypeGene, Codon, RSCU) %>%
  pivot_wider(
    names_from = Codon,
    values_from = RSCU
  )

rscu_matrix <- rscu_wide %>%
  column_to_rownames("TypeGene") %>%
  as.matrix()

# =========================================================
# 4. Quality checks
# =========================================================

rscu_matrix_valid <- rscu_matrix[
  rowSums(!is.na(rscu_matrix)) > 0,
  ,
  drop = FALSE
]

dim(rscu_matrix_valid)

sum(is.na(rscu_matrix_valid))

summary(as.vector(rscu_matrix_valid))

# =========================================================
# 5. Column-wise z-score normalization
# =========================================================

rscu_matrix_valid <- scale(rscu_matrix_valid)

print(
  range(rscu_matrix_valid, na.rm = TRUE)
)

# =========================================================
# 6. Row metadata
# =========================================================

annotation_row <- rscu2 %>%
  select(TypeGene, Subtype, Gene) %>%
  distinct() %>%
  column_to_rownames("TypeGene")

annotation_row <- annotation_row[
  rownames(rscu_matrix_valid),
  ,
  drop = FALSE
]

stopifnot(
  identical(
    rownames(annotation_row),
    rownames(rscu_matrix_valid)
  )
)

# =========================================================
# 8. Heatmap colors
# =========================================================

heat_colors <- colorRampPalette(
  c("#2166AC", "#F7F7F7", "#B2182B")
)(100)

breaks <- seq(
  -3,
  3,
  length.out = 101
)

# =========================================================
# 9. Draw heatmap
# =========================================================

pheatmap(
  rscu_matrix_valid,
  
  color = heat_colors,
  breaks = breaks,
  
  cluster_rows = FALSE,
  cluster_cols = TRUE,
  
  clustering_distance_rows = "euclidean",
  clustering_distance_cols = "euclidean",
  clustering_method = "complete",
  
  annotation_row = annotation_row,
  
  border_color = NA,
  
  show_rownames = TRUE,
  show_colnames = TRUE,
  
  fontsize_row = 5,
  fontsize_col = 7,
  
  angle_col = 45,
  
  main = "Column-standardized RSCU across HPV type-gene datasets"
)


# =========================================================
# 9. Draw heatmap 
# ΔRSCU = mean RSCU(A/T-ending codons) − mean RSCU(G/C-ending codons)
# =========================================================

rscu_summary <- rscu %>%
  mutate(
    Codon_DNA = gsub("U", "T", Codon),
    Ending = ifelse(
      substr(Codon_DNA, 3, 3) %in% c("A", "T"),
      "AT",
      "GC"
    )
  ) %>%
  filter(
    !Codon_DNA %in% c("TAA", "TAG", "TGA", "ATG", "TGG"),
    !is.na(RSCU)
  ) %>%
  group_by(Subtype, Gene, Ending) %>%
  summarise(
    mean_RSCU = mean(RSCU),
    .groups = "drop"
  ) %>%
  pivot_wider(
    names_from = Ending,
    values_from = mean_RSCU
  ) %>%
  mutate(
    Delta_RSCU = AT - GC
  )

head(rscu_summary)

delta_matrix <- rscu_summary %>%
  select(Gene, Subtype, Delta_RSCU) %>%
  pivot_wider(
    names_from = Subtype,
    values_from = Delta_RSCU
  ) %>%
  column_to_rownames("Gene") %>%
  as.matrix()

dim(delta_matrix)

heat_colors <- colorRampPalette(
  c("#2166AC", "#F7F7F7", "#B2182B")
)(100)

pheatmap(
  delta_matrix,
  color = heat_colors,
  cluster_rows = FALSE,
  cluster_cols = FALSE,
  border_color = NA,
  fontsize = 10,
  main = "Relative A/T-ending codon preference across HPV types and genes"
)


# =========================================================
# 9. Draw heatmap 
# ΔRSCU = mean RSCU(A/T-ending codons) − mean RSCU(G/C-ending codons)
# family level
# =========================================================

rscu_family <- rscu %>%
  mutate(
    Codon_DNA = gsub("U", "T", Codon)
  ) %>%
  filter(
    !Codon_DNA %in% c("TAA", "TAG", "TGA", "ATG", "TGG"),
    !is.na(RSCU)
  ) %>%
  mutate(
    Ending = ifelse(
      substr(Codon_DNA, 3, 3) %in% c("A", "T"),
      "AT",
      "GC"
    ),
    
    Family = case_when(
      # Leucine: 2-fold + 4-fold
      Codon_DNA %in% c("TTA", "TTG") ~ "Leu_2",
      Codon_DNA %in% c("CTT", "CTC", "CTA", "CTG") ~ "Leu_4",
      
      # Arginine
      Codon_DNA %in% c("AGA", "AGG") ~ "Arg_2",
      Codon_DNA %in% c("CGT", "CGC", "CGA", "CGG") ~ "Arg_4",
      
      # Serine
      Codon_DNA %in% c("AGT", "AGC") ~ "Ser_2",
      Codon_DNA %in% c("TCT", "TCC", "TCA", "TCG") ~ "Ser_4",
      
      TRUE ~ AA
    )
  )

family_delta <- rscu_family %>%
  group_by(Subtype, Gene, Family, Ending) %>%
  summarise(
    mean_RSCU = mean(RSCU),
    .groups = "drop"
  ) %>%
  pivot_wider(
    names_from = Ending,
    values_from = mean_RSCU
  ) %>%
  filter(!is.na(AT), !is.na(GC)) %>%
  mutate(
    Family_Delta = AT - GC
  )

rscu_summary_family <- family_delta %>%
  group_by(Subtype, Gene) %>%
  summarise(
    Delta_RSCU_family = mean(Family_Delta),
    .groups = "drop"
  )

summary(rscu_summary_family$Delta_RSCU_family)

range(
  rscu_summary_family$Delta_RSCU_family,
  na.rm = TRUE
)

sum(
  rscu_summary_family$Delta_RSCU_family > 0,
  na.rm = TRUE
)

sum(
  rscu_summary_family$Delta_RSCU_family < 0,
  na.rm = TRUE
)

nrow(rscu_summary_family)


# Fixed biological order
gene_order <- c(
  "E1", "E2", "E4", "E5",
  "E6", "E7", "L1", "L2"
)

type_order <- c(
  "HPV-16", "HPV-18", "HPV-31", "HPV-33",
  "HPV-35", "HPV-39", "HPV-45", "HPV-51",
  "HPV-52", "HPV-56", "HPV-58", "HPV-59",
  "HPV-66", "HPV-68"
)

delta_family_matrix <- rscu_summary_family %>%
  mutate(
    Gene = factor(Gene, levels = gene_order),
    Subtype = factor(Subtype, levels = type_order)
  ) %>%
  select(Gene, Subtype, Delta_RSCU_family) %>%
  pivot_wider(
    names_from = Subtype,
    values_from = Delta_RSCU_family
  ) %>%
  arrange(Gene) %>%
  column_to_rownames("Gene") %>%
  as.matrix()

delta_family_matrix

heat_colors <- colorRampPalette(
  c("#2166AC", "#F7F7F7", "#B2182B")
)(100)

breaks <- seq(
  -1.4,
  1.4,
  length.out = 101
)

number_matrix <- matrix(
  sprintf("%.2f", delta_family_matrix),
  nrow = nrow(delta_family_matrix),
  ncol = ncol(delta_family_matrix),
  dimnames = dimnames(delta_family_matrix)
)

number_matrix[is.na(delta_family_matrix)] <- ""


pheatmap(
  delta_family_matrix,
  
  color = heat_colors,
  breaks = breaks,
  
  cluster_rows = FALSE,
  cluster_cols = FALSE,
  
  display_numbers = number_matrix,
  number_color = "black",
  fontsize_number = 7,
  
  na_col = "#D9D9D9",
  
  border_color = "white",
  
  fontsize = 10,
  fontsize_row = 11,
  fontsize_col = 9,
  
  angle_col = 45,
  
  legend = TRUE,
  
  main = "Family-balanced A/T-ending RSCU tendency across HPV types and genes"
)



