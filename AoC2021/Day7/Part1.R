# Day 7, part 1

input <- readLines("input2.txt")

# Parse
positions <- as.numeric(unlist(strsplit(input, ",")))

answers <- sum(abs(positions-median(positions)))