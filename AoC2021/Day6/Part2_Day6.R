# Day 6, part 2

input <- readLines("input2.txt")

## Input data parsing:

numbers <- as.numeric(unlist(strsplit(input, ",")))
# 
# for (n in 1:256){
#   for (i in 1:length(numbers)){
#     if (numbers[i] >= 0){
#       numbers[i] <- numbers[i] - 1
#     }
#     if (numbers[i] < 0){
#       numbers[i] <- 6
#       numbers[length(numbers)+1] <- 8
#     }
#   }
#   print(paste("Day:", n, "Answer:", length(numbers)))
# }

#print(numbers)
# Faster implementation:
days <- 256
day <- c()
answers <- c()

for (a in 1:days){
  numbers[which(numbers >= 0)] <- numbers[which(numbers >= 0)] - 1
  numbers <- c(numbers, rep(8, sum(numbers < 0)))
  numbers[which(numbers < 0)] <- 6
}

answer <- length(numbers)
write(answer, "Answer_AoC_Part2")
