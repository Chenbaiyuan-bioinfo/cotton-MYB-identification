"""
Script:
    Count MYB domain numbers per protein

Input:
    myb_domains.txt

Output:
    results/tables/domain_counts.txt

Description:
    Parse HMMER hmmscan domtblout results
    and calculate domain copy numbers.
"""
from collections import defaultdict

domain_counts = defaultdict(int)

with open("myb_domains.txt") as f:
    for line in f:

        if line.startswith("#"):
            continue

        parts = line.split()

        # hmmscan:
        # 第1列是HMM名字
        # 第4列是query蛋白ID

        gene_id = parts[3]

        domain_counts[gene_id] += 1


with open("domain_counts.txt","w") as out:

    out.write("gene_id\tdomain_count\n")

    for gid,count in domain_counts.items():

        out.write(f"{gid}\t{count}\n")


print("统计完成")
print("基因数量:",len(domain_counts))

for x in list(domain_counts.items())[:10]:
    print(x)
