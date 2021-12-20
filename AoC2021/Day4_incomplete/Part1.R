# Day 4, part 1

input <- readLines("input.txt")
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

winning_board <- c()
winning_number <- 0

numbers <- as.numeric(strsplit(input[1], ",")[[1]])
o <- 1
for (number in numbers){
  for (k in 1:length(allboards)){
    allboards[[k]][which(allboards[[k]] == number, arr.ind = TRUE)] <- "BINGO"
    for (rows in 1:5){
      if (all(allboards[[k]][rows,] == "BINGO")){
        winning_board[[o]] <- allboards[[k]]
        winning_number[o] <- number
        o <- o + 1
      }
    }
      for (cols in 1:5){
        if (all(allboards[[k]][,cols] == "BINGO")){
          winning_board[[i]] <- allboards[[k]]
          winning_number[o] <- number
          o <- o + 1
        }
      }
  }
}

answer <- winning_number[[1]] * (sum(as.numeric(winning_board[[1]]), na.rm = TRUE))
print(answer)

# Answer: 72770