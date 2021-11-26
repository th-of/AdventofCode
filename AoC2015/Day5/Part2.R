# Day 5, part 2
input <- readLines("input.txt")
#input <- "uurcxstgmygtbstg"

i <- 0
answer <- c()
first <- c()
second <- c()

for (word in strsplit(input, "")){
  i <- i+1
  firstpasses <- 0
  for (n in 1:(length(word)-1)){
    beginning <- paste0(head(word, n-1), collapse = "")
    ending <- paste0(tail(word, (length(word)-(n+1)), collapse = ""))
    both <- c(beginning, ending)
    if (any(grepl(paste0(word[n:(n+1)], collapse = ""), both))){
      firstpasses <- firstpasses + 1
    }
  }
  first[i] <- firstpasses
  firstpassses <- 0
  secondpasses <- 0
  for (k in 1:(length(word)-2)){
    if ((word[k] == word[k+2])){
      secondpasses <- secondpasses + 1
    }
  }
  second[i] <- secondpasses
}
# 
# i <- 0
# for (input in input2){
#   i <- i + 1
#   if (grepl("([A-z])([A-z])\\1", input)){
#     answer[i] <- answer[i] + 1
#   }
# }
# 
print(length(which(first*second > 0)))
# #grepl("([A-z])([A-z])\\1", example)
