"""
Script:
    Extract MYB candidate protein sequences

Input:
    cotton_protein.faa
    myb_gene_ids.txt

Output:
    myb_candidates.fasta

Description:
    Extract MYB candidate proteins identified from
    HMMER domain search results.
"""
from Bio import SeqIO

# 读取目标基因ID列表
target_ids = set()
with open("myb_gene_ids.txt") as f:
    for line in f:
        target_ids.add(line.strip())

print("目标基因数量:", len(target_ids))

# 遍历棉花全部蛋白质序列，把匹配上的写入新文件
count = 0
with open("myb_candidates.fasta", "w") as out_f:
    for record in SeqIO.parse("cotton_protein.faa", "fasta"):
        if record.id in target_ids:
            SeqIO.write(record, out_f, "fasta")
            count += 1

print("成功提取序列数量:", count)
