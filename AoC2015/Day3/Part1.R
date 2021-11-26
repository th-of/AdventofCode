# Day 3, part 1
library("stringr")
input1 <- readLines("input.txt")
input <- strsplit(input1, "")[[1]]

houses <- data.frame(matrix(ncol = 400, nrow = 400))
houses[is.na(houses)] <- 0

#First house:
k <- 200
l <- 200
houses[k, l] <- 1

for (house in input){
  if (house == "^"){
    k <- k+1
    houses[k, l] <- 1 #- houses[k, l]
  }
  if (house == "v"){
    k <- k-1
    houses[k, l] <- 1 #- houses[k, l]
  }
  if (house == "<"){
    l <- l-1
    houses[k, l] <- 1 #- houses[k, l]
  }
  if (house == ">"){
    l <- l+1
    houses[k, l] <- 1 #- houses[k, l]
  }
}

# Answer: 2565