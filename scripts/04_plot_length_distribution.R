# Script:
#     Plot protein length distribution of cotton MYB proteins
#
# Input:
#     results/tables/MYB_sequence_length.csv
#
# Output:
#     results/figures/Fig1_Myb_length_distribution.png
#
# Description:
#     Generate publication-style visualization
#     of MYB protein length distribution.
library(ggplot2)


# 读取数据
data <- read.csv(
"results/tables/MYB_sequence_length.csv"
)


# 查看数据
summary(data$length)


# 绘图
p <- ggplot(
data,
aes(x=length)
)+
geom_histogram(
bins=40
)+
theme_classic()+
labs(
title="Protein Length Distribution of Cotton MYB Proteins",
x="Protein length (aa)",
y="Number of proteins"
)


# 保存

ggsave(
"results/figures/Fig1_Myb_length_distribution.png",
p,
width=7,
height=5,
dpi=300
)
