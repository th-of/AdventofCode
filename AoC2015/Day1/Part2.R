input <- readLines("input.txt")
input <- strsplit(input, "")[[1]]

floor_ <- 0

for (i in 1:length(input)){
  if (input[i] == "(") {
    floor_ = floor_ + 1
  } else {
    floor_ = floor_ - 1
    if (floor_ == -1){
      answer <- i
      stop("Answer is here.")
    }
  }
}

# answer to part 2: 1979



