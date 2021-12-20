# Day 6, part 2

input <- readLines("input2.txt")

## Input data parsing:

numbers <- as.numeric(unlist(strsplit(input, ",")))

for (n in 1:256){
  for (i in 1:length(numbers)){
    if (numbers[i] >= 0){
      numbers[i] <- numbers[i] - 1
    }
    if (numbers[i] < 0){
      numbers[i] <- 6
      numbers[length(numbers)+1] <- 8
    }
  }
  #print(paste("Day:", n, "Answer:", length(numbers)))
}

answer <- length(numbers)
print(answer)
#print(numbers)
# Faster implementation:

