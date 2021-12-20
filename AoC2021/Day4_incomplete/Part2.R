# Day 4, part 1

input <- readLines("input2.txt")
boards <- matrix(nrow = 5, ncol = 5)
allboards <- c()

n <- 1
for (i in 1:length(input)){
  boards <- matrix(nrow = 5, ncol = 5)
  if (nchar(input[i]) == 0){
    for (k in 1:5){
      boards[k,] <- as.numeric(tail(strsplit(input[k+i], "\\s+")[[1]], 5))
    }
    allboards[[n]] <- boards
    n <- n + 1
  }
  rm(boards)
}

win <- 0
k <- 1
numbers <- as.numeric(strsplit(input[1], ",")[[1]])

winning_boards <- c()
o <- 1

for (number in numbers){
  k <- length(allboards)
  win <- 0
  while (win == 0){
    allboards[[k]][which(allboards[[k]] == number)] <- NA
    for (rows in 1:5){
      if (all(is.na(allboards[[k]][rows,]))){
        winning_boards[[o]] <- allboards[[k]]
        allboards <- allboards[-k]
        win <- 1
        o <- o + 1
      }
    }
    for (cols in 1:5){
      if (all(is.na(allboards[[k]][,cols]))){
        winning_boards[[o]] <- allboards[[k]]
        allboards <- allboards[-k]
        win <- 1
        o <- o + 1
      }
    }
  }
}



#answer <- winning_number[[1]] * (sum(as.numeric(winning_board[[1]]), na.rm = TRUE))
#print(answer)

# Answer: 