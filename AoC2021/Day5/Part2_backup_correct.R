# Day 5, part 2
library("semigeom")
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

# Diagonal lines: 45 or -45 degrees.
# -135: start bottom left
# 135: Top left
# -45: top left
# 45: bottom left
for (i in 1:length(x1)){
  deg <- (atan2(x2[i]-x1[i], y2[i]-y1[i])) * 180 / pi
  min_x <- min(c(x1[i], x2[i]))
  max_x <- max(c(x1[i], x2[i]))
  min_y <- min(c(y1[i], y2[i]))
  max_y <- max(c(y1[i], y2[i]))
  if ((deg == 135) | (deg == -45)){
    start <- sub2ind(max_y, min_x, nrow(o_floor))
    stop <- sub2ind(min_y, max_x, nrow(o_floor))
    seq1 <- seq(start, stop, nrow(o_floor)-1)
    for (a in seq1){
      o_floor[a] <- o_floor[a] + 1
    }
  }
  if ((deg == -135) | (deg == 45)){
    start_2 <- sub2ind(min_y, min_x, nrow(o_floor))
    stop_2 <- sub2ind(max_y, max_x, nrow(o_floor))
    seq2 <- seq(start_2, stop_2, nrow(o_floor)+1)
    for (p in seq2){
      o_floor[p] <- o_floor[p] + 1
    }
  }
  if ((x1[i] == x2[i]) | (y1[i] == y2[i])){
    o_floor[y1[i]:y2[i],x1[i]:x2[i]] <- o_floor[y1[i]:y2[i],x1[i]:x2[i]] + 1
  }
}

answer <- sum(o_floor > 1)
print(answer)

# Answer: 19081

## x1,y1 -> x2,y2
#An entry like 1,1 -> 1,3 covers points 1,1, 1,2, and 1,3.
#An entry like 9,7 -> 7,7 covers points 9,7, 8,7, and 7,7.






