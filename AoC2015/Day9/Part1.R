# Day 9, part 1
library(combinat)
data <- readLines("input.txt")
cities <- c()

for (city in data){
  city1 <- strsplit(city, " ")[[1]][1]
  city2 <- strsplit(city, " ")[[1]][3]
  distance <- tail(strsplit(city, " ")[[1]], 1)
  cities <- append(cities, c(city1, city2))
}

uniq_cities <- unique(cities)
allpaths <- permn(uniq_cities)
distances <- setNames(data.frame(matrix(ncol = 8, nrow = 8)), c(uniq_cities))
row.names(distances) <- c(uniq_cities)

for (city in data){
  city1 <- strsplit(city, " ")[[1]][1]
  city2 <- strsplit(city, " ")[[1]][3]
  distance <- as.numeric(tail(strsplit(city, " ")[[1]], 1))
  distances[city1, city2] <- distance
  distances[city2, city1] <- distance
}

pathdistances <- c()

for (paths in allpaths){
  counter <- 0
  for (n in 1:7){
    counter <- counter + distances[paths[n], paths[n+1]]
  }
  pathdistances <- append(pathdistances, counter)
}

answer <- print(min(pathdistances))
print(answer)
#Answer: 251

