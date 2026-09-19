# ============================================================
# 07_tree_visualization.R
# 陆地棉MYB系统发育树可视化 + GhMYB36相关基因配对分析
# 输入: myb_tree_clean2.treefile, myb36_confirmed_in_760.txt
# 输出: Fig3a_MYB_tree_overview_labeled.png
#       results/tables/GhMYB36_gene_pairs.csv
# ============================================================

library(ggplot2)
library(ggtree)
library(treeio)
library(tidytree)
library(dplyr)
library(phangorn)

setwd("~/bioinfo_project")

# ---------- 读取数据 ----------
tree <- read.newick("myb_tree_clean2.treefile")
confirmed <- readLines("myb36_confirmed_in_760.txt")

tip_data <- data.frame(label = tree$tip.label) %>%
  mutate(highlight = ifelse(label %in% confirmed, "GhMYB36-related", "other"),
         show_label = ifelse(label %in% confirmed, label, ""))

# 挑选代表性基因用于全景图标注(分布在树不同位置的4个代表)
representative_genes <- c("XP_016721289.1", "XP_016704629.2",
                           "XP_016744798.2", "XP_016667750.1")

tip_data <- tip_data %>%
  mutate(show_label2 = ifelse(label %in% representative_genes, label, ""))

# ---------- 图3a: 全景图 ----------
p <- ggtree(tree, layout = "rectangular", size = 0.15) %<+% tip_data +
  geom_tippoint(aes(color = highlight), size = 0.8) +
  geom_tiplab(aes(label = show_label2), color = "#D62728",
              size = 2.5, fontface = "bold") +
  scale_color_manual(values = c("GhMYB36-related" = "#D62728", "other" = "grey75")) +
  theme_tree() +
  theme(legend.position = "right", legend.title = element_blank())

ggsave("results/figures/Fig3a_MYB_tree_overview_labeled.png",
       p, width = 8, height = 30, dpi = 300, bg = "white", limitsize = FALSE)

cat("图3a已保存: results/figures/Fig3a_MYB_tree_overview_labeled.png\n")

# ---------- 基因配对分析: GhMYB36相关基因的姐妹对关系 ----------
pairs_info <- data.frame()
for (gene in confirmed) {
  node <- which(tree$tip.label == gene)
  parent_node <- tree$edge[tree$edge[,2] == node, 1]
  neighbors <- tree$tip.label[phangorn::Descendants(tree, parent_node, type = "tips")[[1]]]
  partner <- setdiff(neighbors, gene)
  pairs_info <- rbind(pairs_info, data.frame(gene = gene,
                                               partner = paste(partner, collapse=";"),
                                               cluster_size = length(neighbors)))
}
write.csv(pairs_info, "results/tables/GhMYB36_gene_pairs.csv", row.names = FALSE)
cat("配对表格已保存: results/tables/GhMYB36_gene_pairs.csv\n")
cat("共分析", nrow(pairs_info), "个GhMYB36相关基因的进化配对关系\n")
