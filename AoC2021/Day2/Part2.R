# Day 2, part 2

input <- readLines("input.txt")

horizontal <- 0
depth <- 0
aim <- 0

for (direction in input){
  if (grepl("forward", direction)){
    horizontal <- horizontal + as.numeric(strsplit(direction, " ")[[1]][2])
    depth <- depth + (aim * as.numeric(strsplit(direction, " ")[[1]][2]))
  }
  if (grepl("up", direction)){
    aim <- aim - as.numeric(strsplit(direction, " ")[[1]][2])
  }
  if (grepl("down", direction)){
    aim <- aim + as.numeric(strsplit(direction, " ")[[1]][2])
  }
}

answer <- depth*horizontal

print(answer)