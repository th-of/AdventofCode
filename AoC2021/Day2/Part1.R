# Day 2, part 1

input <- readLines("input.txt")

forward <- 0
depth <- 0
down <- 0

for (direction in input){
  if (grepl("forward", direction)){
    forward <- forward + as.numeric(strsplit(direction, " ")[[1]][2])
  }
  if (grepl("up", direction)){
    depth <- depth - as.numeric(strsplit(direction, " ")[[1]][2])
  }
  if (grepl("down", direction)){
    depth <- depth + as.numeric(strsplit(direction, " ")[[1]][2])
  }
}

answer <- depth*forward

print(answer)