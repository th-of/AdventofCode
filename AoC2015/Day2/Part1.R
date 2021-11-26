# Day 2, part 1
input <- readLines("input.txt")
input <- strsplit(input, "x")

answer <- c()
i = 0
for (lines in input){
  i = i + 1
  side1 <- 2*as.numeric(lines[1])*as.numeric(lines[2])
  side2 <- 2*as.numeric(lines[2])*as.numeric(lines[3])
  side3 <- 2*as.numeric(lines[3])*as.numeric(lines[1])
  test <- c(side1, side2, side3)
  answer[i] <- sum(test) + prod(as.numeric(lines[-which.max(lines)]))
}
print(sum(answer))

#Answer: 1598415

