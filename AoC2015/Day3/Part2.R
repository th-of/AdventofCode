# Day 3, part 2
library("stringr")
input1 <- readLines("input.txt")
input <- strsplit(input1, "")[[1]]

houses <- data.frame(matrix(ncol = 400, nrow = 400))
houses[is.na(houses)] <- 0

#First house:
k <- 200
l <- 200
houses[k, l] <- 1

santa <- input[seq(1, length(input), 2)]
robo <- input[seq(2, length(input), 2)]


for (house in santa){
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

k <- 200
l <- 200
for (house in robo){
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

print(sum(houses))

# Answer: 2639