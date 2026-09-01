# Cotton MYB domain number distribution

dom_data <- read.table(
  "results/tables/domain_counts.txt",
  header = TRUE,
  sep = "\t"
)

# count domain numbers
domain_count <- table(dom_data$domain_count)

print(domain_count)

# save figure
png(
  "results/figures/Fig2_Myb_domain_number.png",
  width = 900,
  height = 600
)

barplot(
  domain_count,
  main = "Distribution of MYB domain numbers in cotton",
  xlab = "Number of MYB domains",
  ylab = "Number of proteins",
  las = 1
)

dev.off()

print("Figure generated!")
