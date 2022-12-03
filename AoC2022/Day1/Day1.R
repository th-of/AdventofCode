input <- readLines("Day1_input.txt")

elves <- c()
n <- 1

for (i in 1:length(input)){
  if (input[i] == ""){
    n <- n+1
  } else {
    elves[[n]] <- append(elves, input[i])
  }
}