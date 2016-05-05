#setwd("C:/Users/Re/Documents/R/Houses_project")

rent_prices <- read.csv("rent_price.csv", header = TRUE)

rent_prices <- rent_prices[,c(-5, -6, -7, -8)]

a <- gsub(pattern = "£", replacement = "", rent_prices$X1.Bedroom)
b <- gsub(pattern = "£", replacement = "", rent_prices$X2.Bedrooms)
a <- gsub(pattern = " pw", replacement = "", a)
b <- gsub(pattern = " pw", replacement = "", b)

rent_prices = data.frame(zc = rent_prices$Postcode, 
                         ar = rent_prices$Area, 
                         bed = a, 
                         bedd = b)

head(rent_prices)

write.table(rent_prices,
            file = "rent_prices_c.csv", 
            col.names = TRUE,
            row.names = FALSE,
            sep = ",")

