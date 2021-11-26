input <- readLines("input.txt")
input <- strsplit(input, "")[[1]]

floor_ <- 0

for (i in input){
  if (i == "(") {
    floor_ = floor_ + 1
  } else {
    floor_ = floor_ - 1
  }
}

# answer to part 1: 280



