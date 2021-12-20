# Day 7, part 2

input <- readLines("input.txt")

# Parse
positions <- as.numeric(unlist(strsplit(input, ",")))

fuel <- function(positions, corrected){
  answer <- c()
  for (i in 1:length(positions)){
    if (positions[i] == corrected){
      answer[i] <- 0
    } else {
      answer[i] <- tail(cumsum(1:abs(positions[i]-corrected)), 1)
    }
    
  }
  return(sum(answer))
}

answers <- c()
for (n in 1:500){
  answers[n] <- fuel(positions, n)
}

final_answer <- min(answers)
print(final_answer)

## Answer: 94862124