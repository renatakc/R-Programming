#!/usr/bin/env Rscript

options(warn = -1)

current_houses = read.csv("current_houses.txt")
new_houses = read.csv("new_houses.txt")

mod <- lm(current_houses$price ~ ., data = current_houses)

for(i in seq(1:nrow(new_houses))){
  value <- predict(mod, new_houses[i,])
  write(value, stdout())
}