a <- rbind(c(0,1,0),c(1,0,1),c(1,0,0))
nodenames <- c("a","b","c")
dimnames(a) <- list(nodenames,nodenames)
g <- graph_from_literal(A++B,B-+C,C-+A)

g <- make_tree(27, children = 3, mode="in")
plot(g)

g <- make_full_graph(10, directed = FALSE)
plot(g)

g <- make_star(n=5, mode="undirected")
plot(g)

dolphinEdges <- read.csv(("dolphin_edges.csv"))
View(dolphinEdges)

dolphin <- graph_from_data_frame(dolphinEdges, directed = FALSE)
plot(dolphin)

dolphinvertices <- read.csv("dolphin_vertices.csv")
View(dolphinvertices)

dolphin <- graph_from_data_frame(dolphinEdges, vertices = dolphinvertices, directed = FALSE)
plot(dolphin)

dolphinDFs <- as_data_frame(dolphin, what = "both")
class(dolphin)
head(dolphin)

read_graph(dolphinEdges, format = "edgelist")

library(igraphdata)
data(package = "igraphdata")

data(USairports)
USairports

head(as_data_frame(USairports, what = "edge"))
View(as_data_frame(USairports, what = "edge"))

vertex_attr_names(USairports)
vertex_attr(USairports, "City")

#V is for vertices = columns
V(USairports)
V(USairports)$City[1:5]

V(USairports)$Group <- sample(c("A","B"), vcount(USairports),replace = TRUE)

#E is for edges = row

E(USairports)["JFK" %--% "BOS"]

# Grep the state code from the city
inCal <- grepl("CA$", V(USairports)$City)
inNy <- grepl("NY$", V(USairports)$City)

ca <- V(USairports)[inCal]
ny <- V(USairports)[inNy]

d2vertices <- ego(USairports, nodes = c("JFK","LAX"), order = 2)

g <- make_empty_graph(n=0, directed = FALSE)
g <- g + vertex(c("A","B","C"))
g <- g + edges(c("A","B","C","B"))
plot(g)

head(USairports)

g <- make_lattice(dimvector = c(25,25), circular = FALSE)
plot(g)

View(USairports)
View(as_data_frame((USairports), what = "edge"))

g <- make_ring(10, directed = TRUE, mutual = TRUE)
plot(g)

V(g)$name <- LETTERS[1:10]
plot(g)

plot(dolphin, layout = layout_with_drl(dolphin), vertex.label = NA)
plot(dolphin, layout = layout_with_drl(dolphin))

vowel <- V(g)$name %in% c("A","E","I","O","U") + 1 # gives 1 or 2 plot
plot(g, vertex.shapes=c("circle","square")[vowel], vertex.color = c("red","blue")[vowel])

g <- make_full_graph(4) + vertex(1) + make_full_graph(4)
plot(g)

ec <- eigen_centrality(g)
ec

?cluster_fast_greedy
