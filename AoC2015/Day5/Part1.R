# Day 5, part 1
input <- readLines("input.txt")

#Contains at least 3 vowels:
sum(grepl("a|e|i|o|u", strsplit(input[1], "")[[1]])) # > 2

# Character appears twice in a row:
grepl("([A-z])\\1{1,}", input[1])


#Does not contain: ab, cd, pq, or xy

grepl("ab|cd|pq|xy", input[1])

answers <- c()
i <- 1
for (word in input){
  if (sum(grepl("a|e|i|o|u", strsplit(word, "")[[1]]))  > 2 && grepl("([A-z])\\1{1,}", word) && !(grepl("ab|cd|pq|xy", word))){
    answers[i] <- "nice"
  } else (answers[i] <- "naughty")
  i <- i+1
}

print(sum(grepl("nice", answers)))