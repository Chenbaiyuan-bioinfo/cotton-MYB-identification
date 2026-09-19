Genome-wide Identification and Characterization of MYB Gene Family in Cotton

Overview

MYB transcription factors are one of the largest transcription factor families in plants and play important roles in plant development, metabolism and stress responses.

MYB genes are known to be involved in fiber development and stress responses in cotton, making them important targets for functional studies.

In this project, a genome-wide identification pipeline was established to identify MYB family proteins in cotton based on Hidden Markov Model (HMM)-based domain searching, followed by independent validation and phylogenetic analysis.

Dataset

Species:
Cotton (Gossypium hirsutum)

Genome assembly:
GCF_007990345.1 (TM-1 v2.1)

Protein dataset:
Cotton whole genome protein sequences downloaded from NCBI.

Number of proteins searched:
111,813

Raw protein sequences are not included in this repository due to file size. They can be downloaded from the NCBI Genome database under accession GCF_007990345.1, or via NCBI Datasets.

Workflow

Cotton protein sequences
        │
        ▼
HMMER search against MYB domain model (PF00249)
        │
        ▼
Candidate MYB protein identification
(E-value < 1e-10)
        │
        ▼
Sequence extraction
(760 high-confidence candidates)
        │
        ├──► Protein length analysis
        │
        ├──► MYB domain number analysis
        │
        ├──► BLAST-based independent validation
        │       │
        │       └──► GhMYB36-related candidates
        │
        └──► Multiple sequence alignment
                    │
                    ▼
                MAFFT
                    │
                    ▼
              Alignment trimming
                 trimAl
                    │
                    ▼
             Tree construction
               FastTree
                    │
                    ▼
          Outlier filtering
          2 rounds / 42 removed
                    │
                    ▼
          Final phylogenetic tree
             718 candidates
                    │
                    ▼
              Tree visualization
                 ggtree

Methods

1. MYB domain identification

The MYB DNA-binding domain model (PF00249) was used for HMMER-based screening.

High-confidence candidates were selected using:

E-value < 1e-10

A total of 760 high-confidence MYB candidate proteins were retained for downstream analysis.

2. Sequence analysis

Protein sequences were analyzed for:

- Protein length distribution
- MYB domain copy number

3. Visualization

Figures were generated using R and the "ggplot2" and "ggtree" packages.

4. Independent validation via BLAST homology search

To independently cross-validate the candidate gene set, a BLAST-based homology search was performed using the Arabidopsis thaliana MYB36 protein as a reference.

The analysis was inspired by previous research on the GhMYB36 gene family and its role in salt tolerance. In that study, GhMYB36D13 was experimentally validated using VIGS.

Because the reference genome versions differ between studies, direct gene ID mapping was not performed. Instead, the Arabidopsis thaliana AtMYB36 protein (NCBI accession: NP_200570.1) was used as a query against the cotton protein dataset.

The BLAST-based validation produced:

- 465 significant hits with E-value < 1e-20
- 13 candidates retained after filtering by alignment length (≥200 aa) and sequence identity (≥50% for the high-confidence group)
- All 13 candidates were present in the original set of 760 high-confidence MYB candidates

Thus, the 13 validated candidates showed a 100% recovery rate within the original high-confidence MYB candidate set.

Full validation results are provided in:

myb36_validation_evidence/

5. Phylogenetic analysis

A maximum-likelihood phylogenetic tree was constructed to investigate the evolutionary relationships among the MYB candidate proteins.

The following tools were used:

- Multiple sequence alignment: MAFFT ("--auto")
- Alignment trimming: trimAl ("-automated1")
- Phylogenetic tree construction: FastTree
- Tree visualization: ggtree

To reduce the influence of highly divergent or potentially fragmented sequences, terminal branch lengths were examined and outlier sequences were removed using a mean + 3×SD threshold.

Two rounds of filtering were performed:

- Round 1: 34 sequences removed
- Round 2: 8 sequences removed
- Total: 42 sequences removed

None of the removed sequences overlapped with the GhMYB36-validated candidate set.

The final phylogenetic tree contained:

718 MYB candidate proteins

Results

A total of:

760 MYB candidate proteins

were identified from the cotton protein dataset using HMMER-based screening.

Most candidates contain two MYB domains, corresponding to the typical R2R3-type MYB structure commonly observed in plants.

Protein length distribution

"Protein length distribution" (results/figures/Fig1_Myb_length_distribution.png)

MYB domain number distribution

"MYB domain distribution" (results/figures/Fig2_Myb_domain_distribution.png)

Independent validation of candidate genes

A BLAST-based independent validation identified 13 candidate proteins related to the AtMYB36 reference sequence after applying alignment length and sequence identity filters.

All 13 candidates were found within the original set of 760 high-confidence MYB candidates.

This independent validation provides additional support for the MYB candidate identification pipeline.

Full evidence files are available in:

myb36_validation_evidence/

Phylogenetic tree

