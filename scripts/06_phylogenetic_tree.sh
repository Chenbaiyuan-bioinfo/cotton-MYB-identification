#!/bin/bash
# ============================================================
# 06_phylogenetic_tree.sh
# 陆地棉MYB家族系统发育树构建流程
# 输入: myb_candidates.fasta (760条高可信度候选基因蛋白序列)
# 输出: myb_tree_clean2.treefile (最终树文件, 718条序列)
# ============================================================

set -e
conda activate bioinfo
cd ~/bioinfo_project

# 第一轮: 初始比对与建树
mafft --auto myb_candidates.fasta > myb_aligned.fasta
trimal -in myb_aligned.fasta -out myb_trimmed.fasta -automated1
fasttree -lg myb_trimmed.fasta > myb_tree_fast.treefile

# 排除第一轮异常基因(34个)
grep -v -F -f outliers_round1.txt myb_gene_ids.txt > myb_gene_ids_clean.txt
seqkit grep -f myb_gene_ids_clean.txt myb_candidates.fasta > myb_candidates_clean.fasta

mafft --auto myb_candidates_clean.fasta > myb_aligned_clean.fasta
trimal -in myb_aligned_clean.fasta -out myb_trimmed_clean.fasta -automated1
fasttree -lg myb_trimmed_clean.fasta > myb_tree_clean.treefile

# 排除第二轮异常基因(8个)
grep -v -F -f outliers_round2.txt myb_gene_ids_clean.txt > myb_gene_ids_clean2.txt
seqkit grep -f myb_gene_ids_clean2.txt myb_candidates.fasta > myb_candidates_clean2.fasta

mafft --auto myb_candidates_clean2.fasta > myb_aligned_clean2.fasta
trimal -in myb_aligned_clean2.fasta -out myb_trimmed_clean2.fasta -automated1
fasttree -lg myb_trimmed_clean2.fasta > myb_tree_clean2.treefile

echo "系统发育树构建完成: myb_tree_clean2.treefile (718条序列)"
echo "共排除42个因序列质量异常导致分支长度显著偏离的候选基因"
