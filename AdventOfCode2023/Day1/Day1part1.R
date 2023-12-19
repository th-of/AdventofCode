# Day 1 - part 1

input <- readLines("input.txt")
answers <- c()
for (i in 1:length(input)){
  test <- na.omit(as.numeric(strsplit(input[i], "")[[1]]))[1]
  test1 <- tail(na.omit(as.numeric(strsplit(input[i], "")[[1]])), 1)
  answers[i] <- as.numeric(paste(c(test, test1), collapse = ""))
}
print(sum(answers))