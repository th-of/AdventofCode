start_time <- Sys.time()
input <- readLines("input.txt")
input <- as.numeric(unlist(strsplit(input, ",")))

adult_fish <- c(rep(0, 6-length(rev(matrix(table(input))[,1]))), rev(matrix(table(input))[,1]), 0)
child_fish <- c(0, 0, 0)

# Days from rep: 6 5 4 3 2 1 0

# Adult fish:    0 0 1 2 1 1 0
# Child fish:    0 0 0

answer <- length(input)

for (day in 1:256){
  child_fish[1] <- adult_fish[7]
  answer <- answer + adult_fish[7]
  #print(answer)
  adult_fish <- c(adult_fish[7] + child_fish[3], adult_fish[1:6])
  
  child_fish[3] <- child_fish[2]
  child_fish[2] <- child_fish[1]
}
end_time <- Sys.time()
print(end_time - start_time)
print(format(answer, digits = 12))

