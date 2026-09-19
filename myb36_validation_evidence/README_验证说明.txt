===== GhMYB36验证分析证据说明 =====

【验证目的】
确认自己搭建的HMMER鉴定流程(760个MYB候选基因)是否能覆盖已发表论文
报道的、已经过VIGS功能验证的GhMYB36基因。

【使用文件说明】
1. AtMYB36_query.fasta 
   - 拟南芥AtMYB36蛋白序列(NCBI accession: NP_200570.1),作为BLAST种子

2. AtMYB36_vs_cotton_full.tsv
   - BLAST比对全部原始结果(AtMYB36 vs 我的陆地棉全基因组蛋白质集)
   - 列顺序:query_id, subject_id, 相似度%, 比对长度, E-value, bitscore

3. myb36_high_confidence_hits.txt
   - 高置信度同源基因列表(比对长度≥200aa,相似度≥50%),共7个

4. myb36_all_candidates.txt
   - 广义候选基因列表(比对长度≥200aa),共13个

5. myb36_confirmed_in_760.txt
   - 上述基因中,命中我760个候选基因列表的结果,共13个(100%命中)

【核心结论】
高置信度组:7/7 命中(100%)
广义候选组:13/13 命中(100%)
说明本流程未漏检任何已知的AtMYB36同源基因。
