# Day 5, part 1

input <- readLines("input.txt")

# x1,y1 -> x2,y2
# Input parsing
x1 <- c()
y1 <- c()
x2 <- c()
y2 <- c()

for (n in 1:length(input)){
  x1[n] <- as.numeric(strsplit(strsplit(input[n], ",")[[1]], " ")[[1]][1]) + 1
  y1[n] <- as.numeric(strsplit(strsplit(input[n], ",")[[1]], " ")[[2]][1]) + 1
  x2[n] <- as.numeric(strsplit(strsplit(input[n], ",")[[1]], " ")[[2]][3]) + 1
  y2[n] <- as.numeric(strsplit(strsplit(input[n], ",")[[1]], " ")[[3]][1]) + 1
}

dims <- max(c(x1, x2, y1, y2))

o_floor <- matrix(nrow = dims, ncol = dims)
o_floor[,] <- 0

# x1 = x2 or y1 = y2

for (i in 1:length(x1)){
  if ((x1[i] == x2[i]) | (y1[i] == y2[i])){
    o_floor[y1[i]:y2[i],x1[i]:x2[i]] <- o_floor[y1[i]:y2[i],x1[i]:x2[i]] + 1
  }
}

answer <- length(which(o_floor > 1, arr.ind = TRUE)[,1])
print(answer)

## x1,y1 -> x2,y2
#An entry like 1,1 -> 1,3 covers points 1,1, 1,2, and 1,3.
#An entry like 9,7 -> 7,7 covers points 9,7, 8,7, and 7,7.






