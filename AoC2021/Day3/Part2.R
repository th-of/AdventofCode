# Day 3, part 2

input <-  lapply(strsplit(readLines("input.txt"), ""), as.numeric)
len <- length(input)
rowlen <- length(input[[1]])

test <- as.data.frame(input)
test <- t(test)
row.names(test) <- c(1:length(input))
test2 <- test

for (i in 1:len){
  if (length(test) == rowlen){
    break
  }
  if (mean(test[,i]) == 0.5){
    result <- 1
    test <- test[c(which(test[,i] == result)),]
  } else {
    result <- as.numeric(as.data.frame(table(test[,i]), stringsAsFactors = FALSE)[which.max(data.frame(table(test[,i]))[,2]),1])
    test <- test[c(which(test[,i] == result)),]
  }
}
test
ogr <- strtoi(paste(test, collapse = ""), base = 2)

for (i in 1:len){
  if (length(test2) == rowlen){
    break
  }
  if (mean(test2[,i]) == 0.5){
    result <- 0
    test2 <- test2[c(which(test2[,i] == result)),]
  } else {
    result <- as.numeric(as.data.frame(table(test2[,i]), stringsAsFactors = FALSE)[which.min(data.frame(table(test2[,i]))[,2]),1])
    test2 <- test2[c(which(test2[,i] == result)),]
  }
}
csr <- strtoi(paste(test2, collapse = ""), base = 2)

answer <- ogr*csr
print(answer)

#Answer: 2981085