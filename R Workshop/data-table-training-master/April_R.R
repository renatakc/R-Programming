#install.packages("data.table")

#library(data.table)

flights <- fread("flights14.csv", header = TRUE)

ua <- flights[carrier == "UA"]
number_per_carrier <- flights[, .N, by = carrier]

avg_delay <- flights[,.(Delays = mean(arr_delay)),by = carrier]

keys <- setkey(flights, year, dep_time, tailnum)

total_delay <- 

View(flights)
