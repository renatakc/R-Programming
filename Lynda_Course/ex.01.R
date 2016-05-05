x <- 1:5

install.packages("WideLM")
install.packages("grid")

library(WideLM)

x1 <- 0:10
x2 <- 10:0
x3 <- seq(10)
setwd("C:/Users/Re/Documents/R/Lynda_Course/Ex_Files_RStats_EssT/Exercise Files/Ch01/01_07/final")

trends <- read.csv("GoogleTrends.csv", header = TRUE)

data("UCBAdmissions")

plot(UCBAdmissions)

?margin.table

admit.dept <- margin.table(UCBAdmissions, margin = 3)

fix(admit.dept)
View(admit.dept)

