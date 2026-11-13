# HPVCodon

Code, intermediate data, and analysis outputs supporting the manuscript:

**“Large-Scale Multi-Sequence Analysis Reveals Conserved and Gene-Specific Codon Usage Patterns across 14 Human Papillomavirus Types”**

This repository contains the computational scripts and intermediate data used for the codon-usage analyses described in the manuscript. It is provided to improve transparency, reproducibility, and independent cross-checking of the reported results.

## Study overview

The study analyzes codon-usage patterns across 14 clinically relevant human papillomavirus (HPV) types:

**HPV-16, HPV-18, HPV-31, HPV-33, HPV-35, HPV-39, HPV-45, HPV-51, HPV-52, HPV-56, HPV-58, HPV-59, HPV-66, and HPV-68.**

After sequence retrieval and multi-stage curation, **25,964 coding sequences (CDS)** representing **89 evaluable HPV type–gene combinations** were retained for downstream analysis.

The coding regions examined were:

* E1
* E2
* E4
* E5
* E6
* E7
* L1
* L2

## Analyses included

The repository contains scripts and/or intermediate data used for the following analyses:

* nucleotide and codon-position composition
* GC3s analysis
* relative synonymous codon usage (RSCU)
* effective number of codons (ENC)
* ENC–GC3s analysis
* neutrality plots
* parity rule 2 (PR2) analysis
* correspondence analysis (COA)
* sequence-alignment and phylogenetic consistency assessment
* robustness analyses involving identical CDS and ambiguous nucleotide calls
* additional analyses used during manuscript revision

RSCU values were generated using CodonW from pooled coding sequences within each HPV type–gene dataset. The repository includes the corresponding intermediate RSCU outputs and processed tables so that the reported type–gene–codon values can be independently inspected.

## Main computational workflow

The general analysis workflow was:

```text
NCBI nucleotide records
        |
        v
sequence classification and CDS extraction
        |
        v
ORF, strand, and reference-length filtering
        |
        v
multiple-sequence alignment
        |
        v
phylogenetic consistency assessment
        |
        v
curated gene-specific CDS datasets
        |
        +--------------------+
        |                    |
        v                    v
   CodonW analyses       EMBOSS / auxiliary analyses
        |
        v
RSCU, ENC, GC3s and COA outputs
        |
        v
Python/R processing and statistical analysis
        |
        v
tables and figures reported in the manuscript
```
