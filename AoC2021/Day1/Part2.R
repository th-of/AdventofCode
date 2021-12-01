# Day 1, part 2

input <- as.numeric(readLines("input.txt"))

counter <- 0

for (n in 1:(length(input)-3)){
  if (sum(input[(n+1):((n+2)+1)]) > sum(input[n:(n+2)]))
  counter <- counter + 1
}

#Answer: 1567 