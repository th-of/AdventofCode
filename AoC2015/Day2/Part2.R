# Day 2, part 2
input <- readLines("input.txt")
input <- strsplit(input, "x")

answer <- c()
i = 0
for (lines in input){
  i = i + 1
  answer[i] <- prod(as.numeric(lines[1]), as.numeric(lines[2]), as.numeric(lines[3])) + sum(2*(as.numeric(lines[-which.max(lines)])))
}
print(sum(answer))

#Answer: 3812909

