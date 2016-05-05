x <- c(10, 9.8, 8, 7.8, 7.7, 7, 6, 5, 4, 2)
y <- c(200, 44, 32, 24, 22, 17, 15, 12, 8, 4)

Pearson <- cor(x, y, use = "all.obs", method = "pearson")
Spearman <- cor(x, y, use = "all.obs", method = "spearman")



