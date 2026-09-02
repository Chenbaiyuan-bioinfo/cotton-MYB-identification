# Genome-wide Identification and Characterization of MYB Gene Family in Cotton


## Overview

MYB transcription factors are one of the largest transcription factor families in plants and play important roles in plant development, metabolism and stress responses.

MYB genes are known to be involved in fiber development and stress responses in cotton, making them important targets for functional studies.

In this project, a genome-wide identification pipeline was established to identify MYB family proteins in cotton based on Hidden Markov Model (HMM)-based domain searching.


## Dataset

Species:
Cotton

Genome assembly:
GCF_007990345.1

Protein dataset:
Cotton whole genome protein sequences downloaded from NCBI.

Number of proteins searched:
111,813

Raw protein sequences are not included in this repository. They can be downloaded from the NCBI Genome database under accession GCF_007990345.1.

## Workflow
Cotton protein sequences | v HMMER search against MYB domain model (PF00249) | v Candidate MYB proteins identification | v Sequence extraction | v Protein length analysis | v Domain number analysis | v Visualization


## Methods

### 1. MYB domain identification

The MYB DNA-binding domain model (PF00249) was used for HMMER-based screening.

High-confidence candidates were selected using:

E-value < 1e-10


### 2. Sequence analysis

Protein sequences were analyzed for:

- Protein length distribution
- MYB domain copy number


### 3. Visualization

Figures were generated using R and ggplot2.


## Results

A total of:

**760 MYB candidate proteins**

were identified from the cotton protein dataset.

Most candidates contain two MYB domains (R2R3-type), consistent with the typical structure of plant MYB transcription factors. These candidates provide a resource for future functional validation, such as VIGS-based screening for genes involved in salt tolerance or fiber development.

### Protein length distribution

![Protein length distribution](results/figures/Fig1_Myb_length_distribution.png)


### MYB domain number distribution

![MYB domain distribution](results/figures/Fig2_Myb_domain_distribution.png)


## Reproducibility

Create environment:conda env create -f environment.yml

Run scripts:python scripts/01_extract_sequences.py
python scripts/02_sequence_statistics.py
python scripts/03_count_domains.py
Rscript scripts/04_plot_length_distribution.R



## Project Structure
. ├── data/ ├── scripts/ ├── results/ ├── environment.yml └── README.md


## Author

ChenBaiyuan
College of Agronomy, Hebei Agricultural University.
This project was completed as part of independent bioinformatics training.