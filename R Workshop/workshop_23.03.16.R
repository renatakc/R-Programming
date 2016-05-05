country <- c("United Kingdom", "France", "Spain", "Germany")
popularity <- c(20,21,19,15)

library(googleVis)

geodata <- data.frame(country, popularity)

geochart <- gvisGeoChart(geodata, locationvar = "country", colorvar = "popularity")

plot(geochart)

data("diamonds", "economics")

bar.graph <- ggplot(data = diamonds, aes(x = cut)) + geom_bar(colour = "pink", fill = "navy", aes(fill = "clarity"))
plot(bar.graph)

data("mtcars")

mtcars1 <- mtcars[,-c(8,9)]

View(mtcars1)

medians <- apply(mtcars1, 2, median)
View(medians)

mads <- apply(mtcars1, 2, mad)

mtcars2 <- scale(mtcars1, center = medians, scale = mads)

View(mtcars2)

mtcars3 <- dist(mtcars2, method = "euclidean")

print(mtcars3, digits = 2)

clusters <- hclust(mtcars3, method = "ward.D2")
plot(clusters)
plot(clusters, hang = -1)

rect.hclust(clusters, 7)

clusters.6 <- cutree(clusters, 6)

table(clusters.6)

options(digits = 2)

means.scalled <- aggregate(mtcars2, list(clusters.6), mean)

means2 <- aggregate(mtcars[,-c(8,9)], list(clusters.6), mean)

mtcars.membership <- cbind(clusters.6, mtcars)

install.packages("sparcl")

library(sparcl)

ColorDendrogram(clusters, y = clusters.6, labels = names(clusters.6), branchlength = 5)