"Phylogenetic tree" (results/figures/Fig3a_MYB_tree_overview_labeled.png)

The GhMYB36-related candidates are distributed across multiple positions in the phylogenetic tree, with several candidates occurring as closely related sister pairs.

This pattern is compatible with the duplicated gene structure expected in the allotetraploid genome of cultivated cotton, although detailed subgenome assignment would require additional genomic annotation information.

The complete pairing information is available in:

results/tables/GhMYB36_gene_pairs.csv

The identified MYB candidates and the independently validated GhMYB36-related genes provide a resource for future functional studies, including experimental screening of genes potentially involved in salt tolerance and cotton fiber development.

Reproducibility

Create the Conda environment

conda env create -f environment.yml

Then activate the environment specified in "environment.yml".

Run the analysis pipeline

python scripts/01_extract_sequences.py
python scripts/02_sequence_statistics.py
python scripts/03_count_domains.py

Rscript scripts/04_plot_length_distribution.R
Rscript scripts/05_plot_domain_distribution.R

bash scripts/06_phylogenetic_tree.sh

Rscript scripts/07_tree_visualization.R

Note: large raw data files, including the cotton protein FASTA file and BLAST databases, are not included in this repository due to file size.

The original cotton protein dataset can be obtained from NCBI using genome assembly accession:

GCF_007990345.1

Project Structure

.
├── data/
│   └── PF00249.hmm
│
├── scripts/
│   ├── 01_extract_sequences.py
│   ├── 02_sequence_statistics.py
│   ├── 03_count_domains.py
│   ├── 04_plot_length_distribution.R
│   ├── 05_plot_domain_distribution.R
│   ├── 06_phylogenetic_tree.sh
│   └── 07_tree_visualization.R
│
├── results/
│   ├── figures/
│   │   ├── Fig1_Myb_length_distribution.png
│   │   ├── Fig2_Myb_domain_distribution.png
│   │   └── Fig3a_MYB_tree_overview_labeled.png
│   │
│   └── tables/
│       ├── MYB_sequence_length.csv
│       ├── domain_counts.txt
│       ├── gene_lengths.txt
│       └── GhMYB36_gene_pairs.csv
│
├── myb36_validation_evidence/
│
├── environment.yml
├── .gitignore
└── README.md

Author

Chen

This project was completed as part of independent bioinformatics training, combining wet-lab experience in cotton molecular biology, including VIGS and vector construction, with a self-taught genome-wide bioinformatics analysis pipeline.

---

棉花MYB基因家族的全基因组鉴定与特征分析

概述

MYB转录因子是植物中最大的转录因子家族之一，在植物发育、代谢和胁迫响应中发挥重要功能。

研究表明，MYB基因参与棉花的纤维发育和胁迫响应，是功能研究的重要靶标。

本项目基于隐马尔可夫模型（HMM）的结构域搜索方法，建立棉花MYB基因家族的全基因组鉴定流程，并进一步结合BLAST独立验证和系统发育分析，对候选MYB蛋白进行综合分析。

数据集

物种：

棉花（Gossypium hirsutum）

参考基因组版本：

GCF_007990345.1（TM-1 v2.1）

蛋白质序列：

从NCBI下载的棉花全基因组蛋白质序列。

搜索序列总数：

111,813条。

原始蛋白质序列因文件体积较大未包含在本仓库中，可根据GCF_007990345.1从NCBI Genome数据库获取。

分析流程

棉花全基因组蛋白质序列
        ↓
HMMER搜索MYB结构域模型（PF00249）
        ↓
高可信度候选MYB蛋白筛选
（E-value < 1e-10）
        ↓
获得760个候选蛋白
        ↓
蛋白长度及MYB结构域数量分析
        ↓
BLAST独立验证
        ↓
多序列比对（MAFFT）
        ↓
比对修剪（trimAl）
        ↓
FastTree构建系统发育树
        ↓
两轮异常值筛除
（共42个）
        ↓
最终系统发育树
（718个候选蛋白）
        ↓
ggtree可视化

方法

1. MYB结构域鉴定

使用MYB DNA结合结构域模型（PF00249）进行HMMER搜索。

以：

E-value < 1e-10

作为高可信度候选蛋白的筛选标准。

最终获得760个高可信度MYB候选蛋白。

2. 蛋白质序列分析

对候选MYB蛋白进行以下分析：

- 蛋白质长度分布
- MYB结构域数量分布

3. 数据可视化

使用R语言及"ggplot2"、"ggtree"等工具进行结果可视化。

4. 基于BLAST同源检索的独立验证

为了进一步验证MYB候选基因集合的可靠性，本项目采用BLAST同源检索进行独立交叉验证。

参考相关GhMYB36基因家族研究，以拟南芥AtMYB36蛋白作为参考序列。由于不同研究所使用的棉花参考基因组版本不同，本项目未直接进行基因ID映射，而是采用蛋白序列同源性进行验证。

