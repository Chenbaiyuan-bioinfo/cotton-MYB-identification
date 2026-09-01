from Bio import SeqIO

with open("gene_lengths.txt", "w") as out_f:
    out_f.write("gene_id\tlength\n")
    for record in SeqIO.parse("myb_candidates.fasta", "fasta"):
        out_f.write(record.id + "\t" + str(len(record.seq)) + "\n")

print("完成")
