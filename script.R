library(igraph)

csv = read.csv('users/user_181_net.csv',sep=' ')

new.csv <- as.numeric(as.factor(c(csv[,1], csv[,2])))

fixed.csv <- csv
fixed.csv[,1] <- new.csv[1:nrow(csv)]
fixed.csv[,2] <- new.csv[(1+nrow(csv)):length(new.csv)]

g = graph.adjlist(fixed.csv)
