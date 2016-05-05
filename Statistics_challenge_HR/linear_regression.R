x <- c(95,85,80,70,60)
y <- c(85,95,70,65,70)

lin_reg <- lm(y ~ x)
summary(lin_reg)

lsfit(x, y, intercept = TRUE)

x_fcst <- 80
y_80 <- lin_reg$coefficients[1] + (lin_reg$coefficients[2]*x_fcst)
round(y_80, digits = 1)