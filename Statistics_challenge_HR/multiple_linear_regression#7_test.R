ft1 <- c(0.18, 1.0, 0.92, 0.07, 0.85, 0.99, 0.87)
ft2 <- c(0.89, 0.26, 0.11, 0.37, 0.16, 0.41, 0.47)
price <- c(109.85, 155.72, 137.66, 76.17, 139.75, 162.6, 151.77)

house_df <- cbind.data.frame(ft1, ft2, price)

x <- function(y) {
  for (i in 1:ncol(y)) {
    names(y)[i] <- i
  }
  y
}


feat_num <- 2
house_qty <- 7

ft11 <- c(0.49, 0.57, 0.56, 0.76)
ft21 <- c(0.18, 0.83, 0.64, 0.18)

house_wo_price <- cbind.data.frame(ft1 = ft11, ft2 =  ft21)

house_df <- x(house_df)
house_wo_price <- x(house_wo_price)

price <- as.vector(house_df[,ncol(house_df)])
features <- as.vector(house_df[-1])

regression <- lm(3 ~ ., data = house_df)

prediction <- as.data.frame(predict(regression, house_wo_price))
