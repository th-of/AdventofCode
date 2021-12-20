# Day 8, part 2

input <- readLines("input3.txt")

# Parse

ins <- c()
outs <- c()

for (k in 1:length(input)){
  in_ <- strsplit(input, "\\| ")[[k]][1]
  in_ <- strsplit(strsplit(in_, " ")[[1]], "")
  ins[[k]] <- in_
}

for (l in 1:length(input)){
  out_ <- strsplit(input, "\\| ")[[l]][2]
  out_ <- strsplit(strsplit(out_, " ")[[1]], "")
  outs[[l]] <- out_
}

## Digit 1:
## cf (2)
## Digit 4:
## bcdf (4)
## Digit 7:
## acf (3)
## Digit 8:
## abcdefg (7)

digits <- function(out_){
  answers <- c()
  count <- 1
  for (i in out_){
    if (length(i) == 2){
      answers[count] <- 1
      count <- count + 1
    }
    if (length(i) == 4){
      answers[count] <- 4
      count <- count + 1
    }
    if (length(i) == 3){
      answers[count] <- 7
      count <- count + 1
    }
    if (length(i) == 7){
      answers[count] <- 8
      count <- count + 1
    }
  }
  return(answers)
}
answers <- c()
counter <- 1
for (i in 1:length(outs)){
  answers <- append(answers, digits(outs[[i]]))
}

print(length(answers))
