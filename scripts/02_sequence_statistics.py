"""
Script:
    Calculate protein length statistics of MYB candidates

Input:
    myb_candidates.fasta

Output:
    results/tables/MYB_sequence_length.csv

Description:
    Calculate amino acid length distribution statistics
    for identified cotton MYB proteins.
"""
from Bio import SeqIO
import csv
import statistics


fasta_file = "myb_candidates.fasta"


records = []


for record in SeqIO.parse(fasta_file, "fasta"):

    length = len(record.seq)

    records.append(
        (
            str(record.id),
            length
        )
    )


# 输出csv
with open(
    "results/tables/MYB_sequence_length.csv",
    "w",
    newline=""
) as f:

    writer = csv.writer(f)

    writer.writerow(
        ["gene_id", "length"]
    )

    writer.writerows(records)


lengths = [
    x[1] for x in records
]


print("Total proteins:", len(records))

print("Minimum length:", min(lengths))
print("Maximum length:", max(lengths))
print("Mean length:", statistics.mean(lengths))
print("Median length:", statistics.median(lengths))