使用拟南芥AtMYB36蛋白（NCBI登录号：NP_200570.1）作为查询序列，对棉花蛋白质数据集进行BLAST搜索。

结果如下：

- 获得465条显著匹配序列（E-value < 1e-20）
- 根据比对长度（≥200 aa）和序列一致性（≥50%）进一步筛选
- 最终获得13个候选蛋白
- 13个候选蛋白全部存在于原始760个高可信度MYB候选集合中

因此，这13个候选蛋白在原始MYB候选集合中的恢复率为：

100%

完整验证结果保存在：

myb36_validation_evidence/

5. 系统发育分析

为了进一步研究候选MYB蛋白之间的进化关系，构建最大似然系统发育树。

分析工具及参数：

- 多序列比对：MAFFT（"--auto"）
- 比对修剪：trimAl（"-automated1"）
- 系统发育树构建：FastTree
- 系统树可视化：ggtree

为了降低高度异常或可能存在序列片段化的蛋白对系统树造成的影响，根据末端分支长度进行异常值筛选。

采用：

均值 + 3 × 标准差

作为异常分支判断阈值。

共进行了两轮筛选：

- 第一轮：删除34条序列
- 第二轮：删除8条序列
- 共删除42条序列

被删除的42条序列均未与GhMYB36相关验证候选基因发生重叠。

最终系统发育树包含：

718个MYB候选蛋白

结果

从棉花蛋白质组的111,813条蛋白质序列中，通过HMMER结构域搜索共获得：

760个高可信度MYB候选蛋白

其中大多数候选蛋白含有两个MYB结构域，符合植物中典型R2R3型MYB转录因子的结构特征。

蛋白长度分布

"蛋白长度分布" (results/figures/Fig1_Myb_length_distribution.png)

MYB结构域数量分布

"MYB结构域分布" (results/figures/Fig2_Myb_domain_distribution.png)

候选基因的独立验证

通过BLAST同源检索进行独立交叉验证，在经过比对长度和序列一致性筛选后，共获得13个与AtMYB36相关的候选蛋白。

这13个候选蛋白全部存在于原始760个高可信度MYB候选蛋白集合中，恢复率达到：

100%

该结果为基于HMMER获得的MYB候选蛋白集合提供了额外的独立支持。

完整验证证据保存在：

myb36_validation_evidence/

系统发育树

"系统发育树" (results/figures/Fig3a_MYB_tree_overview_labeled.png)

GhMYB36相关候选基因在系统发育树的多个位置出现，其中部分候选基因形成紧密的姐妹关系。

这种分布模式与陆地棉异源四倍体基因组中普遍存在的基因复制和同源基因结构相符，但具体的A、D亚基因组归属仍需要结合进一步的基因组注释信息进行确认。

完整的GhMYB36相关基因配对信息保存在：

results/tables/GhMYB36_gene_pairs.csv

本项目获得的MYB候选蛋白集合以及经过独立验证的GhMYB36相关候选基因，可为后续功能研究提供候选资源，例如利用VIGS等实验方法进一步筛选与棉花耐盐性、纤维发育等性状相关的候选基因。

可复现性

创建Conda环境

conda env create -f environment.yml

然后激活"environment.yml"中指定的环境。

按顺序运行分析流程

python scripts/01_extract_sequences.py
python scripts/02_sequence_statistics.py
python scripts/03_count_domains.py

Rscript scripts/04_plot_length_distribution.R
Rscript scripts/05_plot_domain_distribution.R

bash scripts/06_phylogenetic_tree.sh

Rscript scripts/07_tree_visualization.R

注：由于文件体积较大，原始棉花蛋白质序列以及BLAST数据库等大型文件未包含在GitHub仓库中。

原始棉花蛋白质数据可根据以下NCBI基因组组装编号获取：

GCF_007990345.1

项目结构

.
├── data/
│   └── PF00249.hmm
│
├── scripts/
│   ├── 01_extract_sequences.py
│   ├── 02_sequence_statistics.py
│   ├── 03_count_domains.py
│   ├── 04_plot_length_distribution.R
│   ├── 05_plot_domain_distribution.R
│   ├── 06_phylogenetic_tree.sh
│   └── 07_tree_visualization.R
│
├── results/
│   ├── figures/
│   │   ├── Fig1_Myb_length_distribution.png
│   │   ├── Fig2_Myb_domain_distribution.png
│   │   └── Fig3a_MYB_tree_overview_labeled.png
│   │
│   └── tables/
│       ├── MYB_sequence_length.csv
│       ├── domain_counts.txt
│       ├── gene_lengths.txt
│       └── GhMYB36_gene_pairs.csv
│
├── myb36_validation_evidence/
│
├── environment.yml
├── .gitignore
└── README.md

作者

陈

本项目为独立生物信息学学习课题，结合棉花分子生物学湿实验经验（包括VIGS、载体构建等）与自学生物信息学知识，建立并完成了棉花MYB基因家族的全基因组鉴定、独立验证及系统发育分析流程。