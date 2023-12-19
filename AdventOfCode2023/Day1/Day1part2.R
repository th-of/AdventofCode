# Day 1 - part 2
library(stringi)

input <- readLines("input.txt")

answers <- as.data.frame(matrix(NA, ncol = 1, nrow = 9), row.names = c(1:9))
colnames(answers) <- "Index"
n <- 1
ans <- c()
positions <- c()
for (word in input){
  input1 <- gsub("one", "1", word)
  input2 <- gsub("two", "2", word)
  input3 <- gsub("three", "3", word)
  input4 <- gsub("four", "4", word)
  input5 <- gsub("five", "5", word)
  input6 <- gsub("six", "6", word)
  input7 <- gsub("seven", "7", word)
  input8 <- gsub("eight", "8", word)
  input9 <- gsub("nine", "9", word)
  combed <- c(input1, input2, input3, input4, input5, input6, input7, input8, input9)
  for (a in 1:9){
    positions[a] <- min(gregexpr("[1-9]", combed[a])[[1]])
  }
  positions[which(positions < 0)] <- NA
  firstnum <- strsplit(combed[which.min(positions)], "")[[1]][min(positions, na.rm = T)]
  for (b in 1:9){
    positions[b] <- min(gregexpr("[1-9]", paste0(rev(strsplit(combed[b], "")[[1]]), collapse = ""))[[1]])
  }
  positions[which(positions < 0)] <- NA
  lastnum <- rev(strsplit(combed[which.min(positions)], "")[[1]])[min(positions, na.rm = T)]
  ans[n] <- as.numeric(paste0(firstnum, lastnum, sep = ""))
  n <- n+1
}
# Answer:
print(ans)
print(sum(ans))

# Answer: 53312
